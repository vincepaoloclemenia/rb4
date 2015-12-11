module ApplicationHelper
	def wizard_done?
		current_user.flag >= 6 ? true : false
	end

	def to_peso(num)
		num = 0 if num == 0 || num.nil?
		number_to_currency(num, unit: "₱ ")
	end

	def to_datepicker_format(date)
		date.strftime("%m/%d/%Y")
	end

	def to_default_date_format(date)
		date.strftime("%b %d, %Y")
	end

	def is_menu_open?(menu_name)
		controller = params[:controller]
		action = params[:action]
		case menu_name
		when "dashboard"
			"open" if current_pages?(dashboard_path)
		when "data_entry"
			"open" if current_pages?(purchases_path, 
															new_sale_path, 
															new_inventory_path, 
															inventories_path) || 
								(controller.eql?('purchase_items') && action.eql?('index')) ||
								(controller.eql?('inventories') && ["show","edit"].include?(action))
		when "purchase_reports"
			"open" if current_pages?(purchase_listings_path)
		when "labor_reports"
			"open" if current_pages?(labor_hours_path)
		when "sales_reports"
			"open" if current_pages?(sales_path) ||
								(controller.eql?('sales') && action.eql?('show'))
		when "management_reports"
		when "accounts_management"
			"open" if current_pages?(company_users_path, roles_path) ||
								(controller.eql?('roles') && action.eql?('manage_permissions'))
		when "setup"
			"open" if current_pages?(client_path, brands_path, branches_path, employees_path, employee_types_path, settlements_path,
															shifts_path, units_path, categories_path, items_path, conversions_path, suppliers_path)
		when "company_setup"
			"open" if current_pages?(client_path, brands_path, branches_path)
		when "labor_setup"
			"open" if current_pages?(employees_path, employee_types_path)
		when "sales_setup"
			"open" if current_pages?(settlements_path, shifts_path)
		when "purchase_setup"
			"open" if current_pages?(units_path, categories_path, items_path, conversions_path, suppliers_path)
		else
		end	
	end

	def current_pages?(*pages)
		arr = []
		pages.each do |page|
			arr << current_page?(page)
		end
		arr.include?(true)
	end

	def net_vat_total_computation(purchase_items)
		nvt = []
		vat_rate = 0.12 #12%

		purchase_items.each do |pi|
			if pi.vat_type == "VAT-Inclusive"
				total = pi.purchase_item_total_amount.to_f
				vat = (total * vat_rate).to_f
				net = (total - vat).to_f
			elsif pi.vat_type == "VAT-Exclusive"
				vat = (pi.purchase_item_total_amount.to_f * vat_rate).to_f
				net = pi.purchase_item_total_amount.to_f
				total = (net + vat).to_f
			else #VAT-Exempted
				vat = 0.00
				net = pi.purchase_item_total_amount.to_f
				total = pi.purchase_item_total_amount.to_f
			end
			nvt << { net: net, vat: vat, total: total }
		end

		total_net = 0
		total_vat = 0
		total_amount = 0
		nvt.each do |i|
			total_net += i[:net]
			total_vat += i[:vat]
			total_amount += i[:total]
		end
		return { net: total_net, vat: total_vat, total: total_amount }
	end
end

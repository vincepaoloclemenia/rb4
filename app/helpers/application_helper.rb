module ApplicationHelper
	def wizard_done?
		current_user.flag >= 6 ? true : false
	end

	def to_peso(num)
		num = 0 if num == 0 || num.nil?
		number_to_currency(num, unit: "₱ ")
	end

	def to_datepicker_format(date)
		date.to_date.strftime("%m/%d/%Y")
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
			"open" if current_pages?(purchase_listings_path, purchase_summary_path, item_purchase_detail_path)
		when "labor_reports"
			"open" if current_pages?(labor_hours_path, man_hours_path)
		when "sales_reports"
			"open" if current_pages?(sales_path) ||
								(controller.eql?('sales') && action.eql?('show'))
		when "management_reports"
			"open" if current_pages?(directionals_path, invoice_entry_report_path, price_movement_report_path, profit_and_losses_path)
		when "accounts_management"
			"open" if current_pages?(company_users_path, roles_path) ||
								(controller.eql?('roles') && action.eql?('manage_permissions'))
		when "setup"
			"open" if current_pages?(client_path, brands_path, employees_path, employee_types_path, settlements_path,
															shifts_path, units_path, categories_path, items_path, conversions_path, suppliers_path) ||
															(controller.eql?('brands') && action.eql?('show'))
		when "company_setup"
			"open" if current_pages?(client_path, brands_path) || (controller.eql?('brands') && action.eql?('show'))
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

	def to_percentage(first_value, second_value)
		val = (((first_value/second_value) * 100).round(2)).abs
		return val.to_s + '%'
	end

	def brand_pane_active?(pane_name)
		if params[:brand_pane] && pane_name.eql?('branches')
			return "active"
		elsif params[:brand_pane].nil? && pane_name.eql?('info')
			return "active"
		else
			return ""
		end
	end


	#from RestoBot v3
	def rank_number(page_number)  
    if page_number.to_i == 1 || page_number.to_i == 0 
      rank_number = 1 
    else
      rank_number = page_number.to_i * 100
      rank_number = rank_number.to_i - 99
    end 
    rank_number
  end

  def vat_computation_summary(purchase)
    vcs = []
    purchase.each do |pi|
      @vat_rate = 12
      @vat_rate_value = @vat_rate.nil? ? 1 : (@vat_rate/ 100)
      @vat_value = 0

      if pi.vat_type == "VAT-Inclusive" 
        @purchase_item_total_amount = (pi.purchase_item_total_amount.to_f)  
        @vat_value = (pi.purchase_item_total_amount.to_f  / 1.12) * 0.12
        @purchase_item_amount = (pi.purchase_item_total_amount.to_f) - @vat_value.to_f 
      elsif pi.vat_type == "VAT-Exclusive" 
        # @vat_value = (pi.purchase_item_total_amount.to_f * 0.12) 
        # @purchase_item_amount = (pi.purchase_item_total_amount.to_f + @vat_value.to_f) 
        # @purchase_item_total_amount = (pi.purchase_item_total_amount.to_f) 
        @vat_value = (pi.purchase_item_total_amount.to_f * 0.12)
        @purchase_item_amount = pi.purchase_item_total_amount.to_f 
        @purchase_item_total_amount = (pi.purchase_item_total_amount.to_f + @vat_value) 
      else
        @vat_value = 0.00 
        @purchase_item_amount = (pi.purchase_item_total_amount.to_f) 
        @purchase_item_total_amount = (pi.purchase_item_total_amount.to_f) 
      end #if else ends
      vcs << {vat: @vat_value, purchase: @purchase_item_amount.to_f, net: @purchase_item_total_amount.to_f, idtest: pi.id}
    end #each do end

    val = []
    vat = 0
    purchaseamount = 0
    totalpurchase = 0
      vcs.each do |a|
        vat += a[:vat]
        purchaseamount += a[:purchase]
        totalpurchase += a[:net]
      end

    val << purchaseamount
    val << vat
    val << totalpurchase
    return val 
      #val[0] = netamount val[1] = vat val[2]=totalpurchase 
  end

end

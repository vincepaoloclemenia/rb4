module ApplicationHelper

	def present( object, klass=nil )
		klass ||= "#{object.class}Presenter".constantize
		presenter = klass.new(object, self)
		yield presenter if block_given?
		presenter
	end

	def wizard_done?
		current_user.flag >= 6 ? true : false
	end

	def to_peso(num)
		num = 0 if num == 0 || num.nil?
		number_to_currency(num, unit: get_currency(current_brand.currency || "php"))
	end

	def get_currency(symbol)
		currency_symbols = {
			php: "₱ ",
			usd: "$ ",
			hkd: "HK$ "
		}
		return currency_symbols[symbol.to_sym]
	end

	def to_dollar(num)
		num = 0 if num == 0 || num.nil?
		number_to_currency(num, unit: "$ ")		
	end

	def to_datepicker_format(date)
		date.to_date.strftime("%m/%d/%Y")
	end

	def what_controller?(name, action)
		controller.controller_name == name && controller.action_name == action ? 'active-link' : ''
	end

	def to_default_date_format(date)
		return " - " if date.blank?
		date.strftime("%b %d, %Y")
	end

	def pdf_image_tag(image, options = {})
		options[:src] = File.expand_path(Rails.root) + '/public' + image
		tag(:img, options)
	end

	def is_menu_open?(menu_name)
		controller = params[:controller]
		action = params[:action]
		case menu_name
		when "dashboard"
			"open" if controller == menu_name && action == 'index'
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
			"open" if current_pages?(employees_path, timesheets_path)
		when "sales_reports"
			"open" if current_pages?(sales_path) ||
								(controller.eql?('sales') && action.eql?('show'))
		when "management_reports"
			"open" if current_pages?(directionals_path, item_cost_analysis_reports_path, invoice_entry_report_path, price_movement_report_path, profit_and_losses_path)
		when "accounts_management"
			"open" if current_pages?(company_users_path, roles_path) ||
								(controller.eql?('roles') && action.eql?('manage_permissions'))
		when "setup"
			"open" if current_pages?(tax_types_path, non_misces_path, statistics_path, client_path, brands_path, employee_benefits_path, employee_types_path, settlements_path,
															shifts_path, units_path, categories_path, items_path, conversions_path, suppliers_path) ||
															(controller.eql?('brands') && action.eql?('show'))
		when "company_setup"
			"open" if current_pages?(tax_types_path, client_path, brands_path) || (controller.eql?('brands') && action.eql?('show'))
		when "purchasing"
			"open" if current_pages?(purchase_orders_listing_index_path, purchase_order_generator_index_path, purchase_orders_path, purchase_orders_summary_index_path) || (controller.eql?('purchase_order_generator') && action.eql?('index')) || (controller.eql?('purchase_orders_summary') && action.eql?('index')) || (controller.eql?('purchase_orders') && action.eql?('index'))
		when "labor_setup"
			"open" if current_pages?(employee_benefits_path, employee_types_path)
		when "sales_setup"
			"open" if current_pages?(non_misces_path, statistics_path, settlements_path, shifts_path)
		when "purchase_setup"
			"open" if current_pages?(units_path, categories_path, items_path, conversions_path, suppliers_path)
		when "subscriptions"
			"open" if current_pages?(subscriptions_path)
		when "billing"
			"open" if current_pages?(bills_path)
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
		val = first_value == 0 || second_value == 0 ? 0 : (((first_value/second_value) * 100).round(2)).abs
		val = check_value_if_nan(val)
		return val.to_s + '%'
	end

	def check_value_if_nan(variable)
    variable.is_a?(Float) && variable.nan? ? variable = 0.00 : variable = variable
    return variable
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

	def per_page
		return 10 if params[:show].blank?
		params[:show].eql?('all') ? current_brand.purchases.count : params[:show]
	end
	
	def sales_status(branch, from, to)
		if branch.sales.invalid_sales? || branch.daily_average_sales == 0
			return "NA"				
		else
			branch.daily_average_sales <= branch.average_sales(from, to) ? "Good" : "Unwell"
		end
	end

	def link_to_add_fields(name, f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
			render(association.to_s.singularize + "_fields", f: builder)
		end
		link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")} )
	end

end

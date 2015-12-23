class ReportsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def purchase_listings
		if params[:q]
			if params[:q][:purchase_date_cont].present?
				params[:q][:purchase_date_gteq] = Date.strptime(params[:q][:purchase_date_cont].split(" - ")[0], "%m/%d/%Y").to_s
				params[:q][:purchase_date_lteq] = Date.strptime(params[:q][:purchase_date_cont].split(" - ")[1], "%m/%d/%Y").to_s
				params[:q].delete(:purchase_date_cont)
			end
		end
		@q = current_brand.purchases.ransack(params[:q])
		@purchases = @q.result
		@suppliers = (current_client.suppliers.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq

		respond_to do |format|
			format.html
      format.pdf do
        render :pdf         	=> "Purchase List Reports",
                :orientation  => 'Landscape',
                :page_width   => '13in',
                :margin => {:top       => 1,
                             :bottom   => 1} 
      end
    end
	end

	#PRICE MOVEMENT REPORT
	def price_movement_report
		
		@date_range = drp_strip_date(params[:date_range])
		@categories = Category.where(brand_id: current_brand)
		@purchase_ids = Purchase.select(:id).where(purchase_date: @date_range, brand_id: current_brand, branch_id: params[:branch_id])
		@purchase = Purchase.select(:id).where	
		if params[:item_id].present?
			@purchase_items = PurchaseItem.where(item_id: params[:item_id])
		else
			@purchase_items = PurchaseItem.where(purchase_id: @purchase_id)
		end
	end	

	def update_item
		@items = Item.where(category_id: params[:category_id])
	end

	#INVOICE ENTRY REPORT
	def invoice_entry_report
		@date_range = drp_strip_date(params[:date_range])
		@purchases = Purchase.where(purchase_date: @date_range, branch_id: params[:branch_id], brand_id: current_brand).order(:invoice_number, :created_at)
	end

	def drp_strip_date(date)
		if params[:date_range].present?
      date_range = params[:date_range].split(' - ')
      beg_date = Date.strptime(date_range[0], '%m/%d/%Y')
      end_date = Date.strptime(date_range[1], '%m/%d/%Y')
      daterange = beg_date..end_date
    else
      daterange = Date.today
    end
    return daterange
	end

	def man_hours
		if params[:date_entry].present? && params[:branch_id].present?
			@date = params[:date_entry]
			@branch = Branch.find(params[:branch_id])
      @man_hours = EmployeeType.labor_hours_by_sale_category(@date,@branch,current_brand)
		else
			@date = Date.today.strftime("%m/%d/%y")
      @man_hours = EmployeeType.all
		end
  end
end
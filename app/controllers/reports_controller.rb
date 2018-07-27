class ReportsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def purchase_listings
		process_ransack_purchase_date_range!

		@q = current_brand.purchases.ransack(params[:q])
		@purchases = current_brand.purchases
		@suppliers = (current_client.suppliers.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq

		respond_to do |format|
			format.html
			format.xlsx
      format.pdf do
        render :pdf         	=> "Purchase List Report",
                :orientation  => 'Landscape',
                :page_width   => '13in',
                :margin => {:top       => 1,
                             :bottom   => 1} 
      end
    end
	end

	def purchase_summary
		require 'will_paginate/array'
		process_ransack_purchase_date_range!

		@q = current_user.role.role_level.eql?("branch") ? current_user.branch.purchases.ransack(params[:q]) : current_brand.purchases.ransack(params[:q])
		@purchases = @q.result
		@purchase_items = item_summary_with_rank(PurchaseItem.where(purchase_id: @purchases.ids).order("purchase_item_total_amount DESC")).paginate(:page => params[:page], :per_page => 100)

		respond_to do |format|
			format.html
			format.xlsx
      format.pdf do
        render :pdf         	=> "Purchase Summary Report",
                :orientation  => 'Landscape',
                :page_width   => '13in',
                :margin => {:top       => 1,
                             :bottom   => 1} 
      end
    end
	end

	def item_purchase_detail
		if params[:q] && params[:q][:purchase_purchase_date_cont].present?
			params[:q][:purchase_purchase_date_gteq] = Date.strptime(params[:q][:purchase_purchase_date_cont].split(" - ")[0], "%m/%d/%Y").to_s
			params[:q][:purchase_purchase_date_lteq] = Date.strptime(params[:q][:purchase_purchase_date_cont].split(" - ")[1], "%m/%d/%Y").to_s
			params[:q].delete(:purchase_purchase_date_cont)
		else
			params[:q] = {}
			params[:q][:purchase_purchase_date_gteq] = (Date.today.at_beginning_of_week - 1.day).to_s
			params[:q][:purchase_purchase_date_lteq] = (Date.today.at_end_of_week - 1.day).to_s
		end
		
		@q = current_brand.purchase_items.ransack(params[:q])
		@purchases = @q.result.order("purchase_item_total_amount DESC").paginate(:page => params[:page], :per_page => 30)
		@suppliers = (current_client.suppliers.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq

		@total_purchase = 0
    @total_amount = 0

		respond_to do |format|
			format.html
			format.xlsx
      format.pdf do
        render :pdf         	=> "Item Purchase Details",
                :orientation  => 'Landscape',
                :page_width   => '13in',
                :margin => {:top       => 1,
                             :bottom   => 1} 
      end
    end
	end

	def process_ransack_purchase_date_range!
		if params[:q] && params[:q][:purchase_date_cont].present?
			params[:q][:purchase_date_gteq] = Date.strptime(params[:q][:purchase_date_cont].split(" - ")[0], "%m/%d/%Y").to_s
			params[:q][:purchase_date_lteq] = Date.strptime(params[:q][:purchase_date_cont].split(" - ")[1], "%m/%d/%Y").to_s
			params[:q].delete(:purchase_date_cont)
		else
			params[:q] = {}
			params[:q][:purchase_date_gteq] = (Date.today.at_beginning_of_week - 1.day).to_s
			params[:q][:purchase_date_lteq] = (Date.today.at_end_of_week - 1.day).to_s
		end
	end

	#PRICE MOVEMENT REPORT
	def price_movement_report

	end	

	def get_purchased_items_per_item
		if params[:item_id] && params[:date]
			@item = Item.find params[:item_id]
			@from = params[:date].split(" - ")[0].to_date
			@to = params[:date].split(" - ")[1].to_date
			if @item.present?
				@purchase_items = if branch_admin?
														current_user.branch.purchase_items.includes(:purchase, :branch).where( item_id: @item.id, purchases: { purchase_date: @from..@to } )
												else
														current_brand.purchase_items.includes(:purchase, :branch).where( item_id: @item.id, purchases: { purchase_date: @from..@to } )
												end
			end
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

	#LABOR REPORTS
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

  def item_summary_with_rank(purchases)
    purchase_hash = []
    values = []
    purchases = purchases.group_by do |purchase|
      purchase.purchase.branch.name
    end
    
    purchases.each do |key,rows|
      branch = key
      items = rows.group_by do |p|
        p.item.name
      end  
      items.each do |key,rows|
        unit = rows.first.item.unit.name
        quantity = rows.map(&:quantity).reject{|qty| qty.nil?}.inject(:+)
        net_amount = rows.map(&:purchase_item_total_amount).reject{|a| a.nil?}.inject(:+)
        unit_cost = net_amount.to_f / quantity.to_f
        purchase_hash << {name: key.to_s, branch: branch.to_s, unit: unit, cost: unit_cost.to_f, net_amount: net_amount.to_f, quantity: quantity.to_f}
      end
    end
    purchase_hash = purchase_hash.sort {|a,b| b[:net_amount].to_f <=> a[:net_amount].to_f }  
    purchase_hash
  end
end
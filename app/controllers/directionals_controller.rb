class DirectionalsController < ApplicationController
	before_action :authenticate_user!

	def index
		@category = current_brand.categories.saleable
		@settlements = Settlement.find_by_client_id(current_brand.client_id)
		@branches = current_client.on_free_trial? ? current_brand.branches : current_brand.subscribed_branches
		if params[:date_entry].present?
      @branch = params[:branch_id]
      @ending_date = Date.strptime(params[:date_entry], "%m/%d/%Y")
    else
    	@branch = Branch.find_by_brand_id(current_brand.id)
    	@ending_date = Date.today
    end
    @title_and_column_array = title_and_column_array
    @beginning_date = @ending_date.beginning_of_month
    @directional = Directional.new(@beginning_date, @ending_date, @branch)
    @sale = Sale.where(sale_date: @beginning_date..@ending_date, branch_id: @branch)
    #query
		@sale_by_category_entries = SaleByCategoryEntry.where(sale_id: @sale.map(&:id)).group_by do |sbce|
      sbce.category.name
    end
    #query
    @sale_by_settlement_entries = SaleBySettlementEntry.where(sale_id: @sale.map(&:id)).group_by do |sbse|
      sbse.settlement.name
    end
    generate_pdf
	end

	def title_and_column_array
		title = [["Customer Count", :customer_count, 'n'], ["Per Person Average", :customer_count, 'ave'],
						 ["Transaction Count", :transaction_count, 'n'], ["Per Transaction Average", :transaction_count, 'ave'], 
						 ["Delivery Transaction Count", :delivery_transaction_count, 'n'], ["Delivery Sales Amount", :delivery_sales, 'n'], 
						 ["Per Delivery Transaction Average", :delivery_transaction_count, 'ave'], ["Credit Card Transaction Count", :credit_card_transaction_count, 'n'], 
						 ["Credit Card Sales Amount", :credit_card_sales, 'n'], ["Per Credit Card Transaction Ave", :transaction_count, 'ave']]
	end

	def generate_pdf
		respond_to do |format|
			format.pdf do
				render 	pdf: "Directional List",
								orientation: "Landscape",
								page_width:  '13in',
								:margin => {top: 1,
														bottom: 1}
			end
      format.csv { send_data @directional.to_csv}
      format.xls { headers["Content-Disposition"] = "attachment; filename=\"DirectionalReports.xls\"" }
			format.html
		end
	end

end
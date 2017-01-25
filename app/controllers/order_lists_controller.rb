class OrderListsController < ApplicationController
		before_action :authenticate_user!
		before_action :access_control

		def index
			# get_total_order_lists_per_branch
			# if params[:q]
			# 	if params[:q][:order_list_date_cont].present?
			# 		params[:q][:order_list_date_gteq] = Date.strptime(params[:q][:order_list_date_cont].split(" - ")[0], "%m/%d/%Y").to_s
			# 		params[:q][:order_list_date_lteq] = Date.strptime(params[:q][:order_list_date_cont].split(" - ")[1], "%m/%d/%Y").to_s
			# 		params[:q].delete(:order_list_date_cont)
			# 	end
			# end
			# @q = current_brand.order_lists.ransack(params[:q])
			# @order_lists = @q.result.paginate(page: params[:page], per_page: per_page)
			@order_lists = OrderList.paginate(page: params[:page], per_page: per_page)
			@order_list = OrderList.new
			@suppliers = (Supplier.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq
		end

		def create
			@order_list = OrderList.new(order_list_params)
			# @order_list.user_created_by_id = current_user.id
			respond_to do |format|
				if @order_list.save
					index
					@success = true
					flash[:notice] = "order_list successfully created"
				else
					@success = false
					flash[:alert] = @order_list.errors.full_messages.join(", ")
				end
				format.js
			end
		end

		private

		def order_list_params
			# if params[:order_list][:order_list_date].present?
			# 	params[:order_list][:order_list_date] = Date.strptime(params[:order_list][:order_list_date], "%m/%d/%Y").to_s
			# end
			params.require(:order_list).permit(:po_date, :po_number, :terms, :remarks, :supplier_id)
		end

		def per_page
			params[:show].eql?('all') ? current_brand.order_lists.count : params[:show]
			return 10 if params[:show].nil?
		end
end

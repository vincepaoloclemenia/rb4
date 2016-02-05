class UnitsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :get_all, only: [:index, :create]
	before_action :set_unit, only: [:edit, :update]

	def index
	end

	def new
		@unit = current_brand.units.new
	end

	def edit
	end

	def create
		@unit = current_brand.units.new(unit_params)
		respond_to do |format|
			if @unit.save
				format.json { head :no_content }
				format.js { flash[:notice] = "Unit successfully created" }
			else
				format.json { render json: @unit.errors,
														status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @unit.update(unit_params)
				format.json { head :no_content }
				format.js { flash[:notice] = "Unit successfully updated" }
			else
				format.json { render json: @unit.errors,
														status: :unprocessable_entity }
			end
		end
	end

	def destroy
		unit = Unit.find(params[:id])
		unit.update(is_deleted: true)
		# params.delete(:id)
		@units = current_brand.units.not_deleted.paginate(page: params[:page], per_page: per_page)
		respond_to do |format|
			format.js { flash[:notice] = "Unit successfully deleted" }
			format.html { redirect_to units_path, notice: "Unit successfully deleted" }
			format.json { head :no_content }
		end
	end

	private
		def get_all
			if params[:q]
				if params[:q][:purchase_date_cont].present?
					params[:q][:purchase_date_gteq] = Date.strptime(params[:q][:purchase_date_cont].split(" - ")[0], "%m/%d/%Y").to_s
					params[:q][:purchase_date_lteq] = Date.strptime(params[:q][:purchase_date_cont].split(" - ")[1], "%m/%d/%Y").to_s
					params[:q].delete(:purchase_date_cont)
				end
			end
			@q = current_brand.units.not_deleted.ransack(params[:q])
			@units = @q.result.paginate(page: params[:page], per_page: per_page)
		end

		def unit_params
			params.require(:unit).permit(:name, :symbol, :remarks, :is_active, :track_as_sales)
		end

		def per_page
			return 10 if params[:show].blank?
			params[:show].eql?('all') ? current_brand.units.not_deleted.count : params[:show]
		end

		def set_unit
			@unit = current_brand.units.find(params[:id])
		end
end
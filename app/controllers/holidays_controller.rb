class HolidaysController < ApplicationController
    before_action :authenticate_user!
    before_action :find_holiday, only: [:edit, :update, :destroy]

    def index
        @holidays = current_brand.holidays
        @empty_warning = current_brand.holidays.empty? ? "block" : "none"
    end

    def new
        @holiday = current_brand.holidays.new
    end

    def create
        @holiday = current_brand.holidays.new(holiday_params)
        @holiday.date = params[:holiday][:date].present? ? Date.strptime(params[:holiday][:date], '%m/%d/%Y') : nil
        respond_to do |format|
            if @holiday.save
                @holidays = current_brand.holidays
				format.json { head :no_content }
				format.js { flash[:notice] = "Holiday schedule successfully created" }
			else
				format.json { render json: @holiday.errors, status: :unprocessable_entity }
			end
		end
    end

    def edit
    end

    def update
        @holiday.update(holiday_params)   
        @holiday.date = Date.strptime(params[:holiday][:date], '%m/%d/%Y')             
        respond_to do |format|
            if @holiday.save
                @holidays = current_brand.holidays
				format.json { head :no_content }
				format.js { flash[:notice] = "Employee benefit successfully saved" }
			else
				format.json { render json: @holiday.errors, status: :unprocessable_entity }
			end
		end
    end

    def destroy
        respond_to do |format|
			if @holiday.destroy
				format.json { head :no_content }
				format.js { flash[:notice] = "Employee Benefit has been deleted" }
			else
				format.json { render json: @holiday.errors, status: :unprocessable_entity }
			end
		end
    end
    
    private

        def holiday_params
            params.require(:holiday).permit(:brand_id, :name, :description, :date)
        end

        def find_holiday
            @holiday = current_brand.holidays.find params[:id]
        end
end
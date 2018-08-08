class StatisticsSetupController < ApplicationController
    before_action :authenticate_user!
    before_action :set_stat, only: [:edit, :update, :destroy]

    def index
        @statistics = current_client.statistics
    end

    def new
        @statistic = current_client.statistics.new
    end

    def create
        @statistic = current_client.statistics.new(stats_params)
        respond_to do |format|
			if @statistic.save
				format.json { head :no_content }
				format.js { flash[:notice] = "Statistic category successfully created" }
			else
				format.json { render json: @statistic.errors, status: :unprocessable_entity }
			end
		end
    end

    def edit
    end

    def update
        respond_to do |format|
			if @statistic.update(stats_params)
				format.json { head :no_content }
				format.js { flash[:notice] = "Statistic category successfully updated" }
			else
				format.json { render json: @statistic.errors, status: :unprocessable_entity }
			end
		end
    end

    def destroy
        respond_to do |format|
			if @statistic.destroy
				format.json { head :no_content }
				format.js { flash[:notice] = "Statistic has been deleted" }
			else
				format.json { render json: @statistic.errors, status: :unprocessable_entity }
			end
		end
    end

    private

        def stats_params
            params.require(:statistic).permit(:description, :name, :is_active)
        end

        def set_stat
            @statistic = current_client.statistics.find params[:id]
        end
    
end
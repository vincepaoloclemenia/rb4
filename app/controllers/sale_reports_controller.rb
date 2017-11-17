class SaleReportsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_report, only: :show
    def show
        @colours = current_brand.branches.all.map { |b| b.color }
    end

    private
        def find_report
            @sale_report = SaleReport.find(params[:id])
        end
end
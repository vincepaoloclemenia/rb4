class TimesheetsController < ApplicationController
    before_action :authenticate_user!

    def index
        @purchases = current_brand.purchases.group_by(&:purchase_date)
        @date = params[:date] ? Date.parse(params[:date]) : Date.today
    end

end
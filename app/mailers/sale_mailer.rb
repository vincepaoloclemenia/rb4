class SaleMailer < ApplicationMailer
	require 'mail'
    default from: "restobot@talentium.ph"

    def send_sale_record(sale, emails, name)
        @sale = sale
        @emails = emails.join(",")
        @name = name
        @sale_date = @sale.sale_date
        @branch = @sale.branch
        @brand = @branch.brand
		@total = @sale.sale_by_category_entries.map(&:amount).sum
		mtd_total = @branch.get_total_mtd_sales_all_cat(@sale.sale_date)
		@mtd_total = mtd_total[:total]
		@mtd_ave = mtd_total[:ave]
		ytd_total = @branch.get_total_ytd_sales_all_cat(@sale.sale_date)
		@ytd_total = ytd_total[:total]
		@ytd_ave = ytd_total[:ave]
		@gen_transaction = @brand.client.statistics.general_transaction
		@sales_stat_gt = @sale.sales_stats.where(statistic_id: @gen_transaction.id).sum(:count)
		@mtd_stats_gt = @branch.get_mtd_sales_stats(@gen_transaction.id, @sale.sale_date).to_d
		@ytd_stats_gt = @branch.get_ytd_sales_stats(@gen_transaction.id, @sale.sale_date).to_d
        @symbols = {
			php: "₱ ",
			usd: "$ ",
			hkd: "HK$ "
        }
        @currency = @symbols[(@brand.currency || "php").to_sym]
        mail(from: "#{@name} <restobot@talentium.ph>", to: @emails, subject: "#{@name} | Sale record: #{@sale.sale_date.strftime('%B %d, %Y')}", content_type: 'text/html')
    end
end
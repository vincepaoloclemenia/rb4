desc 'update_customer_count'
task update_customer_count: :environment do
	Sale.update_customer_count
end

task save_customer_count_to_dashboard: :environment do
	Sale.save_customer_count_to_dashboard
end
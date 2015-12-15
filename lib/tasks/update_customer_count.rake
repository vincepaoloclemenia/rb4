desc 'update_customer_count'
task update_customer_count: :environment do
	Sale.update_customer_count
end 
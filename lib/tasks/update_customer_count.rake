desc 'update customer count'
task update_customer_count: :environment do 
	DashboardsController.index(1)
end
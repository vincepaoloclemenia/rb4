# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
# Learn more: http://github.com/javan/whenever

set :environment, :development
set :output, "log/cron.log"

# every 1.minute do
# 	runner 'Dashboard.sample'
# end

every :day, at: '2am' do 
	runner 'Dashboard.populate_dashboard'
end 

every :day, :at => '4:00am' do
	runner 'Subscription.process_cancelled_subscriptions'
	runner 'Subscription.process_free_trial_subscriptions'
end

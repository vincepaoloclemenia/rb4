set :rails_env, :production
set :branch, :production
set :deploy_to, '/home/RestoBotV4'
set :user, :RestoBotV4
set :nginx_server_name, '13.76.100.242'
set :linked_files, %w[config/database.yml tmp/pids/unicorn.pid log/unicorn.log]
set :worker_processes, 4
set :timeout, 30
server '13.76.100.242', user: 'RestoBotV4', roles: %w[web app]

set :ssh_options, {
	forward_agent: true
}

set :whenever_environment, 'production'
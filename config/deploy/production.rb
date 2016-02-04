set :rails_env, :production
set :branch, :production
set :deploy_to, '/home/restobotv4'
set :user, :restobotv4
set :nginx_server_name, 'restobotv4.cloudapp.net'
set :linked_files, %w[config/database.yml tmp/pids/unicorn.pid log/unicorn.log]
set :worker_processes, 4
set :timeout, 30
server 'restobotv4.cloudapp.net', user: 'restobotv4', roles: %w[web app]

set :ssh_options, {
	forward_agent: true
}

set :whenever_environment, 'production'
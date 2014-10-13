# Define the name of the application
set :application, 'DelNorte'

# Define where can Capistrano access the source repository
# set :repo_url, 'https://github.com/[user name]/[application name].git'
set :scm, :git
set :repo_url, 'https://github.com/M-S-H/Del-Norte.git'

# Define where to put your application code
set :deploy_to, "/home/apps/DelNorte"

set :rails_env, "production"

set :default_env, {rvm_bin_path: '~/.rvm/bin'}

set :pty, true

set :format, :pretty

set :rails_env, :production
#set :unicorn_binary, "/usr/bin/unicorn"
#set :unicorn_config, "/home/apps/DelNorte/current/config/unicorn.rb"
#set :unicorn_pid, "/home/apps/DelNorte/current/tmp/pids/unicorn.pid"

=begin
SSHKit.config.command_map[:unicorn_rails] = "/usr/local/rvm/gems/ruby-2.0.0-p353/bin/unicorn_rails"

@unicorn_config = "/home/apps/DelNorte/current/config/unicorn.rb"
@unicorn_pid = "/home/apps/DelNorte/current/tmp/pids/unicorn.pid"

namespace :deploy do

	task :stop do
		on roles :app do
			execute "sh /home/apps/stop.sh"
		end
	end

	task :start do
		on roles :app do
			with path: '/usr/local/rvm/gems/ruby-2.0.0-p353/bin:$PATH' do
				execute :unicorn_rails, "-c /home/apps/DelNorte/current/config/unicorn.rb -E production -D"
			end
		end
	end

	task :restart do 
		stop
		start
	end
end
=end

task :test do
	on roles(:app) do
		execute "service unicorn restart"
	end
end

namespace :deploy do

end

# Set the post-deployment instructions here.
# Once the deployment is complete, Capistrano
# will begin performing them as described.
# To learn more about creating tasks,
# check out:
# http://capistranorb.com/

# namespace: deploy do

#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       # Your restart mechanism here, for example:
#       execute :touch, release_path.join('tmp/restart.txt')
#     end
#   end

#   after :publishing, :restart

#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end

# end
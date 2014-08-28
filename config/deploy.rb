# Define the name of the application
set :application, 'DelNorte'

# Define where can Capistrano access the source repository
# set :repo_url, 'https://github.com/[user name]/[application name].git'
set :scm, :git
set :repo_url, 'git@github.com:M-S-H/Del-Norte.git'

# Define where to put your application code
set :deploy_to, "/home/deployer/apps/DelNorte"

set :pty, true

set :format, :pretty

set :default_env, { rvm_bin_path: '~/.rvm/bin' }

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





# config valid only for Capistrano 3.1

=begin
lock '3.2.1'

set :application, 'DelNorte'
set :repo_url, 'git@github.com:M-S-H/Del-Norte.git'

set :deploy_to, '/home/deploy/DelNorte'

#set :linked_files, %w{config/database.yml}
#set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

	desc 'Restart application'
	task :restart do
		on roles(:app), in: :sequence, wait: 5 do
			execute :touch, release_path.join('tmp/restart.txt')
		end
	end

	after :publishing, 'deploy:restart'
	after :finishing, 'deploy:cleanup'
end
=end


=begin
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/root/'

# Default value for :scm is :git
set :scm, :git
set :branch, "master"

set :user, 'root'

set :rails_env, 'production'

set :deoply_via, 'copy'

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

	desc 'Restart application'
	task :restart do
		on roles(:app), in: :sequence, wait: 5 do
			# Your restart mechanism here, for example:
			# execute :touch, release_path.join('tmp/restart.txt')
		end
	end

	after :publishing, :restart

	after :restart, :clear_cache do
		on roles(:web), in: :groups, limit: 3, wait: 10 do
			# Here we can do anything such as:
			# within release_path do
			#   execute :rake, 'cache:clear'
			# end
		end
	end

end
=end
# Define the name of the application
set :application, 'DelNorte'

# Define where can Capistrano access the source repository
# set :repo_url, 'https://github.com/[user name]/[application name].git'
set :scm, :git
set :repo_url, 'https://github.com/M-S-H/Del-Norte.git'
#set :scm_username, "git_username"
#set :scm_password, "git_password"

# Define where to put your application code
set :deploy_to, "/home/apps/DelNorte"

set :rails_env, "production"

set :default_env, {rvm_bin_path: '~/.rvm/bin'}

set :pty, true

set :format, :pretty

set :rails_env, :production

task :restart do
	on roles(:app) do
		execute "service unicorn restart"
	end
end
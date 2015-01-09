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

set :default_env, {
	rvm_bin_path: '~/.rvm/bin',
	'SECRET_KEY_BASE' => '35e5352b7431887d7707cbc912848abe4566c3ca124b8f654f30ccad999114dd022c6026d79479cfadc769b459ea285c96ddaeb314c9f863aa543c3a0d6d68ff'
}

set :pty, true

set :format, :pretty

set :rails_env, :production

task :restart do
	on roles(:app) do
		execute "service unicorn restart"
	end
end

task :seed do
	on roles(:app) do 
		execute "rake db:seed"
	end
end
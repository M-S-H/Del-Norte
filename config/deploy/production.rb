# Define roles, user and IP address of deployment server
# role :name, %{[user]@[IP adde.]}
role :app, %w{root@107.170.197.50}
role :web, %w{root@107.170.197.50}
role :db,  %w{root@107.170.197.50}

# Define server(s)
server '107.170.197.50', user: 'root', roles: %w{web}

# SSH Options
# See the example commented out section in the file
# for more options.

set :ssh_options, {
    forward_agent: false,
    auth_methods: %w(password),
    password: 'Hick_man1',
    user: 'root',
}
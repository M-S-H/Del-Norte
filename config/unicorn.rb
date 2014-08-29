@dir = "/home/apps/DelNorte/current"
working_directory @dir

worker_processes 3
timeout 30
preload_app true


# Set process id path
pid "#{@dir}/tmp/pids/unicorn.pid"

# Set log file paths
stderr_path "#{@dir}/log/unicorn.stderr.log"
stdout_path "#{@dir}/log/unicorn.stdout.log"
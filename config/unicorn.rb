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

=begin
before_fork do |server, worker|
	ActiveRecord::Base.connection.disconnect!

	old_pid = "#{server.config[:pid]}.oldbin"
	if File.exists?(old_pid) && server.pid != old_pid
		begin
			Process.kill("QUIT", File.read(old_pid).to_i)
		rescue Errno::ENOENT, Errno::ESRCH
			# someone else did our job for us
		end
	end
end

after_fork do |server, worker|
	ActiveRecord::Base.establish_connection
end
=end
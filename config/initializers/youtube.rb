require 'yt'

Yt.configure do |config|
	config.api_key = ENV['YOUTUBE_PUBLIC']
	config.log_level = :debug
	# config.api_key = 'AIzaSyAbSP0sadpb6TXOa7gw59U-Vogi8Qh3ePw'
end
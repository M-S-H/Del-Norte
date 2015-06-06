require 'yt'

Yt.configure do |config|
	#config.api_key = ENV['YOUTUBE_PUBLIC']
	config.api_key = 'AIzaSyAbSP0sadpb6TXOa7gw59U-Vogi8Qh3ePw'
end

SERMONS = Yt::Playlist.new id: 'PLZLN8ggsIxePmqamBkTYJEYHY-3sgenkQ'
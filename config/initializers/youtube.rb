require 'yt'

Yt.configure do |config|
	config.api_key = ENV['YOUTUBE_PUBLIC']
end

SERMONS = Yt::Playlist.new id: 'PLZLN8ggsIxePmqamBkTYJEYHY-3sgenkQ'
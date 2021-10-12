class ApplicationController < ActionController::Base
	after_filter :set_access_control_headers
	protect_from_forgery with: :exception

	def set_access_control_headers 
		#headers['Access-Control-Allow-Origin'] = 'http://localhost:8081/' 
		headers['Access-Control-Request-Method'] = '*' 
	end

	def index
		@alert = Alert.first
		playlist = Yt::Playlist.new id: 'PLZLN8ggsIxePmqamBkTYJEYHY-3sgenkQ'
		@sermon = playlist.playlist_items.find {|x| x.public? }
		@show_popup = false
		if @sermon && @sermon.video.live_broadcast_content != "none"
			@show_popup = true
		end

		# @sermons = playlist.playlist_items.map {|pi| pi}[0..11]
		# @image = @sermons.first.snippet.data["thumbnails"]["high"]["url"]
		# @image = Base64.encode64(open(@image).read)
	end

	def download_jan
		send_file(
			"public/January2015.pdf",
			filename: "January2015.pdf",
			type: "application/pdf"
		)
	end

	def download_feb
		send_file(
			"public/February2015.pdf",
			filename: "February2015.pdf",
			type: "application/pdf"
		)
	end

end

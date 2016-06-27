class SermonsController < ApplicationController
	before_action :set_sermon, only: [:show, :edit, :update, :destroy]

	# GET /sermons
	# GET /sermons.json
	def index
		playlist = Yt::Playlist.new id: 'PLZLN8ggsIxePmqamBkTYJEYHY-3sgenkQ'

		@sermons = playlist.playlist_items.map {|pi| pi}[0..11]
		@image = @sermons.first.snippet.data["thumbnails"]["high"]["url"]
		@image = Base64.encode64(open(@image).read)
	end

	def change_sermon
		@sermon = Yt::Video.new id: params[:id]
		@image = @sermon.snippet.data["thumbnails"]["high"]["url"]
		@image = Base64.encode64(open(@image).read)
		@player = @sermon.embed_html.html_safe
		@id = params[:id]
	end

	# GET /sermons/1
	# GET /sermons/1.json
	def show
		@sermon = VIDEO_CLIENT.my_video params[:id]
		@image = @sermon.thumbnails[3].url
		@image = Base64.encode64(open(@image).read)
		@player = @sermons[0].embed_html5({
			:class => 'video-player', :id => 'my-video',
			:width => '560',
			:height => '315',
			:frameborder => '0', 
			:controlls => '0',
			fullscreen: true
		}).html_safe
	end

	# GET /sermons/new
	def new
		@sermon = Sermon.new
	end

	# GET /sermons/1/edit
	def edit
		# @sermon = Sermon.find params[:id]
		render 'new.js.erb'
	end


	def audio
		@sermons = Sermon.all[0..11].reverse
	end



	# POST /sermons
	# POST /sermons.json
	def create
		
		@sermon = Sermon.create name: params[:sermon][:name], sermondate: params[:sermon][:sermondate]

		if params[:files]
			audio = params[:files].find {|f| f.original_filename =~ /.mp3/}
			image = params[:files].find {|f| f.original_filename =~ /(.png|.jpg)/}
		end

		if audio
			File.open(@sermon.audio_url, "wb") do |file|
				file.write audio.read
			end
		end

		if image
			File.open(@sermon.image_url, "wb") do |file|
				file.write image.read
			end
		end
	end

	# PATCH/PUT /sermons/1
	# PATCH/PUT /sermons/1.json
	def update
		@sermon.update name: params[:sermon][:name], sermondate: params[:sermon][:sermondate]

		if params[:files]
			audio = params[:files].find {|f| f.original_filename =~ /.mp3/}
			image = params[:files].find {|f| f.original_filename =~ /(.png|.jpg)/}
		end

		if audio
			File.open(@sermon.audio_url, "wb") do |file|
				file.write audio.read
			end
		end

		if image
			File.open(@sermon.image_url, "wb") do |file|
				file.write image.read
			end
		end
	end

	# DELETE /sermons/1
	# DELETE /sermons/1.json
	def destroy
		@sermon = Sermon.find params[:id]

		if File.exists?(@sermon.image_url)
			File.delete(@sermon.image_url)
		end

		if File.exists?(@sermon.audio_url)
			File.delete(@sermon.audio_url)
		end

		@sermon.delete

		redirect_to "/dashboard/sermons"
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_sermon
			@sermon = Sermon.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def sermon_params
			params[:sermon]
		end
end

class SermonsController < ApplicationController
	before_action :set_sermon, only: [:show, :edit, :update, :destroy]

	# GET /sermons
	# GET /sermons.json
	def index
		@sermons = VIDEO_CLIENT.playlist("PLZLN8ggsIxePmqamBkTYJEYHY-3sgenkQ").videos
		thumbs = @sermons.first.thumbnails
		max = 0
		@image = ""

		if thumbs[3]
			@image = thumbs[3].url
		else
			@image = thumbs.first
		end

		# thumbs.each do |t|
		# 	if t.width > max
		# 		@image = t.url
		# 	end
		# end

		@image = Base64.encode64(open(@image).read)
	end

	def change_sermon
		@sermon = VIDEO_CLIENT.my_video params[:id]
		@image = @sermon.thumbnails[3].url
		@image = Base64.encode64(open(@image).read)
		puts @image
		@player = @sermon.embed_html5({
			:class => 'video-player', 
			:id => 'sermon-player',
			:width => '560',
			:height => '315',
			:frameborder => '0', 
			:controlls => '0',
			fullscreen: true
		}).html_safe

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
	end

	# POST /sermons
	# POST /sermons.json
	def create
		@sermon = Sermon.new(sermon_params)

		respond_to do |format|
			if @sermon.save
				format.html { redirect_to @sermon, notice: 'Sermon was successfully created.' }
				format.json { render :show, status: :created, location: @sermon }
			else
				format.html { render :new }
				format.json { render json: @sermon.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /sermons/1
	# PATCH/PUT /sermons/1.json
	def update
		respond_to do |format|
			if @sermon.update(sermon_params)
				format.html { redirect_to @sermon, notice: 'Sermon was successfully updated.' }
				format.json { render :show, status: :ok, location: @sermon }
			else
				format.html { render :edit }
				format.json { render json: @sermon.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /sermons/1
	# DELETE /sermons/1.json
	def destroy
		@sermon.destroy
		respond_to do |format|
			format.html { redirect_to sermons_url, notice: 'Sermon was successfully destroyed.' }
			format.json { head :no_content }
		end
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

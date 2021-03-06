class KoinoniaController < ApplicationController
	before_action :authenticate_admin!, except: [:index, :download]
	layout 'dash', except: [:index, :download]

	def index
		@koinonia = Koinonium.all.reverse
		# @koinonia.each do |x|
		# 	puts x.name
		# end
		@current = @koinonia.delete_at 0
		# puts @current.name
	end


	def download
		@issue = Koinonium.find params[:id]
		send_file(
			@issue.pdf_url,
			filename: "#{@issue.name}.pdf",
			type: "application/pdf"
		)
	end


	def new
		@koinonia = Koinonium.new
		@link = "/koinonia"
	end


	def edit
		@koinonia = Koinonium.find params[:id]
		@link = "/koinonia/#{@koinonia.id}"
	end


	def create
		@koinonia = Koinonium.create name: params[:koinonium][:name]

		if params[:files]
			pdf = params[:files].find {|f| f.original_filename =~ /.pdf/}
			image = params[:files].find {|f| f.original_filename =~ /(.png|.jpg)/}
		end

		if pdf
			File.open(@koinonia.pdf_url, "wb") do |file|
				file.write pdf.read
			end
		end

		if image
			File.open(@koinonia.image_url, "wb") do |file|
				file.write image.read
			end
		end

		#redirect_to "/dashboard/koinonia"
	end


	def update
		@koinonia = Koinonium.find params[:id]

		@koinonia.update name: params[:koinonium][:name]

		if params[:files]
			pdf = params[:files].find {|f| f.original_filename =~ /.pdf/}
			image = params[:files].find {|f| f.original_filename =~ /(.png|.jpg)/}
		end

		if pdf
			File.open(@koinonia.pdf_url, "wb") do |file|
				file.write pdf.read
			end
		end

		if image
			File.open(@koinonia.image_url, "wb") do |file|
				file.write image.read
			end
		end

		#redirect_to "/dashboard/koinonia"
	end


	def destroy
		@koinonia = Koinonium.find params[:id]

		if File.exists?(@koinonia.image_url)
			File.delete(@koinonia.image_url)
		end

		if File.exists?(@koinonia.pdf_url)
			File.delete(@koinonia.pdf_url)
		end

		@koinonia.delete

		redirect_to "/dashboard/koinonia"
	end
end

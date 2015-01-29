class CalendarsController < ApplicationController
	before_action :set_calendar, only: [:show, :edit, :update, :destroy, :download]
	before_action :authenticate_admin!, except: [:index, :download]
	layout 'dash', except: [:index, :download]

	respond_to :html

	def index
		cm = Time.now.in_time_zone("America/Denver").month
		nm = cm + 1
		if nm == 13
			nm = 1
		end

		@current = Calendar.find {|x| x.month == cm}
		@next = Calendar.find {|x| x.month == nm}
	end


	def show
		respond_with(@calendar)
	end


	def new
		@calendar = Calendar.new
		respond_with(@calendar)
	end

	def edit
	end


	def create
		@calendar = Calendar.new(calendar_params)
		@calendar.save
		respond_with(@calendar)
	end


	def update
		@calendar.update(pdf: params[:calendar][:pdf].original_filename)
		
		pdf = params[:calendar][:pdf]

		if pdf
			File.open(@calendar.pdf_location, "wb") do |file|
				file.write pdf.read
			end
		end

		#@calendar.update(calendar_params)
		#respond_with(@calendar)
	end


	def destroy
		@calendar.destroy
		respond_with(@calendar)
	end


	def download
		send_file(
			@calendar.pdf_location,
			filename: "#{@calendar.name}.pdf",
			type: "application/pdf"
		)
	end


private
	def set_calendar
		@calendar = Calendar.find(params[:id])
	end

	def calendar_params
		params[:calendar]
	end
end

class AdminController < ApplicationController
	before_action :authenticate_admin!
	after_action :allow_iframe, only: :dashboard
	layout 'dash'

	def dashboard
		
	end

	def koinonia 
		@koinonia = Koinonium.all.reverse
	end

	def sermons
		@sermons = Sermon.all
	end

	def calendars
		@calendars = Calendar.all
		@c = Calendar.find 1
	end

	def alert
		@alert = Alert.first
	end

	def update_alert
		@alert = Alert.first	

		if @alert.active
			@alert.active = false
		else
			@alert.active = true
			@alert.name = params[:name]
			@alert.description = params[:description]
		end

		@alert.save!
	end

private

	def allow_iframe
		response.headers.except! 'X-Frame-Options'
	end
end

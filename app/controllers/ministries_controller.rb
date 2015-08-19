class MinistriesController < ApplicationController
	def index
	end

	def prayer_index
	end

	def send_request 
		PrayerRequest.send_request(params[:name], params[:email], params[:request]).deliver
	end
end

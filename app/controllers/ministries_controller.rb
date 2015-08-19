class MinistriesController < ApplicationController
	def index
	end

	def prayer_index
	end

	def send_request
		PrayerRequest.send_request
	end
end

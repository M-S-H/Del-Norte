class ApplicationController < ActionController::Base
	after_filter :set_access_control_headers
	protect_from_forgery with: :exception

	def set_access_control_headers 
		#headers['Access-Control-Allow-Origin'] = 'http://localhost:8081/' 
		headers['Access-Control-Request-Method'] = '*' 
	end

	def index
		@alert = Alert.first
	end

end

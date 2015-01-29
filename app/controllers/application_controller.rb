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

	def download_jan
		send_file(
			"public/January2015.pdf",
			filename: "January2015.pdf",
			type: "application/pdf"
		)
	end

	def download_feb
		send_file(
			"public/Feburary2015.pdf",
			filename: "February2015.pdf",
			type: "application/pdf"
		)
	end

end

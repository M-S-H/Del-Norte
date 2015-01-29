class Calendar < ActiveRecord::Base
	def pdf_location
 		"public/calendar/#{self.name}.pdf"
 	end

 	def pdf_url
 		"/calendar/#{self.name}.pdf"
 	end

 	def download
 		"/koinonia/download/#{self.name}"
 	end
end

class Koinonium < ActiveRecord::Base
	def pdf_url
 		"public/koinonia/#{self.id}.pdf"
 	end

 	def image_url
 		"public/koinonia/#{self.id}.jpg"
 	end

 	def image
 		"/koinonia/#{self.id}.jpg"
 	end

 	def pdf
 		"/koinonia/#{self.id}.pdf"
 	end

 	def download
 		"/koinonia/download/#{self.id}"
 	end
end

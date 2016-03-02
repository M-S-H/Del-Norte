class Sermon < ActiveRecord::Base
	def audio_url
 		"public/sermons/#{self.id}.mp3"
 	end

 	def image_url
 		"public/sermons/#{self.id}.jpg"
 	end

 	def image
 		"/sermons/#{self.id}.jpg"
 	end

 	def audio
 		"/sermons/#{self.id}.mp3"
 	end
end

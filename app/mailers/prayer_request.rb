class PrayerRequest < ActionMailer::Base
	default from: "prayer@dnbc.org"

	def send_request name, email, request
		@name = name
		@email = email
		@request = request
		mail(to: "mshickman91@gmail.com", subject: "Prayer Request");
	end
end

class PrayerRequest < ActionMailer::Base
	default from: "prayer@dnbc.org"

	def send_request name, email, request
		@name = name
		@email = email
		@request = request
		mail(from: @email, to: "prayer@dnbc.org", subject: "Prayer Request From #{@name}");
	end
end

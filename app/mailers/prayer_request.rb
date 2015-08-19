class PrayerRequest < ActionMailer::Base
	default from: "prayer@dnbc.org"

	def send_request
		mail(to: "mshickman@gmail.com", subject: "test");
	end
end

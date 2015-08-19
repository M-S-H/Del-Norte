class PrayerRequest < ActionMailer::Base
	default from: "prayer@dnbc.org"

	def send_request
		mail(to: "prayer@dnbc.org", subject: "test");
	end
end

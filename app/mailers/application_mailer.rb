class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("DEFAULT_SENDER", "noreply@micolet-hosting.com")
  layout "mailer"
end

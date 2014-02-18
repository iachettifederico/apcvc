class ContactMailer < ActionMailer::Base
  def contact(message)
    @message = message

    apcvc_mail = "info.apcvc@gmail.com"

    mail(to:       apcvc_mail,
         from:     ENV['SENDGRID_USERNAME'],
         reply_to: message.email,
         subject: "[APCVC WEB] #{message.subject}")
  end

end

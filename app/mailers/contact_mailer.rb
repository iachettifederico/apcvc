class ContactMailer < ActionMailer::Base
  def contact(message)
    @message = message

    apcvc_mail = "info@apcvc.com.ar"

    mail(to: apcvc_mail,
         reply_to: message.email,
         subject: "[APCVC WEB] #{message.subject}")
  end

end

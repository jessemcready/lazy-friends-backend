class NotificationsMailer < ApplicationMailer
  default from: 'diecarbonapp@gmail.com'
  # layout "mailer"

  def group_invite(message)
    @message = message
    @specialtext = "test"
    mail(to:'jessemcready@gmail.com', subject:'Test Run', body:"#{@message}")
  end


  def event_invite(message, ical, user_email)
    @message = message
    @specialtext = "test"
    mail.attachments['event.ics'] = { mime_type: 'application/ics', content: ical.to_ical }
    mail(to:user_email, subject:'Group Invite', body:"#{@message}")
  end

end

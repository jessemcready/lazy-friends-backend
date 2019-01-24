class NotificationsMailer < ApplicationMailer
  default from: 'diecarbonapp@gmail.com'
  # layout "mailer"

  def group_invite(message)
    @message = message
    @specialtext = "test"
    mail(to:'jessemcready@gmail.com', subject:'Test Run', body:"#{@message}")
  end


  def event_invite(message, user_email)
    @message = message
    @specialtext = "test"
    byebug
    mail(to:user_email, subject:'Group Invite', body:"#{@message}")
  end

  # def event_invite(group, ical, message)
  #   @message = message 
  #   @group = group 
  #   mail.attachments['event.ics'] = { :mime_type => 'text/calendar', content: ical.to_ical }
  #   mail(to:"jessemcready@gmail.com, parkermdinsmore@gmail.com", subject:'Test Run', body:"#{@message}")
  # end 

end

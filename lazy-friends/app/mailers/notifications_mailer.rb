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

end

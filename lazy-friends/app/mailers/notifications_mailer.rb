class NotificationsMailer < ApplicationMailer
  default from: 'diecarbonapp@gmail.com'
  # layout "mailer"

  def group_invite(message)
    @message = message
    @specialtext = "test"
    mail(to:'jessemcready@gmail.com', subject:'Test Run', body:"#{@message}")
  end

end

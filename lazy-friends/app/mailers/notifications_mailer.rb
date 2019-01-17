class NotificationsMailer < ApplicationMailer
  default from: 'diecarbonapp@gmail.com'
  # layout "mailer"

  def group_invite(message)
    byebug
    @message = message
    @specialtext = "test"
    mail(to:'jessemcready@gmail.com', subject:'Test Run', body:"#{@message}")
  end

end

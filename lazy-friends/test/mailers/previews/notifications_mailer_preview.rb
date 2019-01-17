# Preview all emails at http://localhost:3000/rails/mailers/notifications_mailer
class NotificationsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifications_mailer/event_invite
  def event_invite
    NotificationsMailer.event_invite
  end

  # Preview this email at http://localhost:3000/rails/mailers/notifications_mailer/group_invite
  def group_invite
    NotificationsMailer.group_invite
  end

end

require 'test_helper'

class NotificationsMailerTest < ActionMailer::TestCase
  test "event_invite" do
    mail = NotificationsMailer.event_invite
    assert_equal "Event invite", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "group_invite" do
    mail = NotificationsMailer.group_invite
    assert_equal "Group invite", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

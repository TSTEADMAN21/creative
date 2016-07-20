require 'test_helper'

class TestMailerTest < ActionMailer::TestCase
  test "thisemail" do
    mail = TestMailer.thisemail
    assert_equal "Thisemail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

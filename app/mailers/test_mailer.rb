class TestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.test_mailer.thisemail.subject
  #
  def thisemail
    @greeting = "Hi, I'm trynna get this to work"

    mail to: "tsteadman21@yahoo.com"
    		subject: "I'm being useful with code!"
  end
end

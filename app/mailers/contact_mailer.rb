class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.send_contact_message.subject
  #

  def send_contact_message
    @greeting = "Hi"

    mail to: "to@example.org", subject: "Test", template_name: "send_contact_message"
  end
end

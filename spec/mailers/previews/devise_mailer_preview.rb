# Preview all emails at http://localhost:3000/rails/mailers/
class Devise::MailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/devise/mailer/confirmation_instructions
  def SubscribeMailer
    SubscribeMailer.enviar(user).deliver_now
  end

  private

  def user
    Usuario.first
  end
end

class SubscribeMailer < ApplicationMailer
  layout "mailer"
  def enviar(usuario)
    @resource = usuario
    @message = "subscribe instructions"
    mail(to: @resource.email, subject: @message)
  end
end
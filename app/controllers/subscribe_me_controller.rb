class SubscribeMeController < ApplicationController
  before_action :load_params, only: :enviar_email
  def index; end

  def enviar_email
    return flash[:alert] = I18n.t('controllers.subscribe_me.email_blank_error') if permit_params[:email].empty?

    if @preferencias_id.empty?
      flash[:alert] = I18n.t('controllers.subscribe_me.no_preference_selected_error')
    else
      handle_email_identification
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def handle_email_identification
    response = IdentificarEmail.new.identificar(permit_params[:email], @preferencias_id)
    session[:current_email] = permit_params[:email] if response['success']
    flash[:alert] = I18n.t('controllers.subscribe_me.email_subscribe_success') if response['success']
    flash[:alert] = I18n.t('controllers.subscribe_me.email_identification_error') unless response['success']
  end

  def load_params
    @preferencias_id = permit_params[:preferencia_ids].reject(&:empty?)
  end

  def permit_params
    params.require(:subscribe).permit(:email, preferencia_ids: [])
  end
end

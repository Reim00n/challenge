class RespuestaController < ApplicationController
  before_action :authenticate_user
  def new
    @user = Cliente.find_by(email: session[:current_email])
    @questions = @user.preferencias.first.encuestas.first.formulario.preguntas
    if session[:current_step].blank?
      session[:current_step]=1
    end
  end
  def create
    @user = Cliente.find_by(email: session[:current_email])
    @questions = @user.preferencias.first.encuestas.first.formulario.preguntas
    formulario_pregunta_id = Pregunta.find(params[:question_id]).formulario_preguntas.first.id
    respuesta = Respuesta.new(
      cliente_id: @user.id,
      formulario_pregunta_id: formulario_pregunta_id,
      valor_respuesta: params[:answer].to_i
    )
    if respuesta.save!
      session[:current_step] += 1
      if session[:current_step] > @questions.count
        CrearCupon.new.run(session[:email])
        redirect_to respuesta_complete_path
      else
        redirect_to new_respuestum_path
      end
    else
      render :new
    end
  end
  private
  def authenticate_user
    @user = Cliente.find_by(email: session[:current_email])
    if @user.nil? == true
      redirect_back(fallback_location: subscribe_me_index_path)
    end 
  end
end

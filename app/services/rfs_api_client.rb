class RfsApiClient
  STATUS_OK = 200

  def initialize(http)
    @http_wrapper = http
  end

  def is_live?
    get_token.present?
  end

  def identificar(email,preferencias_ids)
    @preferencias_ids=preferencias_ids
    path = "/?api_key=#{ENV['EMAIL_VALIDATION_SECRET_KEY']}&email=#{email}"
    
    response = @http_wrapper.get(path)
    
    if response.code == STATUS_OK
      response = procesar_matches(response.body)
      response
    end
  end

  private
  def build_headers
    {
      "Authorization" => "Bearer #{acces_token}"
    }
  end

  def get_token
    path = "/?api_key=#{ENV['EMAIL_VALIDATION_SECRET_KEY']}&email=r"
    response = @http_wrapper.get(path)

    if response.code == STATUS_OK
      true
    else
      false
    end
  end

  def procesar_matches(matches)
    matches=JSON.parse(matches)
    email = matches["email"]
    if matches["autocorrect"] != ""
      email = matches["autocorrect"]
    end
    if matches["deliverability"]== "DELIVERABLE" && (matches["quality_score"].to_f) > 0.7 && matches["is_mx_found"]["value"] == true
      find_cliente = Cliente.find_by(email:email)
      if find_cliente !=nil
        {
          "success" => false,
          "error" => "El email ya fue registrado"
        }
      else
        new_cliente=Cliente.create!(email:email,nombre: email.split("@")&.first )
        new_cliente.preferencias << Preferencia.find(@preferencias_ids.map { |n| n })
        new_cliente.save!
        SubscribeMailer.enviar(new_cliente).deliver_now
        {
          "success" => true
        }
      end
    else
      Rails.logger.info "Error getting data"
      nil
    end

    
  end
 
end
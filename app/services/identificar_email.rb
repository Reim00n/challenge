class IdentificarEmail
  def identificar(email,preferencias_id)
    servers = ENV['EMAIL_VALIDATION_URL']
    was_live = false

    http = HttpWrapper.new(servers)
    client = RfsApiClient.new(http)

    if client.is_live?
      was_live = true
     sleep(0.1)
     response = client.identificar(email,preferencias_id)
      if response['success']
        return {
          success: true
        }
      else
        return {
          success: false,
          error: response['error']
        }
      end
    end
    if was_live
      return_error("Error desconocido")
    else
      return_error("Error conectando a servidor")
    end
  rescue StandardError => e
    return_error("Error insesperado: #{e.message}")
  end

  private

  def return_error(error)
    Rails.logger.info error
    { success: false, error: error, data: [] }
  end

end
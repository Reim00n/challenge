class HttpWrapper
  def initialize(base_url)
    @ctx = OpenSSL::SSL::SSLContext.new
    @ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE
    @base_url = base_url
  end

  def post(path, body:, headers: {})
    url = @base_url + path
    client = HTTP
    client = HTTP.headers( headers) if headers.present?

    begin
      response = client.post(url, form: body, ssl_context: @ctx)
    rescue
      response = OpenStruct.new(code: 500)
    end
    open_struct(response)
  end

  def get(path, headers: {})
    url = @base_url + path
    
    client = HTTP
    client = HTTP.headers( headers) if headers.present?

    begin
      response = client.get(url, ssl_context: @ctx)
    rescue
      response = OpenStruct.new(code: 500)
    end
    open_struct(response)
  end

  def open_struct(response)
    OpenStruct.new.tap do |r|
      r.body = response.body if response.code.to_i == 200
      r.code = response.code
    end
  end
end
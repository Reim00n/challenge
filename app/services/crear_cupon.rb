class CrearCupon
  def run(email)
    cliente = Cliente.find_by_email(email)
    cupon = cliente.cupones.build(estado: 1, desde: DateTime.now, hasta: (DateTime.now +
      10.day), descuento: 10)
    if cupon.save!
      {
        success: true
      }
    else
      {
        success: false,
        error: response['error']
      }
    end
  rescue StandardError => e
    {
      success: false,
      error: e.message
    }
  end
end

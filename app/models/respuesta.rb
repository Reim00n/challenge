# == Schema Information
#
# Table name: respuestas
#
#  id                     :bigint           not null, primary key
#  valor_respuesta        :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  cliente_id             :bigint           not null
#  formulario_pregunta_id :bigint           not null
#
# Indexes
#
#  index_respuestas_on_cliente_id              (cliente_id)
#  index_respuestas_on_formulario_pregunta_id  (formulario_pregunta_id)
#
# Foreign Keys
#
#  fk_rails_...  (cliente_id => clientes.id)
#  fk_rails_...  (formulario_pregunta_id => formularios_pregunta.id)
#
class Respuesta < ApplicationRecord
  belongs_to :cliente
  belongs_to :formulario_pregunta
  enum valor_respuesta: %i[good regular bad]

end

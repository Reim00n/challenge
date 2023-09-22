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
FactoryBot.define do
  factory :respuesta do
    cliente { nil }
    formulario_pregunta { nil }
    valor_respuesta { "MyString" }
  end
end

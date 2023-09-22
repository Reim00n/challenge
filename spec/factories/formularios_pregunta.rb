# == Schema Information
#
# Table name: formularios_pregunta
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  formulario_id :bigint           not null
#  pregunta_id   :bigint           not null
#
# Indexes
#
#  index_formularios_pregunta_on_formulario_id  (formulario_id)
#  index_formularios_pregunta_on_pregunta_id    (pregunta_id)
#
# Foreign Keys
#
#  fk_rails_...  (formulario_id => formularios.id)
#  fk_rails_...  (pregunta_id => preguntas.id)
#
FactoryBot.define do
  factory :formulario_pregunta do
    formulario { nil }
    pregunta { nil }
  end
end

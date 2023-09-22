# == Schema Information
#
# Table name: encuestas
#
#  id              :bigint           not null, primary key
#  estado_encuesta :integer
#  nombre_encuesta :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  preferencia_id  :bigint           not null
#
# Indexes
#
#  index_encuestas_on_preferencia_id  (preferencia_id)
#
# Foreign Keys
#
#  fk_rails_...  (preferencia_id => preferencias.id)
#
FactoryBot.define do
  factory :encuesta do
    nombre_encuesta { "MyString" }
    estado_encuesta { 1 }
  end
end

# == Schema Information
#
# Table name: encuestas
#
#  id             :bigint           not null, primary key
#  estado         :integer
#  nombre         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  preferencia_id :bigint           not null
#
# Indexes
#
#  index_encuestas_on_preferencia_id  (preferencia_id)
#
# Foreign Keys
#
#  fk_rails_...  (preferencia_id => preferencias.id)
#
class Encuesta < ApplicationRecord
  has_one :formulario
  enum estado: %i[active inactive]
end

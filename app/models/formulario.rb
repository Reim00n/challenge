# == Schema Information
#
# Table name: formularios
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  encuesta_id :bigint           not null
#
# Indexes
#
#  index_formularios_on_encuesta_id  (encuesta_id)
#
# Foreign Keys
#
#  fk_rails_...  (encuesta_id => encuestas.id)
#
class Formulario < ApplicationRecord
  belongs_to :encuesta
  has_many :respuestas
  has_many :formulario_preguntas
  has_many :preguntas, through: :formulario_preguntas
end

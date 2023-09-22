# == Schema Information
#
# Table name: preguntas
#
#  id         :bigint           not null, primary key
#  texto      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pregunta < ApplicationRecord
  has_many :formulario_preguntas
  has_many :formularios, through: :formulario_preguntas
end

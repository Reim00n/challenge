# == Schema Information
#
# Table name: clientes
#
#  id         :bigint           not null, primary key
#  email      :string
#  nombre     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cliente < ApplicationRecord
  
  has_many :respuestas
  has_many :cupones
  has_many :cliente_preferencias
  has_many :preferencias, through: :cliente_preferencias
  accepts_nested_attributes_for :preferencias
end

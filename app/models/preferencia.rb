# == Schema Information
#
# Table name: preferencias
#
#  id         :bigint           not null, primary key
#  texto      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Preferencia < ApplicationRecord
  has_many :encuestas
  has_many :cliente_preferencias
  has_many :clientes, through: :cliente_preferencias

end

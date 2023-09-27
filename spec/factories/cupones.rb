# == Schema Information
#
# Table name: cupones
#
#  id         :bigint           not null, primary key
#  descuento  :integer
#  desde      :datetime
#  estado     :integer
#  hasta      :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cliente_id :bigint           not null
#
# Indexes
#
#  index_cupones_on_cliente_id  (cliente_id)
#
# Foreign Keys
#
#  fk_rails_...  (cliente_id => clientes.id)
#
FactoryBot.define do
  factory :cupon do
    cliente { nil }
    desde { "2023-09-26 22:42:28" }
    hasta { "2023-09-26 22:42:28" }
    estado { 1 }
    descuento { 1 }
  end
end

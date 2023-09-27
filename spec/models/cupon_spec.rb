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
require 'rails_helper'

RSpec.describe Cupon, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: clientes_preferencia
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  cliente_id     :bigint           not null
#  preferencia_id :bigint           not null
#
# Indexes
#
#  index_clientes_preferencia_on_cliente_id      (cliente_id)
#  index_clientes_preferencia_on_preferencia_id  (preferencia_id)
#
# Foreign Keys
#
#  fk_rails_...  (cliente_id => clientes.id)
#  fk_rails_...  (preferencia_id => preferencias.id)
#
require 'rails_helper'

RSpec.describe ClientePreferencia, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

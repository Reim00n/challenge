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
require 'rails_helper'

RSpec.describe Encuesta, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

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
require 'rails_helper'

RSpec.describe Formulario, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

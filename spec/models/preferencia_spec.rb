# == Schema Information
#
# Table name: preferencias
#
#  id         :bigint           not null, primary key
#  texto      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Preferencia, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

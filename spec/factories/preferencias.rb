# == Schema Information
#
# Table name: preferencias
#
#  id         :bigint           not null, primary key
#  texto      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :preferencia do
    texto { "MyString" }
  end
end

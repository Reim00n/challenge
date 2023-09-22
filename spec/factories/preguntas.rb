# == Schema Information
#
# Table name: preguntas
#
#  id         :bigint           not null, primary key
#  texto      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :pregunta do
    texto { "MyString" }
  end
end

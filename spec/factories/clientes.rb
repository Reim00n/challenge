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
FactoryBot.define do
  factory :cliente do
    nombre { "MyString" }
    email { "MyString" }
  end
end

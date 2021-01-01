# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  cep        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :location do
    cep { "MyString" }
  end
end

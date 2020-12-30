require 'faker'
# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :client do
    name { Faker::Name.name }
    category { Category.create(name:'test') }
  end
end

# frozen_string_literal: true

require 'faker'
# == Schema Information
#
# Table name: clients
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  location_id :integer
#
FactoryBot.define do
  factory :client do
    name { Faker::Name.name }
    category { Category.create(name: 'test') }
    location { Location.create(cep: '00000-000') }
  end
end

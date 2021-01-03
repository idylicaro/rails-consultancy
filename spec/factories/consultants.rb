# frozen_string_literal: true

require 'faker'
# == Schema Information
#
# Table name: consultants
#
#  id         :integer          not null, primary key
#  name       :string
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :consultant do
    name { Faker::Name.name }
    rating { 0 }
    total_consultancies { 0 }
  end
end

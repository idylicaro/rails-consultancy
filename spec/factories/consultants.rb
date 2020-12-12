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
    name { "MyString" }
    rating { 1 }
  end
end

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
class Consultant < ApplicationRecord
  has_many :consultancies
  has_many :clients, through: :consultancies

  validates :name, presence: true
  validates_numericality_of :rating
end

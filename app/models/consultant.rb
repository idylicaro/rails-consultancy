class Consultant < ApplicationRecord
  validates :name, presence: true
  validates_numericality_of :rating
end

class Consultant < ApplicationRecord
  has_many :consultancies
  has_many :clients, through: :consultancies

  validates :name, presence: true
  validates_numericality_of :rating
end

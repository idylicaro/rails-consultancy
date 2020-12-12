class Client < ApplicationRecord
  has_many :consultancies
  has_many :consultants, through: :consultancies
  validates :name, presence: true
end

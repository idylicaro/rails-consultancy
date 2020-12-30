class Category < ApplicationRecord
  has_many :clients
  validates :name, presence: true
end

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
class Client < ApplicationRecord
  has_many :consultancies
  has_many :consultants, through: :consultancies

  belongs_to :category
  belongs_to :location

  validates :name, presence: true
  validates_presence_of :category_id
  validates_presence_of :location_id
end

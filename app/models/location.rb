# frozen_string_literal: true

# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  cep        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Location < ApplicationRecord
  has_one :client

  validates :cep, presence: true
  # TODO: create cep validation with Regular expression
end

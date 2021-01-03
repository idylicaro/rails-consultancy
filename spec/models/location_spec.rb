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
require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:cep) }
  end

  describe 'association' do
    it { should have_one :client }
  end
end

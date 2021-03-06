# frozen_string_literal: true

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
require 'rails_helper'

RSpec.describe Consultant, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:rating) }
  end

  describe 'association' do
    it { should have_many(:clients).through(:consultancies) }
  end
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: consultancies
#
#  id            :integer          not null, primary key
#  closed        :boolean
#  end_date      :datetime
#  rating        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  client_id     :integer
#  consultant_id :integer
#
require 'rails_helper'

RSpec.describe Consultancy, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:client_id) }
    it { should validate_presence_of(:consultant_id) }
    it { should validate_numericality_of(:rating) }
  end
  describe 'association' do
    it { should belong_to(:client) }
    it { should belong_to(:consultant) }
  end
end

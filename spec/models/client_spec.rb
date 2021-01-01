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
require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:category_id) }
    it { should validate_presence_of(:location_id) }
  end

  describe 'association' do
    it { should have_many(:consultants).through(:consultancies) }
    it { should belong_to :category}
    it { should belong_to :location}
  end
end

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

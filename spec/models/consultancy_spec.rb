require 'rails_helper'

RSpec.describe Consultancy, type: :model do
  describe 'association' do
    it { should belong_to(:client) }
    it { should belong_to(:consultant) }
  end
end

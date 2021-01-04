require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the Api::ConsultancyHelper. For example:
#
# describe Api::ConsultancyHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe Api::ConsultancyHelper, type: :helper do
  describe 'calculate_rating' do
    it 'should return correct rating' do
      expect(calculate_rating(5.0,4.0,1)).to eq(4.5)
      expect(calculate_rating(4.5,5.0,2)).to eq(4.66)
    end
  end
end

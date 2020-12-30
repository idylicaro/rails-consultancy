# == Schema Information
#
# Table name: consultancies
#
#  id            :integer          not null, primary key
#  end_date      :datetime
#  rating        :integer
#  start_date    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  client_id     :integer
#  consultant_id :integer
#
class Consultancy < ApplicationRecord
  belongs_to :client
  belongs_to :consultant

  validates_presence_of :client_id
  validates_presence_of :consultant_id
  validates_numericality_of :rating
end

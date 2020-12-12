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
FactoryBot.define do
  factory :consultancy do
    client_id { 1 }
    consultant_id { 1 }
    start_date { "2020-12-12 01:06:51" }
    end_date { "2020-12-12 01:06:51" }
    rating { 1 }
  end
end

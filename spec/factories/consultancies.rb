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
FactoryBot.define do
  factory :consultancy do
    client_id { 1 }
    consultant_id { 1 }
    start_date { '2020-12-12 01:06:51' }
    end_date { '2021-12-12 01:06:51' }
    rating { 0 }
  end
end

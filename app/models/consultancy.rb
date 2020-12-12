class Consultancy < ApplicationRecord
  belongs_to :client
  belongs_to :consultant
end

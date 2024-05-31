class Ambulance < ActiveRecord::Base
  has_many :hospitals
  has_one :patient
end
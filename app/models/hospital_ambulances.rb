class HopsitalAmbulances < ActiveRecord::Base
  has_many :hospitals
  has_many :ambulances

  validates :hospital_id, presence: true
  validates :ambulance_id, presence: true
end
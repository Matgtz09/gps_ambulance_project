class Hospital < ActiveRecord::Base
  has_many :patients
  has_many :ambulances, through: :hospital_ambulances
end
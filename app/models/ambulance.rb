class Ambulance < ActiveRecord::Base
  belongs_to :hospital
  #has_many :hospitals, through: :hospital_ambulances

  validates :name, presence: true
  validates :registration_number, presence: true, uniqueness: true
  validates :status, presence: true
end
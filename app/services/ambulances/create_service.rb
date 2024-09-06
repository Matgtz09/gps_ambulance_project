module Ambulances
  class CreateService
    attr_reader :driver_contact, :driver_name, :emergency_contact, :equipment_list, :fuel_level, :hospital_id, :last_serviced_at, :mileage, :name, :registration_number, :service_due_at, :status
    
    def initialize(ambulance_hash)
      @driver_contact = ambulance_hash[:driver_contact]
      @driver_name =ambulance_hash[:driver_name]
      @emergency_contact = ambulance_hash[:emergency_contact]
      @equipment_list = ambulance_hash[:equipment_list]
      @fuel_level = ambulance_hash[:fuel_level]
      @hospital_id = ambulance_hash[:hospital_id]
      @last_serviced_at = ambulance_hash[:last_serviced_at]
      @mileage = ambulance_hash[:mileage]
      @name = ambulance_hash[:name]
      @registration_number = ambulance_hash[:registration_number]
      @service_due_at = ambulance_hash[:service_due_at]
      @status = ambulance_hash[:status]
    end

    def call
      validate_hospital
      #add some validation
      # coordinates_hash = GoogleLocationService.get_coordinates_of_location(address: address, city: city, state: state, zip_code: zip_code)[0]
      # latitude = coordinates_hash[:latitude] if coordinates_hash.present?
      # longitude = coordinates_hash[:longitude] if coordinates_hash.present?

      Ambulance.create!(
        driver_contact: driver_contact,
        driver_name: driver_name,
        emergency_contact: emergency_contact,
        equipment_list: equipment_list,
        fuel_level: fuel_level,
        hospital_id: hospital_id,
        last_serviced_at: last_serviced_at,
        mileage: mileage,
        name: name,
        registration_number: registration_number,
        service_due_at: service_due_at,
        status: status,
      )
    end

    def validate_hospital
      if Hospital.find_by(id: hospital_id).nil?
        raise StandardError, "Hospital does note exist, please enter a valid Hospital."
      end
    end
  end
end
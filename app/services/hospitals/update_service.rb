module Hospitals
  class UpdateService
    attr_reader :hospital_hash
    
    def initialize(hospital_hash)
      @hospital_hash = hospital_hash
    end

    def call
      #add some validation
      coordinate_hash = GoogleLocationService.get_coordinates_of_location(address: address, city: city, state: state, zip_code: zip_code)[0]
      latitude = coordinates_hash[:latitude] if coordinates_hash.present?
      longitude = coordinates_hash[:longitude] if coordinates_hash.present?
      
      Hospitals.create(
        address: address,
        capacity: capacity,
        city: city,
        country: country,
        email_address: email_address,
        insurance_accepted: insurance_accepted,
        latitude: latitude,
        longitude: longitude,
        operating_hours: operating_hours,
        phone_number: phone_number,
        specialties: specialties,
        state: state,
        website: website,
        zip_code: zip_code,
      )
    end
  end
end
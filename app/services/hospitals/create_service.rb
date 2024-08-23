module Hospitals
  class CreateService
    attr_reader :name, :address, :city, :state, :country, :phone_number, :email_address, :zip_code, :capacity, :specialties, :operating_hours, :insurance_accepted, :website
    
    def initialize(hospital_hash)
      @name = hospital_hash[:name]
      @address =hospital_hash[:address]
      @city = hospital_hash[:city]
      @state = hospital_hash[:state]
      @country = hospital_hash[:country]
      @phone_number = hospital_hash[:phone_number]
      @email_address = hospital_hash[:email_address]
      @zip_code = hospital_hash[:zip_code]
      @capacity = hospital_hash[:capacity]
      @specialties = hospital_hash[:specialties]
      @operating_hours = hospital_hash[:operating_hours]
      @insurance_accepted = hospital_hash[:insurance_accepted]
      @website = hospital_hash[:website]
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
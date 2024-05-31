require 'google_maps_service'
require 'net/http'
require 'json'

class GoogleLocationService
  def self.get_current_location
    api_key = ENV['GOOGLE_MAPS_API_KEY']
    uri = URI("https://www.googleapis.com/geolocation/v1/geolocate?key=#{api_key}")
    request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    request.body = {}.to_json # Empty JSON body as required by the API
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    result = JSON.parse(response.body)

    if response.is_a?(Net::HTTPSuccess)
      latitude = result['location']['lat']
      longitude = result['location']['lng']
      { latitude: latitude, longitude: longitude }
    else
      raise StandardError, "Geolocation failed with status: #{response.code} #{response.message}"
    end
  end

  def self.get_coordinates_of_location(address)
    response = @client.geocode(address)
    
    if response.any?
      location = response.first[:geometry][:location]
      latitude = location[:lat]
      longitude = location[:lng]
      { latitude: latitude, longitude: longitude }
    else
      raise StandardError, "Geocoding failed, no results found."
    end
  end
end
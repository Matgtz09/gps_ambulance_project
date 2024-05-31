require 'google_maps_service'

GoogleMapsService.configure do |config|
  config.key = ENV['GOOGLE_MAPS_API_KEY']
end
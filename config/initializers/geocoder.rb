Geocoder.configure(
  # Geocoding options
  timeout: 15,                # geocoding service timeout (secs)
  lookup: :nominatim,        # name of geocoding service (symbol)
  use_https: true,           # use HTTPS for lookup requests
  units: :mi,                # :mi for miles
  logger: Rails.logger,      # use the Rails logger
  log: true,                 # enable logging
  http_headers: { 'User-Agent' => 'gps_ambulance_notification (.com)' }
)

  #lookup: :google,
  #api_key: ENV['GOOGLE_MAPS_API_KEY']

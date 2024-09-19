class AmbulanceLocationChannel < ApplicationCable::Channel
  def subscribed
    # Stream specific to the ambulance being tracked
    Rails.logger.debug("Params: #{params.inspect}") # Log all params
    Rails.logger.debug("Subscribing to ambulance_location_#{params[:ambulance_id]}")

    # Ensure ambulance_id is being passed and is not nil
    if params[:ambulance_id].present?
      stream_from "ambulance_location_#{params[:ambulance_id]}"
    else
      Rails.logger.debug("ambulance_id is nil")
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def receive(data)
    Rails.logger.debug("Received data: #{data.inspect}")
  
    if data['ambulance_id'].present?
      ActionCable.server.broadcast("ambulance_location_#{data['ambulance_id']}", {
        latitude: data['latitude'],
        longitude: data['longitude']
      })
    else
      Rails.logger.debug("ambulance_id is missing in the received data")
    end
  end
end

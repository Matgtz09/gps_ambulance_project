class AmbulanceLocationChannel < ApplicationCable::Channel
  def subscribed
    # Stream specific to the ambulance being tracked
    stream_from "ambulance_location_#{params[:ambulance_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    # Handle incoming location data
    ActionCable.server.broadcast("ambulance_location_#{data['ambulance_id']}", {
      latitude: data['latitude'],
      longitude: data['longitude']
    })
  end
end

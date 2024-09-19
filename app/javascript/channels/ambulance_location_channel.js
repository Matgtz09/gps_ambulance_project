import consumer from "channels/consumer"

const ambulanceId = document.getElementById("ambulance-id").value;

if (ambulanceId) {
  console.log("Ambulance ID:", ambulanceId);
  console.log("Subscribing to:", { channel: "AmbulanceLocationChannel", ambulance_id: ambulanceId });

  consumer.subscriptions.create(
    { channel: "AmbulanceLocationChannel", ambulance_id: "1" },
    {
      connected() {
        console.log("Connected to WebSocket");
      },
      disconnected() {
        console.log("Disconnected from WebSocket");
      },
      received(data) {
        console.log("Received data:", data);
      }
    }
  );
} else {
  console.error("Ambulance ID is missing.");
}
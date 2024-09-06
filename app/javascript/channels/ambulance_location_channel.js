import consumer from "channels/consumer"

consumer.subscriptions.create({ channel: "AmbulanceLocationChannel" }, {
  connected() {
    console.log("Connected to WebSocket");
  },

  disconnected() {
    console.log("Disconnected from WebSocket");
  },

  received(data) {
    console.log("Received data:", data);
  }
});
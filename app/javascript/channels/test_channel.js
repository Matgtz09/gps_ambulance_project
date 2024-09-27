import consumer from "./consumer";

consumer.subscriptions.create(
  { channel: "TestChannel" }, 
  {
    connected() {
      console.log("Connected to TestChannel");
    },

    disconnected() {
      console.log("Disconnected from TestChannel");
    },

    received(data) {
      console.log("Received data:", data);  // This should log the broadcast message
    }
  }
);

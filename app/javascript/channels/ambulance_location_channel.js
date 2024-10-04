// import consumer from "channels/consumer"

// const ambulanceId = document.getElementById("ambulance-id").value;

// if (ambulanceId) {
//   console.log("Ambulance ID:", ambulanceId);
//   console.log("Subscribing to:", { channel: "AmbulanceLocationChannel", ambulance_id: ambulanceId });

//   consumer.subscriptions.create(
//     { channel: "AmbulanceLocationChannel", ambulance_id: ambulanceId },
//     {
//       connected() {
//         console.log("Connected to WebSocket");
//       },
//       disconnected() {
//         console.log("Disconnected from WebSocket");
//       },
//       received(data) {
//         console.log("Received data:", data); // Confirm the data is received
//         const latitudeInput = document.getElementById('latitude');
//         const longitudeInput = document.getElementById('longitude');

//         if (latitudeInput && longitudeInput) {
//           latitudeInput.value = data.latitude;
//           longitudeInput.value = data.longitude;
//         }
//       }
//     }
//   );
// } else {
//   console.error("Ambulance ID is missing.");
// }

import consumer from "channels/consumer"

const ambulanceId = document.getElementById("ambulance-id").value;

let ambulanceLocationChannel;

export function getAmbulanceLocationChannel(ambulanceId) {
  if (ambulanceLocationChannel) {
    return ambulanceLocationChannel;
  }

  ambulanceLocationChannel = consumer.subscriptions.create(
    { channel: "AmbulanceLocationChannel", ambulance_id: ambulanceId },
    {
      connected() {
        console.log(`Connected to WebSocket for Ambulance ${ambulanceId}`);
      },

      disconnected() {
        console.log("Disconnected from WebSocket");
      },

      received(data) {
        console.log("Received data:", data);
      },

      updateLocation(latitude, longitude) {
        console.log(`Sending latitude: ${latitude}, longitude: ${longitude}`);
        this.perform("update_location", { latitude, longitude });
      }
    }
  );

  return ambulanceLocationChannel;
}


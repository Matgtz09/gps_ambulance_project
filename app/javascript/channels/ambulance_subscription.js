// app/javascript/ambulance_subscription.js
// import consumer from "channels/consumer";

// let subscription = null;

// export const subscribeToAmbulanceLocation = (ambulanceId) => {
//   if (!subscription) {
//     console.log("Ambulance ID:", ambulanceId);
//     console.log("Subscribing to:", { channel: "AmbulanceLocationChannel", ambulance_id: ambulanceId });

//     subscription = consumer.subscriptions.create(
//       { channel: "AmbulanceLocationChannel", ambulance_id: ambulanceId },
//       {
//         connected() {
//           console.log("Connected to WebSocket");
//         },
//         disconnected() {
//           console.log("Disconnected from WebSocket");
//         },
//         received(data) {
//           console.log("Received data:", data);
//           const latitudeInput = document.getElementById('latitude');
//           const longitudeInput = document.getElementById('longitude');

//           if (latitudeInput && longitudeInput) {
//             latitudeInput.value = data.latitude;
//             longitudeInput.value = data.longitude;
//           }
//         }
//       }
//     );
//   }
//   return subscription; // Return the subscription object
// };

//import ambulanceLocationChannel from "./channels/ambulance_location_channel"; // Import the channel

//const ambulanceId = document.getElementById("ambulance-id").value;

// document.addEventListener("DOMContentLoaded", function() {
//   if ("geolocation" in navigator) {
//     console.log("wahahah");
//     navigator.geolocation.getCurrentPosition(
//       function(position) {
//         const latitude = position.coords.latitude;
//         const longitude = position.coords.longitude;
//         console.log(`Latitude: ${latitude}, Longitude: ${longitude}`);
//         const latitudeInput = document.getElementById('latitude');
//         const longitudeInput = document.getElementById('longitude');
        
//         // Make sure the elements exist before setting their values
//         if (latitudeInput && longitudeInput) {
//           latitudeInput.value = latitude;
//           longitudeInput.value = longitude;

//           //ambulanceLocationChannel.perform('update_location', { latitude: latitude, longitude: longitude });
//         } else {
//           console.error("Latitude or Longitude input not found.");
//         }
//       },
//       function(error) {
//         console.error("Error:", error.message);
//       }
//     );
//   } else {
//     console.log("Geolocation API is not supported.");
//   }
// });

import { getAmbulanceLocationChannel } from "./channels/ambulance_location_channel"; // Adjust the path if necessary

document.addEventListener("DOMContentLoaded", function() {
  if ("geolocation" in navigator) {
    console.log("Geolocation supported. Tracking location...");

    const ambulanceId = window.ambulanceId; // Make sure ambulanceId is globally defined in your view
    const ambulanceLocationChannel = getAmbulanceLocationChannel(ambulanceId); // Reuse the same subscription
    const intervalDuration = 5000; // 5000ms = 5 seconds, adjust interval as needed
    // Set up a recurring interval to update location
    // setInterval(function() {
    //   navigator.geolocation.getCurrentPosition(
    //     function(position) {
    //       const latitude = position.coords.latitude;
    //       const longitude = position.coords.longitude;
    //       console.log(`Latitude: ${latitude}, Longitude: ${longitude}`);
    //       const latitudeInput = document.getElementById('latitude');
    //       const longitudeInput = document.getElementById('longitude');

    //       console.log(`Latitude: ${latitude}, Longitude: ${longitude}`);

    //       if (latitudeInput && longitudeInput) {
    //         latitudeInput.value = latitude;
    //         longitudeInput.value = longitude;
            
    //         // Update the ambulance location through the WebSocket subscription
    //         ambulanceLocationChannel.perform('update_location', { latitude: latitude, longitude: longitude });
    //       } else {
    //         console.error("Latitude or Longitude input not found.");
    //       }
    //     },
    //     function(error) {
    //       console.error("Error getting geolocation:", error.message);
    //     },
    //     {
    //       enableHighAccuracy: true, // Use GPS for better accuracy
    //       maximumAge: 0,            // Avoid cached location data
    //       timeout: 5000             // Timeout for location retrieval
    //     }
    //   );
    // }, intervalDuration);
    const watchId = navigator.geolocation.watchPosition(
      function(position) {
        const latitude = position.coords.latitude;
        const longitude = position.coords.longitude;

        console.log(`Latitude: ${latitude}, Longitude: ${longitude}`);

        const latitudeInput = document.getElementById('latitude');
        const longitudeInput = document.getElementById('longitude');

        if (latitudeInput && longitudeInput) {
          // Update the input values (optional, if needed for other parts of your form or display)
          latitudeInput.value = latitude;
          longitudeInput.value = longitude;
        }

        // Update the ambulance location through the WebSocket subscription
        ambulanceLocationChannel.perform('update_location', { latitude: latitude, longitude: longitude });
      },
      function(error) {
        console.error("Error getting geolocation:", error.message);
      },
      {
        enableHighAccuracy: true, // Use GPS for better accuracy
        maximumAge: 0,            // Avoid cached location data
        timeout: 5000             // Timeout for location retrieval
      }
    );

    // Optional: set an interval to handle additional logic every 5 seconds if needed
    setInterval(function() {
      console.log("Keeping the same coordinates");
    }, intervalDuration);
  } 
  else {
    console.error("Geolocation API is not supported.");
  }
});
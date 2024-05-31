document.addEventListener("DOMContentLoaded", function() {
  if ("geolocation" in navigator) {
    navigator.geolocation.getCurrentPosition(
      function(position) {
        const latitude = position.coords.latitude;
        const longitude = position.coords.longitude;
        document.getElementById('latitude').value = latitude;
        document.getElementById('longitude').value = longitude;
      },
      function(error) {
        console.error("Error:", error.message);
      }
    );
  } else {
    console.log("Geolocation API is not supported.");
  }
});
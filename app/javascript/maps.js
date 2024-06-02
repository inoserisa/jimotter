document.addEventListener('turbolinks:load', function() {
  function initMap() {
    var location = {lat: parseFloat(document.getElementById('map').dataset.lat), lng: parseFloat(document.getElementById('map').dataset.lng)};
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 6,
      center: location,
      mapId: "DEMO_MAP_ID"
    });
    var marker = new google.maps.marker.AdvancedMarkerElement({
      position: location,
      map: map
    });
  }

  if (document.getElementById('map')) {
    initMap();
  }
});
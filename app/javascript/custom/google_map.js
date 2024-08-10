function initMap() {
  var mapElement = document.getElementById('map');
  var location = {
    lat: parseFloat(mapElement.getAttribute('data-latitude')),
    lng: parseFloat(mapElement.getAttribute('data-longitude'))
  };

  var map = new google.maps.Map(mapElement, {
    zoom: 6,
    center: location,
    mapId: "DEMO_MAP_ID"
  });
  var marker = new google.maps.marker.AdvancedMarkerElement({
    position: location,
    map: map
  });
}

window.initMap = initMap;
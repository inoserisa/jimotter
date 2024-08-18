function initMap() {
  const mapElement = document.getElementById('map');
  const location = {
    lat: parseFloat(mapElement.getAttribute('data-latitude')),
    lng: parseFloat(mapElement.getAttribute('data-longitude'))
  };

  const map = new google.maps.Map(mapElement, {
    zoom: 6,
    center: location,
    mapId: "DEMO_MAP_ID"
  });
  const marker = new google.maps.marker.AdvancedMarkerElement({
    position: location,
    map: map
  });
}

window.initMap = initMap;
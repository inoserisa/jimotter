function initMap() {
  const mapElement = document.getElementById('map');

  if (!mapElement) return;

  const location = {
    lat: parseFloat(mapElement.dataset.latitude),
    lng: parseFloat(mapElement.dataset.longitude)
  };

  const map = new google.maps.Map(mapElement, {
    zoom: 6,
    center: location,
    mapId: "DEMO_MAP_ID"
  });

  new google.maps.marker.AdvancedMarkerElement({
    position: location,
    map: map
  });
}

window.initMap = initMap;
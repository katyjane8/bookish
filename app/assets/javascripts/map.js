// This example requires the Places library. Include the libraries=places
// parameter when you first load the API. For example:
// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
var map;
var infowindow;
var markers = [];

function initMap() {
  var location = {
    lat: 39954527,
    lng: -105133260
  };
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      location = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      map.setCenter(location);
      for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
      }
      markers = [];
      setPlaces(location);
    });
  } else {
    // Browser doesn't support Geolocation
    //since you set coords above this section it will default to that
  }
  map = new google.maps.Map(document.getElementById('map'), {
    center: location,
    zoom: 25
  });
      setPlaces(location);
}

function callback(results, status) {
  if (status === google.maps.places.PlacesServiceStatus.OK) {
    for (var i = 0; i < results.length; i++) {
      createMarker(results[i]);
    }
  }
}

function setPlaces(location) {
  infowindow = new google.maps.InfoWindow();
  var service = new google.maps.places.PlacesService(map);
  service.nearbySearch({
    location: location,
    radius: 2000,
    type: ['book_store']
  }, callback);
}

function createMarker(place) {
  var placeLoc = place.geometry.location;
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location
  });
  markers.push(marker);

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.setContent(place.name);
    infowindow.open(map, this);
  });
}

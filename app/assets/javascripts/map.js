// // This example requires the Places library. Include the libraries=places
// // parameter when you first load the API. For example:
// // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
var map;
var infowindow;
var markers = [];

function initMap() {
  var location = {
    lat: 39.954527,
    lng: -105.133260
  };
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function (position) {
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
    error('Geo Location is not supported');
    // Browser doesn't support Geolocation
    //since you set coords above this section it will default to that
  }
  map = new google.maps.Map(document.getElementById('map'), {
    center: location,
    zoom: 13
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
  var service = new google.maps.places.PlacesService(map);
  var placeLoc = place.geometry.location;
  if (place.icon) {
    var image = new google.maps.MarkerImage(
      place.icon, new google.maps.Size(71, 71),
      new google.maps.Point(0, 0), new google.maps.Point(17, 34),
      new google.maps.Size(25, 25));
  } else var image = null;

  var marker = new google.maps.Marker({
    map: map,
    position: placeLoc
  });
  var request = {
    reference: place.reference
  };

  google.maps.event.addListener(marker, 'click', function () {
    service.getDetails(request, function (place, status) {
      if (status == google.maps.places.PlacesServiceStatus.OK) {
        var contentStr = '<h4>' + place.name + '</h4><p>' + place.formatted_address;
        if (!!place.formatted_phone_number) contentStr += '<br>' + place.formatted_phone_number;
        if (!!place.website) contentStr += '<br><a target="_blank" href="' + place.website + '">' + place.website + '</a>';
        contentStr += '<br>' + '</p>';
        contentStr += '</div>' +
          // add "view on google maps"
          '<div style="border-top: 1px solid rgb(204, 204, 204); margin-top: 9px; padding: 6px; font-size: 13px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap; font-family: Roboto, Arial;">' +
          '<a href="' + place.url + '" target="_blank" rel="noopener" style="cursor: pointer; color: rgb(66, 127, 237); text-decoration: none;">View on Google Maps</a></div>';
        infowindow.setContent(contentStr);
        infowindow.open(map, marker);
      } else {
        var contentStr = "<h5>No Result, status=" + status + "</h5>";
        infowindow.setContent(contentStr);
        infowindow.open(map, marker);
      }
    });
  });
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Save a Place</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body {
        height: 50%;
        width:50%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
    </style>
    <script>

// When you add a marker using a Place instead of a location, the Maps API will
// automatically add a 'Save to Google Maps' link to any info window associated
// with that marker.

function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 17,
    center: {lat: 37.49939, lng: 127.028997}
  });

  var marker = new google.maps.Marker({
    map: map,
    // Define the place with a location, and a query string.
    place: {
      location: {lat: 37.49939, lng: 127.028997},
      query: 'Google, Sydney, Australia'

    },
    // Attributions help users find your site again.
    attribution: {
      source: 'Google Maps JavaScript API',
      webUrl: 'https://developers.google.com/maps/'
    }
  });

  // Construct a new InfoWindow.
  var infoWindow = new google.maps.InfoWindow({
    content: 'ForTravel' 
  });

  // Opens the InfoWindow when marker is clicked.
  marker.addListener('click', function() {
    infoWindow.open(map, marker);
  });
}

    </script>
  </head>
  <body>
    <div id="map"></div>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNOUoJKvbs7BehUVusnx2k5rHY0rovywE&signed_in=true&libraries=places&callback=initMap"></script>
  </body>
</html>
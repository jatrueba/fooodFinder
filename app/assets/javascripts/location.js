$(document).ready(function(){
  var location = function getLocation() {
      // console.log("hello from getLocation")
      if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(showPosition());
      } else {
          x.innerHTML = "Geolocation is not supported by this browser.";
      }

  }
  function showPosition(position) {
    var latlon = position.coords.latitude + "," + position.coords.longitude;
    var img_url = ("GET", "  https:/maps.googleapis.com/maps/api/place/nearbysearch/json?location="+ latlon+"&radius=500&types=food&name=cruise&key=AIzaSyAuw4no8ETufFiyu3FrBgOf4_rtZODlIoU");
    console.log(img_url);
    return img_url

    //building the call to google API to get the current locations




  };

  var x = document.getElementById("alert");
  $('#button').click(function(){
    // console.log("hello");
    location();
  });

});

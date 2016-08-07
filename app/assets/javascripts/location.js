$(document).ready(function(){
 function getLocation() {
      if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(showPosition)
          console.log("what");
      } else {
          location.innerHTML = "Geolocation is not supported by this browser.";
      }

  };
  function showPosition(position) {
    var latlon = position.coords.latitude + "," + position.coords.longitude;
    var api = $.ajax("  https:/maps.googleapis.com/maps/api/place/nearbysearch/json?location="+ latlon+"&type=restaurant&radius=1000&key=AIzaSyAuw4no8ETufFiyu3FrBgOf4_rtZODlIoU").done(function(){
      console.log("working");
      console.log(api);
      
      // console.dir(api.responseJSON["results"][0]["name"]);
        var results = api.responseJSON.results[1]
      // $.each(results, function(name, vicinity){
          console.log(results.name);
          console.log(results.vicinity);
      // });



      })
      //  response = api.responseJSON["res"];
      //   console.log(response);

    };

  var x = document.getElementById("alert");
  $('#button').click(function(){
     getLocation();
      console.log("hello");
  });

});

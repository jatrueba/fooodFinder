var latlon;
$(document).ready(function() {
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            location.innerHTML = "Geolocation is not supported by this browser.";
        }
    }
    // $('#id_input')attr('disabled','true').text('getting location');
    function showPosition(position) {
        latlon = position.coords;
        if (latlon !==null) {
          $('#lat').val(latlon.latitude);
          $('#long').val(latlon.longitude);
          alert("Location Found");
          // jquery $(#id_input).val('Create Message')removeAttr()
          //form_id.serialize
        } else {
          alert("Location not found. Please enter your search.");
        }
    }

    $('#button-js').click(function() {
        getLocation();
        console.log("hello");
    });

    $('.search_location').click(function() {
        location.reload(false);
        console.log("something");
    });

    $('.previous_search').click(function() {
        window.history.back();
        console.log("back something");
    });

});

// var x = document.getElementById("alert");

// var api = $.ajax("  https:/maps.googleapis.com/maps/api/place/nearbysearch/json?location="+ latlon+"&type=restaurant&radius=1000&key=AIzaSyAuw4no8ETufFiyu3FrBgOf4_rtZODlIoU").done(function(){
// console.log("working");
// console.log(api);

// console.dir(api.responseJSON["results"][0]["name"]);
// var results = api.responseJSON.results[1]
// $.each(results, function(name, vicinity){
// console.log(results.name);
// console.log(results.vicinity);
// });




//  response = api.responseJSON["res"];
//   console.log(response);

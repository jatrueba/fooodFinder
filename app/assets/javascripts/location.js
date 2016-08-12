$(document).ready(function() {

    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            location.innerHTML = "Location not found. Please enter your search.";
            changeControlState();
        }
    }

    function showPosition(position) {
      var latlon = position.coords;
        if (latlon !== null) {
          $('#lat').val(latlon.latitude);
          $('#long').val(latlon.longitude);
        } else {
          alert("Location not found. Please enter your search.");
        }
        changeControlsState();
    }

    function changeControlsState() {
      $("#spinner-image").hide();
      $("#find-restaurant-js").removeAttr('disabled');
      $('#find-me-js').show();
    }

    $('#find-me-js').click(function() {
        $('#find-restaurant-js').attr('disabled', 'true');
        $(this).hide();
        $("#spinner-image").show();
        getLocation();
        // evt.preventDefault();
    });

    $('.search_location').click(function() {
        location.reload(false);
        console.log("something");
    });

    $('.previous_search').click(function() {
        window.history.back();
        console.log("back something");
    });

    //Convert address tags to google map links on show page's address links
    $('#directions').click(function(){
      $('#directions-btn').each(function () {
            window.location = "http://maps.google.com/maps?q=" + encodeURIComponent( $(this).text());
       });
    });
});

// $('#directions').click(function(){
//    $('address').each(function () {;
//      console.log("address hidden");
//       var link = "<a href='http://maps.google.com/maps?q=" + encodeURIComponent( $(this).text() ) + "' target='_blank'>" + $(this).text() + "</a>";
//       $(this).html(link);
//       window.open(link);
//    });
// });


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

// jquery $(#id_input).val('Create Message')removeAttr()
//form_id.serialize

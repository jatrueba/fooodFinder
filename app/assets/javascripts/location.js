var latlon;
$(document).ready(function() {

    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            location.innerHTML = "Location not found. Please enter your search.";
            $('#find-restaurant-js').removeAttr('disabled');
        }
    }

    function showPosition(position) {
        latlon = position.coords;
        if (latlon !==null) {
          $('#lat').val(latlon.latitude);
          $('#long').val(latlon.longitude);
          alert("Location Found");
          // $('#find-me-js').show().hide('<img src="assets/ajax-loader.gif" />');
          $('#find-restaurant-js').removeAttr('disabled');
        } else {
          alert("Location not found. Please enter your search.");
        }
    }

    $('#find-me-js').click(function() {
        $('#find-restaurant-js').attr('disabled', 'true');
        // $('#find-me-js').hide().after('<img src="assets/ajax-loader.gif" />');
        getLocation();
        evt.preventDefault();
    });

    // val("<img id="spinny-thang" src="ajax-loader.gif" alt="spinny thang" height="42" width="42">")


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

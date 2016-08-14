$(document).ready(function() {

    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            location.innerHTML = 'Location not found. Please enter your search.';
            changeControlState();
        }
    }

    function showPosition(position) {
      var latlon = position.coords;
        if (latlon !== null) {
          $('#lat').val(latlon.latitude);
          $('#long').val(latlon.longitude);
          $('#rest-search').submit();
        } else {
          alert('Location not found. Please enter your search.');
        }
        changeControlsState();
    }

    function changeControlsState() {
      $('#spinner-image').hide();
      $('#manual-search-js').removeAttr('disabled');
      $('#find-me-js').show();
    }

    $('#find-me-js').click(function() {
        $('#manual-search-js').attr('disabled', 'true');
        $(this).hide();
        $('#spinner-image').show();
        getLocation();
    });

    $('#manual-search-js').click(function() {
        $('#search-form').show();
    });
    
});

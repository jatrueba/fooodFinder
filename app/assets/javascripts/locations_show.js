$(document).ready(function() {

      $('.search_location').click(function() {
          location.reload(false);
      });

      $('.previous_search').click(function() {
          window.history.back();
          console.log('back something');
      });

      //Convert address tags to google map links on show page's address links
      $('#directions').click(function(){
        $('#directions-btn').each(function () {
              window.location = 'http://maps.google.com/maps?q=' + encodeURIComponent( $(this).text());
         });
      });
});

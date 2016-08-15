$(document).ready(function() {

      $('#next-btn').click(function() {
          location.reload(false);
      });

      $('.previous_search').click(function() {
          window.history.back();
          console.log('back something');
      });

      //Convert address tags to google map links on show page's address links
      $('#directions').click(function(){
        event.preventDefault();
        $('#directions-btn').each(function () {
              var loc = 'http://maps.google.com/maps?q=' + encodeURIComponent($(this).text());
              console.log(loc);
              window.location = 'http://maps.google.com/maps?q=' + encodeURIComponent($(this).text());
         });
      });
});

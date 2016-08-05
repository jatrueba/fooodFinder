$(document).ready(function(){
  var location = function getLocation() {
      if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(showPosition);
      } else {
          x.innerHTML = "Geolocation is not supported by this browser.";
      }
  }
  function showPosition(position) {
    console.log("hello");

  };

  var x = document.getElementById("alert");
  $('#button').click(function(){
    console.log("hello");
    location();
  });

});

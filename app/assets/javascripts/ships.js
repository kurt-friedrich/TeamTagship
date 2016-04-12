$(document).ready( function() {
  $("#ship_body").on("keyup", function(){
    var length = $(this).val().length;
    $("#body-count").html(length);
  });
});

$(document).ready( function() {
  $("#ship_body").on("keyup", function(){
    var length = $(this).val().length;
    $("#body-count").html(length);
    if($('#ship_body').val().length > 170){
      $('#body-count').addClass('over-limit')
    }
    else{
      $('#body-count').removeClass('over-limit')
    }
  });

  $('form#new_ship').submit(function(ev){
    if(($('#ship_body').val().length == 0)|| ($('#ship_body').val().length > 170)){
      ev.preventDefault()
        if($('#ship_body').val().length == 0){
          $('.ship_body').addClass('has-error')
          if(!$('.ship_body span.help-block').get(0)){
            $('.ship_body').append('<span class="help-block">can\'t be blank</span>')
          }
        }else{
          $('.ship_body').removeClass('has-error')
          $('.ship_body span.help-block').remove()
        }
        if($('#ship_body').val().length > 170){
          $('.ship_body').addClass('has-error')
          if(!$('.ship_body span.help-block').get(0)){
            $('.ship_body').append('<span class="help-block">must be 170 characters or less</span>')
          }
        }else{
          $('.ship_body').removeClass('has-error')
          $('.ship_body span.help-block').remove()
        }
    }
  });
});

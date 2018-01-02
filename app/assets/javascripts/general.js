$(document).on('turbolinks:load', function() {
  scrollTo();

  window.sweetAlertConfirmConfig = {
    title: 'Are you sure?',
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#DD6B55',
    confirmButtonText: 'Ok'
  };

});

function scrollTo(){
  $('.scroll-to').click(function(e){
    e.preventDefault();
    var full_url = this.href;
    var parts = full_url.split("#");
    var trgt = parts[1];
    $('html, body').animate({
      scrollTop: $('#' + trgt).offset().top
    }, 1000);
  });
}
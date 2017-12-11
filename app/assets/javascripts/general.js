$(document).on('turbolinks:load', function() {
  // $(".alert").alert();
  // window.setTimeout(function() { $(".alert").alert('close'); }, 2000);
  scrollTo();
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
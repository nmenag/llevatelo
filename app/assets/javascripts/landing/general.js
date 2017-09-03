$(function(){
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
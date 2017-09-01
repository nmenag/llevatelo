$(function(){
  scrollTo();
});

function scrollTo(){
  $('.scroll-to').click(function (event) {
    event.preventDefault();
    var full_url = this.href;
    var parts = full_url.split("#");
    var trgt = parts[1];

    $('body').scrollTo($('#' + trgt), 800, {offset: -80});
  });
}
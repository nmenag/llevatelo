$(document).on('turbolinks:load', function() {
  // $(".alert").alert();
  // window.setTimeout(function() { $(".alert").alert('close'); }, 2000);
  easyZoom();
  scrollTo();
});


function easyZoom(){
  var $easyzoom = $('.easyzoom').easyZoom();
  // Get an instance API
  var api = $easyzoom.data('easyZoom');
  // Setup thumbnails example
  var api1 = $easyzoom.filter('.easyzoom--with-thumbnails').data('easyZoom');
  $('.thumbnails').on('click', 'a', function(e) {
    var $this = $(this);
    e.preventDefault();
    // Use EasyZoom's `swap` method
    api1.swap($this.data('standard'), $this.attr('href'));
  });
}

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
$(document).on('turbolinks:load', function() {

  $('body').on('click', '.add-articles .img-content', function() {
    var fileImage = $(this).parent().find('.file-image');
    fileImage.click();
  });

  RemoveAndAddImage();

  $('body').on('change', '.file-image', function() {
    var placeImg = $(this).parent().find('.js-image-preview');
    readURL(this, placeImg);
    placeImg.css('opacity', 1);
  });

  $(".article-form .img-responsive").css('height', '69px');

  $('body').on('click',' a.preview-image', function(e) {
    e.preventDefault();
    var image = $(this).parents('.thumbnail').find('.js-image-preview').css('background-image');
    image  = image.replace('url(','').replace(')','').replace(/\"/gi, "");
    $('#imagepreview').attr('src', image); // here asign the image to the modal when the user click the enlarge link
    $('#imagemodal').modal('show'); // imagemodal is the id attribute assigned to the bootstrap modal, then i use the show function
  });
});

function readURL(input, placeImg) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      placeImg.css('background-image', "url(" + e.target.result + ")");
    }

    reader.readAsDataURL(input.files[0]);
  }
}

function RemoveAndAddImage(){
  $('.destroy-article').on('confirm:complete', function(e, response) {
    if(response) {
      $(this).parent().find('.remove_nested_fields_link').click();
      $('.add_nested_fields_link').click();
      $(".article-form .img-responsive").css('height', '69px');
    }

    return false;
  });
}
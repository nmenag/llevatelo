$(document).on('turbolinks:load', function() {

  $(document).on('click', '.add-articles img', function() {
    var fileImage = $(this).parent().find('.file-image');
    fileImage.click();
  });

  RemoveAndAddImage();

  $('body').on('change', '.file-image', function() {
    var placeImg = $(this).parent().find('img');
    readURL(this, placeImg);
    placeImg.css('opacity', 1);
  });

  $(".article-form .img-responsive").css('height', '69px');

  $(document).on('click',' a.preview-image', function(e) {
    e.preventDefault();
    $('#imagepreview').attr('src', $(this).parents('.thumbnail').find('img').attr('src')); // here asign the image to the modal when the user click the enlarge link
    $('#imagemodal').modal('show'); // imagemodal is the id attribute assigned to the bootstrap modal, then i use the show function
  });
});

function readURL(input, placeImg) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      placeImg.attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}

function RemoveAndAddImage(){
  $('body').on('click', '.destroy-article', function(e){
    e.preventDefault();
    $(this).parent().find('.remove_nested_fields_link').click();
    $('.add_nested_fields_link').click();
    $(".article-form .img-responsive").css('height', '69px');
  })
}

$(document).on('turbolinks:load', function() {
  $("html, body").animate({ scrollTop: 0 }, "slow");

  $('#contactWithoutSignIn').on('click', function(e){
    e.preventDefault();
    swal({
      type: 'info',
      text: 'Debes iniciar Sesión para contactar este artículo',
      confirmButtonText: 'Aceptar'
    });
  })
});





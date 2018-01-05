$(document).on('turbolinks:load', function() {
  $('#contactWithoutSignIn').on('click', function(e){
    e.preventDefault();
    swal({
      type: 'info',
      text: 'Debes iniciar Sesión para contactar este artículo',
      confirmButtonText: 'Aceptar'
    });
  })
});





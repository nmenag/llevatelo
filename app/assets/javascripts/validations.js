$(function(){
  $('#new_user').validate({
    rules: {
     'user[email]': 'required',
     'user[password]': 'required'
    },
    messages: {
      'user[email]': 'Ingresa un correo electrónico',
      'user[password]': 'Ingresa tu contraseña'
    },
  });
});

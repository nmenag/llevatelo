$(document).on('turbolinks:load', function() {
  $('#new_user').validate({
    rules: {
     'user[email]': 'required',
     'user[password]': 'required',
     'user[phone]': 'required',
     'user[password_confirmation]': 'required'
    },
    messages: {
      'user[email]': 'Ingresa un correo electrónico',
      'user[password]': 'Ingresa tu contraseña',
      'user[password_confirmation]': 'Por favor confirme la contraseña',
    },
  });

  $('#edit_user').validate({
    rules: {
     'user[email]': 'required',
     'user[password]': 'required',
     'user[phone]': 'required',
     'user[password_confirmation]': 'required'
    },
    messages: {
      'user[email]': 'Ingresa un correo electrónico',
      'user[password]': 'Ingresa tu contraseña',
      'user[password_confirmation]': 'Por favor confirme la contraseña',
    },
  });
})

$(document).on('turbolinks:load', function() {
  $('#new_user, .edit_user').validate({
    rules: {
      'user[email]': {
        required: true,
        email: true,
      },
      'user[phone]': 'required',
      'user[password]': 'required',
      'user[password_confirmation]': {
        required: true,
        equalTo: "#user_password"
      }
    },
    messages: {
      'user[password]': 'Ingresa tu contraseña',
      'user[password_confirmation]': {
        required: 'Por favor confirme la contraseña'
      },
      'user[email]': {
        required: 'Ingresa un correo electrónico',
      },
    },
  });

  $('#updatePassword').validate({
    rules: {
      'user[password]': 'required',
      'user[password_confirmation]': {
        required: true,
        equalTo: "#user_password"
      }
    },
    messages: {
      'user[password]': 'Ingresa tu contraseña',
      'user[password_confirmation]': {
        required: 'Por favor confirme la contraseña'
      }
    },
  });

  $('#new_article, .edit_article').validate({
    rules: {
     'article[name]': 'required',
     'article[offer_type]': 'required',
     'article[status]': 'required',
     'article[location]': 'required',
     'status': 'required'
    }
  });
});

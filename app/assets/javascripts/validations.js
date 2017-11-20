$(document).on('turbolinks:load', function() {
  $('#new_user, .edit_user').validate({
    rules: {
      'user[login]': {
        required: true
      },
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

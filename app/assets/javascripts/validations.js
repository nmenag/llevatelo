$(document).on('turbolinks:load', function() {
  $('#new_user, .edit_user').validate({
    rules: {
     'user[email]': 'required',
     'user[phone]': 'required',

    },
    messages: {
      'user[email]': 'Ingresa un correo electrónico',
    },
  });

  $('#updatePassword').validate({
    rules: {
      'user[password]': 'required',
      'user[password_confirmation]': 'required',
      'user[current_password]': 'required'
    },
    messages: {
      'user[password]': 'Ingresa tu contraseña',
      'user[password_confirmation]': 'Por favor confirme la contraseña'
    },
  });

  $('#new_article, .edit_article').validate({
    rules: {
     'article[name]': 'required',
     'article[offer_type]': 'required',
     'article[description]': 'required',
     'article[status]': 'required'
    }
  });
});

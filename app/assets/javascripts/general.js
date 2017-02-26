$(document).on('turbolinks:load', function() {
  $(".alert").alert();
  window.setTimeout(function() { $(".alert").alert('close'); }, 2000);
});

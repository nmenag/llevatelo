$(document).on('turbolinks:load', function() {
  $('#login-form-link').click(function(e) {
  	$("#new_user").delay(100).fadeIn(100);
  	$("#register-form").fadeOut(100);
  	$('#register-form-link').removeClass('active');
  	$(this).addClass('active');
  	e.preventDefault();
	});
  
	$('#register-form-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
 		$("#new_user").fadeOut(100);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
})

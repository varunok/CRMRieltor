$(document).ready(function() {
	$('#send_email').on('click', function(event) {
		event.preventDefault();
		$.post('send_email_rieltor', {'text': $('#write_email').val()})
		.success( function (data) {
            $('.messageServer').css('backgroundColor', '#5bc0de');
            $('.messageServer').text('Отправлено').fadeIn(1000).delay(2000).fadeOut(500);
            ('#write_email').val('');
        })
        .error(function(data) {
            $('.messageServer').css('backgroundColor', '#c9302c');
            $('.messageServer').text('Ошибка').fadeIn(1000).delay(2000).fadeOut(500);
        })
	});	
	$('#send_email_so').on('click', function(event) {
		event.preventDefault();
		$.post('send_email_so', {'text': $('#text_email_so').val()})
		.success( function (data) {
            $('.messageServer').css('backgroundColor', '#5bc0de');
            $('.messageServer').text('Отправлено').fadeIn(1000).delay(2000).fadeOut(500);
            ('#write_email').val('');
        })
        .error(function(data) {
            $('.messageServer').css('backgroundColor', '#c9302c');
            $('.messageServer').text('Ошибка').fadeIn(1000).delay(2000).fadeOut(500);
        })
	});

});
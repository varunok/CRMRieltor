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
        var id_so = $('#sisingle_obj_id').attr('sisingle_obj_id');
        data = {
            'email': $('#text_email_so').val(),
            'id_so': id_so
        }
		$.post('send_email_so', data)
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
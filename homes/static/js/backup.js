$(document).ready(function() {

    $('#object_xls').on('click', function(event) {
        event.preventDefault();
        var object_xls_val = $('#object_xls_val').val();
        console.log(object_xls_val)
        if (object_xls_val == 'create'){
            $.post('create_object_xls')
            .success( function (data) {
                $('.messageServer').animate({backgroundColor: '#5bc0de'}, 1000);
                $('.messageServer').text('Создано').fadeIn(1000).delay(2000).fadeOut(500);
            })
            .error(function(data) {
                $('.messageServer').css('backgroundColor', '#c9302c');
                $('.messageServer').text('Ошибка').fadeIn(1000).delay(2000).fadeOut(500);
            });
        } 
    });
})

$(document).ready(function() {

    $('#object_xls').on('click', function(event) {
        event.preventDefault();
        $('.messageServer').css('backgroundColor', '#FCCD1B');
        $('.messageServer').html('<div><i class="fa fa-spinner fa-pulse fa-1x fa-fw"></i>Создание</div').fadeIn(500).delay(2000);
        $.post('create_object_xls')
        .success( function (data) {
            window.location.href = data;
            $('.messageServer').animate({backgroundColor: '#5bc0de'}, 1000);
            $('.messageServer').text('Создано').fadeIn(1000).delay(2000).fadeOut(500);
        })
        .error(function(data) {
            $('.messageServer').css('backgroundColor', '#c9302c');
            $('.messageServer').text('Ошибка').fadeIn(1000).delay(2000).fadeOut(500);
        });
    });

    $('#backup_global').on('click', function(event) {
        event.preventDefault();
        $('.messageServer').css('backgroundColor', '#FCCD1B');
        $('.messageServer').html('<div><i class="fa fa-spinner fa-pulse fa-1x fa-fw"></i>Создание</div').fadeIn(500).delay(2000);
        $.post('get_backup_global')
        .success( function (data) {
            $('.messageServer').animate({backgroundColor: '#5bc0de'}, 1000);
            $('.messageServer').text('Создано').fadeIn(1000).delay(2000).fadeOut(500);
            // window.location.href = data;
        })
        .error(function(data) {
            $('.messageServer').css('backgroundColor', '#c9302c');
            $('.messageServer').text('Ошибка').fadeIn(1000).delay(2000).fadeOut(500);
        });
    });
})


$(document).ready(function() {
    $.datepicker.regional['ru'] = {
        closeText: 'Закрыть',
        prevText: '<Пред',
        nextText: 'След>',
        currentText: 'Сегодня',
        monthNames: ['Январь','Февраль','Март','Апрель','Май','Июнь',
        'Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь'],
        monthNamesShort: ['Янв','Фев','Мар','Апр','Май','Июн',
        'Июл','Авг','Сен','Окт','Ноя','Дек'],
        dayNames: ['воскресенье','понедельник','вторник','среда','четверг','пятница','суббота'],
        dayNamesShort: ['вск','пнд','втр','срд','чтв','птн','сбт'],
        dayNamesMin: ['Вс','Пн','Вт','Ср','Чт','Пт','Сб'],
        weekHeader: 'Не',
        dateFormat: 'yy-mm-dd',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };
    $.datepicker.setDefaults($.datepicker.regional['ru']);

    $.timepicker.regional['ru'] = {
        timeOnlyTitle: 'Выберите время',
        timeText: 'Время',
        hourText: 'Часы',
        minuteText: 'Минуты',
        secondText: 'Секунды',
        millisecText: 'Миллисекунды',
        timezoneText: 'Часовой пояс',
        currentText: 'Сейчас',
        closeText: 'Закрыть',
        timeFormat: 'HH:mm',
        amNames: ['AM', 'A'],
        pmNames: ['PM', 'P'],
        isRTL: false
    };
    $.timepicker.setDefaults($.timepicker.regional['ru']);
    $(document).on('click', '#avtomat_add_arendator', function (event) {
        event.preventDefault();
        $('#modal_avto').fadeIn('slow');
    });
    $(document).on('click', '#cencel_automat_btn', function (event) {
        event.preventDefault();
        $('#modal_avto').fadeOut('slow');
    });
    $(document).on('click', '#ok_automat_btn', function (event) {
        event.preventDefault();
        $('#modal_avto').fadeOut('slow');
        var data = $('#avtomat_form').serialize();
        $.get('automat_tie_arendator', data)
            .success( function (data) {
            // $('#add_tr').html(' ');
            // $('#add_tr').fadeIn('slow');
            // $('#add_tr').prepend(data);
            // $('.show_tr').fadeIn('slow');
            // var count_ar = parseInt($('#add_tr').children('.show_tr').length);
            // $('#get_arendator').children('span').text(count_ar);
            $('.tabs-rule').fadeOut('200', function() {
                    $(this).html('');
                    $(this).html(data);
                    $(this).fadeIn('200');
                });
        });
    });
    $(document).on('click', '#add_id_cont_owner', function(event) {
        event.preventDefault();
        var data = $('#cont_form').serialize();
        $.get('add_id_cont_owner', data)
        .success( function (data) {
            $('.tabs-rule').fadeOut('200', function() {
                    $(this).html('');
                    $(this).html(data);
                    $(this).fadeIn('200');
                });
        })
        .error(function(data) {
            $('.messageServer').css('backgroundColor', '#c9302c');
            $('.messageServer').text(data.responseText).fadeIn(1000).delay(2000).fadeOut(500);
        })
    });
    $(document).on('click', '#clear_cont_owner', function(event) {
        event.preventDefault();
        var data = $('#clear_form').serialize();
        $.post('clear_cont_owner', data)
        .success( function (data) {
            $('.tabs-rule').fadeOut('200', function() {
                    $(this).html('');
                    $(this).html(data);
                    $(this).fadeIn('200');
                });
        })
        .error(function(data) {
            $('.messageServer').css('backgroundColor', '#c9302c');
            $('.messageServer').text(data.responseText).fadeIn(1000).delay(2000).fadeOut(500);
        })
    });
    $(document).on('click', '#del_cont_owner', function(event) {
        event.preventDefault();
        var id_arendator = $(this).prev('.id_arendator').val();
        var id_cont_owner = $(this).next('.id_cont_owner').val();
        var data = {
            'id_arendator': id_arendator,
            'id_cont_owner': id_cont_owner
        }
        $.post('del_cont_owner', data)
        .success( function (data) {
            $('.tabs-rule').fadeOut('200', function() {
                    $(this).html('');
                    $(this).html(data);
                    $(this).fadeIn('200');
                });
        })
        .error(function(data) {
            $('.messageServer').css('backgroundColor', '#c9302c');
            $('.messageServer').text(data.responseText).fadeIn(1000).delay(2000).fadeOut(500);
        })
    });
    $(document).on('change', '.show_cont_owner', function(event) {
        event.preventDefault();
        var show = $(this).val();
        var id_arendator = $(this).prev('.id_arendator').val();
        var id_cont_owner = $(this).next('.id_cont_owner').val();
        var data = {
            'show': show,
            'id_arendator': id_arendator,
            'id_cont_owner': id_cont_owner
        }
        $.post('change_show_owner', data)
        .success( function (data) {
            $('.messageServer').css('backgroundColor', '#5bc0de');
            $('.messageServer').text(data).fadeIn(1000).delay(2000).fadeOut(500);
        })
        .error(function(data) {
            $('.messageServer').css('backgroundColor', '#c9302c');
            $('.messageServer').text(data.responseText).fadeIn(1000).delay(2000).fadeOut(500);
        });
    });
    
    
});
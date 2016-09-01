/**
 * Created by varunok on 28.07.16.
 */

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
    // "use strict";
    $('.tabs-rule').on('click', '#add_arendator_id', function (event) {
        event.preventDefault();
        var id_a = $('#id_arendator').val();
        $.get('add_arendator_to_tie/'+id_a, {'id': $('#sisingle_obj_id').attr('sisingle_obj_id')}).success( function (data) {
            $('#add_tr').prepend(data);
            $('.show_tr').fadeIn('slow');
            var plus_count = parseInt($('#get_arendator').children('span').text())+1;
            $('#get_arendator').children('span').text(plus_count);
        });
    });
    $('.tabs-rule').on('change', '.id_shows', function (event) {
        var id_a = $(this).attr('id-arendator-sin');
        var id_o = $('#sisingle_obj_id').attr('sisingle_obj_id');
        var id_show = $(this).val();
        $.get('change_shows/a-'+id_a+'='+'o-'+id_o+'='+'s-'+id_show);
    });
    $('.tabs-rule').on('click', '#avtomat_add_arendator', function (event) {
        event.preventDefault();
        $('#modal_avto').fadeIn('slow');
    });
    $('.tabs-rule').on('click', '#cencel_automat_btn', function (event) {
        event.preventDefault();
        $('#modal_avto').fadeOut('slow');
    });
    $('.tabs-rule').on('click', '#ok_automat_btn', function (event) {
        event.preventDefault();
        $('#modal_avto').fadeOut('slow');
        var price_automat = $("#price_automat").prop("checked");
        var area_automat = $("#area_automat").prop("checked");
        var rooms_automat = $("#rooms_automat").prop("checked");
        var repairs_automat = $("#repairs_automat").prop("checked");
        var type_obj_automat = $("#type_obj_automat").prop("checked");
        var district_automat = $("#district_automat").prop("checked");
        var data = {
            "price_automat": price_automat,
            "area_automat": area_automat,
            "rooms_automat": rooms_automat,
            "repairs_automat": repairs_automat,
            "type_obj_automat": type_obj_automat,
            "district_automat": district_automat,
            "id_so": $('#sisingle_obj_id').attr('sisingle_obj_id'),
            "type_operations": "arendator"
        };
        $.get('automat_tie', data).success( function (data) {
            $('#add_tr').html(' ');
            $('#add_tr').fadeIn('slow');
            $('#add_tr').prepend(data);
            $('.show_tr').fadeIn('slow');
            var count_ar = parseInt($('#add_tr').children('.show_tr').length);
            $('#get_arendator').children('span').text(count_ar);
            console.log(count_ar)
        });
    });
    $('.tabs-rule').on('click', '.delete_arendator_tr', function (event) {
        event.preventDefault();
        var del_obj = $(this).parents('.show_tr');
        var dai = $(this).attr('del-arendator-id');
        $.post('delete_tie_arendator/'+dai, {'id': $('#sisingle_obj_id').attr('sisingle_obj_id')})
            .success( function (data) {
                del_obj.fadeOut('slow', function () {
                    $('#add_tr').children('#show_tr-'+dai).remove();
                    var plus_count = parseInt($('#get_arendator').children('span').text())-1;
                    $('#get_arendator').children('span').text(plus_count);
                });

            });
    });
    
    $('.tabs-rule').on('click', '#clear_all_arendator', function (event) {
        event.preventDefault();
        $.post('clear_all_arendator', {'id': $('#sisingle_obj_id').attr('sisingle_obj_id')})
            .success( function (data) {
                $('#add_tr').fadeOut('slow', function () {
                    $('#add_tr').html(' ');
                    $('#add_tr').fadeIn('slow');
                    $('#get_arendator').children('span').text('0');
                })
            });
    });

//    BLOCK BUYER
    $('.tabs-rule').on('click', '#add_buyer_id', function (event) {
        event.preventDefault();
        var id_a = $('#id_buyer').val();
        $.get('add_buyer_to_tie/'+id_a, {'id': $('#sisingle_obj_id').attr('sisingle_obj_id')}).success( function (data) {
            $('#add_tr').prepend(data);
            $('.show_tr').fadeIn('slow');
            var plus_count = parseInt($('#get_buyer').children('span').text())+1;
            $('#get_buyer').children('span').text(plus_count);
        });
    });
    $('.tabs-rule').on('change', '.id_shows_buyer', function (event) {
        var id_a = $(this).attr('id-buyer-sin');
        var id_o = $('#sisingle_obj_id').attr('sisingle_obj_id');
        var id_show = $(this).val();
        $.get('change_shows_buyer/a-'+id_a+'='+'o-'+id_o+'='+'s-'+id_show);
    });
    $('.tabs-rule').on('click', '#avtomat_add_buyer', function (event) {
        event.preventDefault();
        $('#modal_avto').fadeIn('slow');
    });
    $('.tabs-rule').on('click', '#cencel_automat_btn', function (event) {
        event.preventDefault();
        $('#modal_avto').fadeOut('slow');
    });
    $('.tabs-rule').on('click', '#ok_automat_btn_buyer', function (event) {
        event.preventDefault();
        $('#modal_avto').fadeOut('slow');
        var price_automat = $("#price_automat").prop("checked");
        var area_automat = $("#area_automat").prop("checked");
        var rooms_automat = $("#rooms_automat").prop("checked");
        var repairs_automat = $("#repairs_automat").prop("checked");
        var type_obj_automat = $("#type_obj_automat").prop("checked");
        var district_automat = $("#district_automat").prop("checked");
        var data = {
            "price_automat": price_automat,
            "area_automat": area_automat,
            "rooms_automat": rooms_automat,
            "repairs_automat": repairs_automat,
            "type_obj_automat": type_obj_automat,
            "district_automat": district_automat,
            "id_so": $('#sisingle_obj_id').attr('sisingle_obj_id')
        };
        $.get('automat_tie_buyer', data).success( function (data) {
            $('#add_tr').html(' ');
            $('#add_tr').fadeIn('slow');
            $('#add_tr').prepend(data);
            $('.show_tr').fadeIn('slow');
            var count_ar = parseInt($('#add_tr').children('.show_tr').length);
            $('#get_buyer').children('span').text(count_ar);
            console.log(count_ar)
        });
    });
    $('.tabs-rule').on('click', '.delete_buyer_tr', function (event) {
        event.preventDefault();
        var del_obj = $(this).parents('.show_tr');
        var dai = $(this).attr('del-buyer-id');
        $.post('delete_tie_buyer/'+dai, {'id': $('#sisingle_obj_id').attr('sisingle_obj_id')})
            .success( function (data) {
                del_obj.fadeOut('slow', function () {
                    $('#add_tr').children('#show_tr-'+dai).remove();
                    var plus_count = parseInt($('#get_buyer').children('span').text())-1;
                    $('#get_buyer').children('span').text(plus_count);
                });

            });
    });

    $('.tabs-rule').on('click', '#clear_all_buyer', function (event) {
        event.preventDefault();
        $.post('clear_all_buyer', {'id': $('#sisingle_obj_id').attr('sisingle_obj_id')})
            .success( function (data) {
                $('#add_tr').fadeOut('slow', function () {
                    $('#add_tr').html(' ');
                    $('#add_tr').fadeIn('slow');
                    $('#get_buyer').children('span').text('0');
                })
            });
    });
    
    //  START  Block SINGLE OBJECT
    $('.tabs-rule').on('click', '#add_task_form', function (event) {
        event.preventDefault();
        $.get('get_form_task').success( function (data) {
            $('#add_form_t').html(data);
            $('.task-form').animate({top: '10%'}, 1000);
            $('#add_form_t').children('.task-form').fadeIn('slow');
            $('#add_form_t').trigger('click');
            $('select').select2();
        });
    });

    $('.tabs-rule').on('click','#cancel_add_form', function (event) {
        event.preventDefault();
        $('.task-form').hide('scale');
    });

    $('.tabs-rule').on('click', '#add_form_t', function(event) {
        event.preventDefault();
        $('#id_dead_line').datetimepicker($.timepicker.regional['ru']);
    });
    $('.tabs-rule').on('click', '#save_form_tasking', function (event) {
        event.preventDefault();
        var msg   = $('#send_form').serialize();
        $.post('save_form_tasking_task', msg)
        .success( function (data) {
            $('.task-form').animate({top: '20%'}, 2000);
            $('.task-form').animate({top: '-700px'}, 500, function () {
                $('#add_single_task').append(data);
                $('tr').fadeIn('slow');
                $('.count_active_task').text(parseInt($('.count_active_task').text())+1);
            });

        })
        .error(function(data) {
            $('#add_form').html(data.responseText);
            $('.task-form').css('top', '10%');
            $('#add_form').trigger('click');
            $('select').select2();
            wrongForm();
        })
    });
    function wrongForm() {
        $('.task-form').animate({top: '15%'},50);
        $('.task-form').animate({top: '10%'},50);
        $('.task-form').animate({top: '14%'},80);
        $('.task-form').animate({top: '10%'},80);
        $('.task-form').animate({top: '13%'},100);
        $('.task-form').animate({top: '10%'},100);
        $('.task-form').animate({top: '12%'},120);
        $('.task-form').animate({top: '10%'},120);
        $('.task-form').animate({top: '11%'},150);
        $('.task-form').animate({top: '10%'},150);
    }
    //  END  Block SINGLE OBJECT
    // START BLOCK POSTING
    $('.tabs-rule').on('click', '#post_obj', function (event) {
        event.preventDefault();
        var obj_status = $(this);
        var status = $(this).attr('status');
        var sisingle_obj_id = $('#sisingle_obj_id').attr('sisingle_obj_id');
        $.post('post/'+status, {'id_so': sisingle_obj_id})
            .success( function (data) {
                obj_status.attr('status', 'true')
            })
            .error(function (data) {
                
            })
    });
    // END BLOCK POSTING
});

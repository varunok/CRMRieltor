/**
 * Created by varunok on 28.07.16.
 */

$(document).ready(function() {
    // "use strict";
    $('.tabs-rule').on('click', '#add_arendator_id', function (event) {
        event.preventDefault();
        var id_a = $('#id_arendator').val();
        $.get('add_arendator_to_tie/'+id_a, {'id': $('#sisingle_obj_id').attr('sisingle_obj_id')}).success( function (data) {
            $('#add_tr').append(data);
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
            "district_automat": district_automat
        };
        $.post('automat_tie', data);
    });
    $('.tabs-rule').on('click', '.fa-times', function (event) {
        event.preventDefault();
        var dai = $(this).attr('del-arendator-id');
        $.post('delete_tie_arendator/'+dai, {'id': $('#sisingle_obj_id').attr('sisingle_obj_id')});
    });
});

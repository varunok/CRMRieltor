/**
 * Created by varunok on 06.08.16.
 */
$(document).ready(function() {
    $('#add_task_form').on('click', function (event) {
        event.preventDefault();
        $.get('tasking/get_form_task').success( function (data) {
            $('#add_form').html(data);
            $('.task-form').animate({top: '10%'}, 1000);
            $('#add_form').trigger('click');
            for (var i = 1; i <= 24; i++) {
                $('#hours_task').append('<option value="'+i+'">'+i+'</option>')
            }
            for (var i = 0; i < 60; i++) {
                $('#minute_task').append('<option value="'+i+'">'+i+'</option>')
            }
        });
    });
    $('#add_form').on('click','#cancel_add_form', function (event) {
        event.preventDefault();
        // $('.task-form').animate({width: '0px'}, 1000);
        $('.task-form').hide('scale');
    });
    $("#add_form").on('click', function(event) {
        event.preventDefault();
        $('#id_dead_line').datepicker({
             monthNames: ['Январь', 'Февраль', 'Март', 'Апрель',
            'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь',
            'Октябрь', 'Ноябрь', 'Декабрь'],
             dayNamesMin: ['Вс','Пн','Вт','Ср','Чт','Пт','Сб'],
             firstDay: 1}).datepicker();
        $('#id_access').addClass('multiple')
    });


});
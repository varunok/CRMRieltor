/**
 * Created by varunok on 06.08.16.
 */
$(document).ready(function() {
    $('#add_task_form').on('click', function (event) {
        event.preventDefault();
        $.get('tasking/get_form_task').success( function (data) {
            $('#add_form').html(data);
            $('.task-form').animate({top: '10%'}, 1000)
        });
    });
    $('#add_form').on('click','#cancel_add_form', function (event) {
        event.preventDefault();
        // $('.task-form').animate({width: '0px'}, 1000);
        $('.task-form').hide('scale');
    })
});
/**
 * Created by varunok on 03.08.16.
 */
$(document).ready(function() {
    $('#add_makler').on('click', function (event) {
        event.preventDefault();
        $.get('maklers/form_makler').success( function (data) {
            $('#add_form').html(data);
            $('.makler-form').animate({top: '10%'}, 1000)
        });
    });
    
    $('#add_form').on('click', '#cancel_add_makler', function (event) {
        event.preventDefault();
        $('.makler-form').animate({top: '-700px'}, 1000)
    });   
    
    $('#add_form').on('click', '#send_form_makler', function (event) {
        event.preventDefault();
        var msg   = $('#send_form').serialize();
        // console.log(msg)
        $.post('maklers/add_makler', msg)
            .success( function (data) {
                $('.makler-form').animate({top: '-700px'}, 1000);
                $('.add_apend_makler').append(data);
                // $('.add_apend_makler').children('tr').fadeIn('slow')
        })
            .error(function(data) {
                $('#add_form').html(data.responseText);
                $('.makler-form').css('top', '10%');
                wrongForm();
            });
    });
    $('table').on('click', '.fa-pencil', function (event) {
        event.preventDefault();
        var id = $(this).parents('a').attr('id-makler');
        $.post('maklers/edit_makler', {'id':id})
        .success( function (data) {
            $('#add_form').html(data);
            $('.makler-form').animate({top: '10%'}, 1000)
        });
    });

    $('#add_form').on('click', '#edit_form_makler', function (event) {
        event.preventDefault();
        var msg   = $('#send_form').serialize();
        var id = $(this).attr('id-makler-btn');
        $.post('maklers/save_edit_makler/'+id, msg)
        .success( function (data) {
            $('.makler-form').animate({top: '-700px'}, 1000);
            $('[id-makler="'+id+'"]').parents('tr').replaceWith(data);
        })
        .error(function(data) {
                $('#add_form').html(data.responseText);
                $('.makler-form').css('top', '10%');
                wrongForm();
            });
    });

    function wrongForm() {
        $('.makler-form').animate({top: '15%'},50);
        $('.makler-form').animate({top: '10%'},50);
        $('.makler-form').animate({top: '14%'},80);
        $('.makler-form').animate({top: '10%'},80);
        $('.makler-form').animate({top: '13%'},100);
        $('.makler-form').animate({top: '10%'},100);
        $('.makler-form').animate({top: '12%'},120);
        $('.makler-form').animate({top: '10%'},120);
        $('.makler-form').animate({top: '11%'},150);
        $('.makler-form').animate({top: '10%'},150);
    }

    $('#send_email_makler').on('click', function (event) {
        event.preventDefault();
        $.post('maklers/send_email_makler')
    })
});
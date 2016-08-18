/**
 * Created by varunok on 14.08.16.
 */
$(document).ready(function() {
    $('#parse').on('click', function (event) {
        event.preventDefault();
        var msg   = $('#parse_form').serialize();
        $('#include_parse_text').html('');
        $('#wait_icon').html('<i class="fa fa-spinner fa-pulse fa-4x fa-fw"></i>');
        $.post('parse', msg)
        .success( function (data) {
            var data = jQuery.parseJSON(data);
            $('#include_parse_text').html('');
            $('#wait_icon').html('');
            for(var i in data){
                // $('#include_parse_text').append("<div></div><a href='"+data[i].sity+"'>"+data[i].sity+"</a></div>");
                $('#include_parse_text').append("<tr><td>"+data[i].sity+"</td><td>"+data[i].title+"</td><td>"+data[i].phone+"</td><td><a class='btn btn-darkblue' target='_blank' href='"+data[i].link+"'>Перейти</a></td></tr>");

            }
        })
        .error(function(data) {
            $('#wait_icon').html('ERROR');
        });
    })
});
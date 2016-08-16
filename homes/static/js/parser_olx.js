/**
 * Created by varunok on 14.08.16.
 */
$(document).ready(function() {
    $('#parse').on('click', function (event) {
        event.preventDefault();
        var msg   = $('#parse_form').serialize();
        $.post('parse', msg)
        .success( function (data) {
            $('#include_parse_text').text(data);
        })
        .error(function(data) {});
    })
});
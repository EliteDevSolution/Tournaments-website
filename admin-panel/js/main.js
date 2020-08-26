$(function () {
    $('.delete-button').on('click', function(event) {
        event.preventDefault();
        var ajax_type = $(this).attr('data-type');
        var id = $('#delete-modal').attr('data-id');
        $('#list-' + id).remove();
        $.post('{{LINK aj/ap/delete-' + ajax_type + '}}', {id: id});
    });
});
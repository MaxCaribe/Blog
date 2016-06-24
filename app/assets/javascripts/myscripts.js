$(function() {
    $('td#show_reply').click(function(event){
        event.preventDefault();
        $(event.target).children('#reply').toggle();
    });
});


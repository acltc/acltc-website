$(window).load(function(){
    var value = Cookies.get('Actualize') || false;
    if (!value){
        $('#rebranding').modal('show');
    }
});
$(document).ready(function(){
    $('#rebranding').click(function(){
        Cookies.set('Actualize', true, { expires: 7 });
        $('#rebranding').modal('hide');
    });
});

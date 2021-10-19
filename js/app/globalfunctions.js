$(function() {
    var $eye = $("#eye");
    var $pwd = $("#pwd");
    $eye.on('click', function() {
        var $clase = $eye.hasClass('ion-ios-eye') ? 'ion-ios-eye-off' : 'ion-ios-eye';
        $eye.removeClass();
        $eye.addClass($clase);

        var $attr = $pwd.attr('type') == 'password' ? 'text' : 'password';
        $pwd.attr('type', $attr);

    })

});
$(document).ready(function () {
    $.easing.def = "easeOutCubic";
    $('li.button a').click(function (e) {
        var dropDown = $(this).parent().next();
        dropDown.slideToggle(0);
        e.preventDefault();
    })
});
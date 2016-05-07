$(window).bind('scroll', function () {
    if ($(window).scrollTop() > 0) {
        $('.navbar').addClass('fixed');
        $('.body2').css('padding-top', 80);
        $('.cityProfile').css('margin-top', 0);

    } else {
        $('.navbar').removeClass('fixed');
        $('.body2').css('padding-top', 0);
        $('.cityProfile').css('margin-top', 30);

    }
});

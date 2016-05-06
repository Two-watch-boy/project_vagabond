$(window).bind('scroll', function () {
    if ($(window).scrollTop() > 0) {
        $('.navbar').addClass('fixed');
    } else {
        $('.navbar').removeClass('fixed');
    }
});

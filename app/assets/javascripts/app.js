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

jQuery(function(){

    var minimized_elements = $('p.postData');

    minimized_elements.each(function(){
        var t = $(this).text();
        if(t.length < 250) return;

        $(this).html(
            t.slice(0,250)+'<span>... </span><a href="#" class="more">Read More</a>'+
            '<span style="display:none;">'+ t.slice(250,t.length)+' <a href="#" class="less">Less</a></span>'
        );

    });

    $('a.more', minimized_elements).click(function(event){
        event.preventDefault();
        $(this).hide().prev().hide();
        $(this).next().show();
    });

    $('a.less', minimized_elements).click(function(event){
        event.preventDefault();
        $(this).parent().hide().prev().show().prev().show();
    });

});
});

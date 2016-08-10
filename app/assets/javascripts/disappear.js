$(document).ready(function(){

      $('.disappear').click(function(){
        $(".message").css("visibility", "hidden");
        $(".marquee .marquee-content").css("padding", "7em 3.5em");
        $(".marquee").css("height", "648px");
        $(".marquee").css("margin-top", "-232px");
        if (window.matchMedia('(max-width: 320px)').matches)
        {
            $(".marquee .marquee-content").css("padding", "2em 3.5em");
            $(".marquee .marquee-content").css("margin-top", "52px");
            $(".marquee .marquee-content").css("height", "596px");
        }
        else if (window.matchMedia('(max-width: 480px)').matches)
        {
            $(".marquee .marquee-content").css("padding", "1em 3.5em");
            $(".marquee .marquee-content").css("margin-top", "52px");
            $(".marquee .marquee-content").css("height", "596px");
        }
        else if (window.matchMedia('(max-width: 768px)').matches)
        {
            $(".marquee .marquee-content").css("margin-top", "92px");
            $(".marquee .marquee-content").css("height", "557px");
        }
       });
});


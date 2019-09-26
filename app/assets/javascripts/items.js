

$(function(){
  
  $(".header__box__bottom__left__search__category").hover(function(){

    $(".menu").stop().slideToggle(100);
  });
});


$(function(){
  
  $(".menu").hover(function(){
    $(".menu2").stop().slideToggle(100);
  });
});

$(function(){
  
  $(".menu2").hover(function(){
    $(".menu2").stop().slideToggle(100);
  });
});

$(function(){
  
  $(".menu2").hover(function(){
    $(".menu3").stop().slideToggle(100);
  });
});

$(function(){
  
  $(".menu3").hover(function(){
    $(".menu3").stop().slideToggle(100);
  });
});

$(function(){
  
  $(".menu3").hover(function(){
    $(".menu2").stop().slideToggle(100);
  });
});

// ブランドのやつ

$(function(){
  
  $(".header__box__bottom__left__search__brand").hover(function(){
    $(".brand").stop().slideToggle(100);
  });
});

// ニュースのやつ

$(function(){
  
  $(".header__box__bottom__right__news").hover(function(){
    $(".news").stop().slideToggle(100);
  });
});

$(function(){
  
  $(".header__box__bottom__right__todo").hover(function(){
    $(".header__box__bottom__right__todo__hidden1").stop().slideToggle(100);
  });
});


// ここから自動スクロール

$(function(){
  var dir = -1;
  var interval = 3000;
  var duration = 500;
  var timer;

  $(".content__all__scrol__bar__slider").prepend($(".scroll2"));
  $(".content__all__scrol__bar__slider").css("left", -1680);
  timer = setInterval(slideTimer, interval);
  
  function slideTimer(){
    if(dir == -1){
    $(".content__all__scrol__bar__slider").animate({"left" : "-=1680px"}, duration,
    function(){
      $(this).append($(".scroll1"));
      $(this).css("left", -1680);
    });
    }else{  
      // 画像一枚分右にスクロール
      $(".content__all__scrol__bar__slider").animate({"left" : "+=1680px"}, duration,
      function(){
        $(this).prepend($(".scroll1"));

        $(this).css("right", -1680);
        dir = -1;
      });
    }
  }


  $(".content__all__scrol__bar__left").click(function(){
    dir = 1;

    clearInterval(timer);
    timer = setInterval(slideTimer, interval);

    slideTimer();
  });


  $(".content__all__scrol__bar__right").click(function(){
    dir = -1;

    clearInterval(timer);
    timer = setInterval(slideTimer, interval);

    slideTimer();
  });
});



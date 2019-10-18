$(function(){
  
  $(".header__box__bottom__left__search__category").hover(function(){
    $(".menu").stop().slideToggle(100);
  $(document).on('hover','.menu1',function(e){
    console.hoge('hogehoge')
  })

});

  // $(".menu").hover(function(){
  //   $(".menu2").stop().slideToggle(100);
  // });

  // $(".menu2").hover(function(){
  //   $(".menu2").stop().slideToggle(100);
  // });
});


// $(function(){
  
//   $(".menu2").hover(function(){
//     $(".menu3").stop().slideToggle(100);
//   });
// });

// $(function(){
  
//   $(".menu3").hover(function(){
//     $(".menu3").stop().slideToggle(100);
//   });
// });

// $(function(){
  
//   $(".menu3").hover(function(){
//     $(".menu2").stop().slideToggle(100);
//   });
// });

$(function(){
  $(".menu").hover(function(){
    // function(){
    $($(this).children("ul")).css("display", "block");
    $($(this).children("ul").children("li")).css("display", "block");
    
    },
    function(){
    $($(this).children("ul")).css("display", "none");
  });
  $(".menu2").hover(function(){
    // function(){
    $($(this).children("ul")).css("display", "block");
    $($(this).children("ul").children("li")).css("display", "block");
    
    },
    function(){
    $($(this).children("ul")).css("display", "none");
  });
  $(".menu3").hover(function(){
    // function(){
    $($(this).ul).css("display", "block");
    $($(this).ul.children("li")).css("display", "block");
    
    },
    function(){
    $($(this).ul).css("display", "none");
  });
    // $(document).on({'mouseover': '.menu2',function(){
    //   console.log('hoge')
    //   $(this).parent("ul").css("display", "block");
    //   $(this).children("ul").css("display", "block");
    //   console.log($(this).children("ul"));
    //   },
    //   'mouseleave': function(){
    //     $(this).children("ul").css("display", "none");
    //   }
    // },
    // '.menu2')
    // $('.menu2').hover(function(){
    //   console.log('hoge')
    //   $(this).parent("ul").css("display", "block");
    //   $(this).children("ul").css("display", "block");
    // })
  
})
  //   function(){
  //   $(this).parent("ul").css("display", "block")
  //   console.log($(this).parent("ul"));
  //   $(this).children("ul").css("display", "block")
  // },
  //   function(){
  //   $(this).children("ul").css("display", "none")
  //   }
//   )

// })

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
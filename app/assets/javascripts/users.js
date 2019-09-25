$(function() {
  console.log("ok")
  $('.mypage__tabs').children('li').click(function(){
    
    $('.mypage__tabs').children('.tag__changed').removeClass('tag__changed');
    $(this).addClass('tag__changed');

    $('.message__content__tab').toggleClass('active');
  })


  $('.bottom__mypage__tabs').children('li').click(function(){
    
    $('.bottom__mypage__tabs').children('.tag__changed').removeClass('tag__changed');
    $(this).addClass('tag__changed');

    $('.bottom--content__tab__item').toggleClass('active');
  })
});

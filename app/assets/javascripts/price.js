$(function(){

  $('.item-price__choice__input-area').children('input').keyup(function(){
    var regex = new RegExp(/^([0-9]{3,7})$/);
    var num =  $(this).val();
    var valid_min = 300;
    var valid_max = 9999999;

    if (num >= valid_min && num <= valid_max && regex.test(num)){
      
      var fee = Math.floor(num*0.1);
      var profit = Math.floor(num-fee);

      $('.item-price__choice__fee-area').text('¥'+fee);
      $('.item-price__choice__profit-area').text('¥'+profit);
    } else {
      $('.item-price__choice__fee-area').text('-');
      $('.item-price__choice__profit-area').text('-');
    }
  })
})



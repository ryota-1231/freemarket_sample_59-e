$(function($){
  function formSetDay(){
    var lastday = formSetLastDay($('#user_birthdate_year').val(), $('#user_birthdate_month').val());
    var option = '';
    for (var i = 1; i <= lastday; i++) {
      if (i === $('#user_birthdate_day').val()){
        option += '<option value="' + i + '"selected="selected">' + i + '</option>\n';
      }else{
        option += '<option value="' + i + '">' + i + '</option>\n';
      }
    }
    $('#user_birthdate_day').html(option);
  }

  function formSetLastDay(year, month){
    var lastday = new Array('', 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    if ((year % 4 === 0 && year % 100 !== 0) || year % 400 === 0){
      lastday[2] = 29;
    }
    return lastday[month];
  }

  $('#user_birthdate_year, #user_birthdate_month').change(function(){
    formSetDay();
  });
});
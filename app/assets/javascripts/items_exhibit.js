$(function(){

$('#item_category_id').change(function(e){
  e.preventDefault();
  console.log(this.options[this.options.selectedIndex].value)

  var formData = new FormData(this);
  var url = $(this).attr('action')

  $.ajax({
    type: 'POST',
    url: '/todos.json',
    data: {
      todo: {
        content: todo
      }
    },
    dataType: 'json'
  })

    .done(function(message){
      var html = buildHTML(message);
      $('.messages').append(html);
      $('#new_message').get(0).reset();

      $('.messages').animate({scrollTop: $('.messages')[0].scrollHeight}, 'slow');
      })

    .fail(function(){
    alert('メッセージを入力してください。')
    })

})









})


$(function(){
  var images = []
  var inputs = []
  var list = new DataTransfer();
  var dropZone = document.getElementById("image-box-1");
  var doc = document.querySelector('input[type=file]')

window.onload = function(){
  
  dropZone.addEventListener("dragover", function(e) {
    e.stopPropagation();
    e.preventDefault();
    
    $(this).children('#image-box__container').css({'border': '1px solid rgb(204, 204, 204)','box-shadow': '0px 0px 12px'})
  }, false);

  dropZone.addEventListener("dragleave", function(e) {
    e.stopPropagation();
    e.preventDefault();
    
    $(this).children('#image-box__container').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'})
  }, false);

  dropZone.addEventListener("drop", function(e) {
    e.stopPropagation();
    e.preventDefault();

    $(this).children('#image-box__container').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'});

    var files = e.dataTransfer.files;
    
    for (var i = 0; i < files.length; i++) {
      (function() {

        var num = $('.item-image').length + 1
        if (num<=4){
          var num = $('.item-image').length + 1
        } else if (num==5) {
          $('#image-box-1').append(`<ul class='item-images'></ul>`)
          $('#image-box__container').removeClass(`item-num-4`)
          var num = $('.item-image').length -4+i
        } else if (num == 6){
          var num = 1
          $('.item-images').toggleClass('active');
        } else if (num >= 6 && num < 10){
          $('#image-box__container').removeClass(`item-num-4`)
          var num = $('.item-image').length -4
        } else {
          $('#image-box__container').remove()
        }

        var fr = new FileReader();
        fr.onload = function() {
          var src = fr.result
          var html =`<li class='item-image item-list-${num}'>
                      <div class='item-image__content'>
                        <div class='item-image__content--icon'>
                          <img src=${src} width="114" height="80" >
                        </div>
                      </div>

                      <div class='item-image__operetion'>
                        <div class='item-image__operetion--edit'>
                          <a href=''>編集</a>
                        </div>
                        <div class='item-image__operetion--delete'>
                          <a href=''>削除</a>
                        </div>
                      </div>
                    </li>`
          $('#image-box__container').removeClass(`item-num-${num-1}`)
          $('#image-box__container').addClass(`item-num-${num}`)
          $('.item-images.active').append(html);
          $('input[type=file]').append(files[0])
        };
        fr.readAsDataURL(files[0]);
      })();
      formData.append("file", files[0]);
    }
  },false);

  $(document).on('change','input[type=file]',function(e) {
    $('.image-box__container').css({'margin-left':'13px','border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'});
    
    var file = $(this).prop('files')[0];
    $.each(this.files, function(i,input){
    list.items.add(input)
    console.log(doc.files)
    doc.filse = list.files
    var num = $('.item-image').length + 1
    if (num<=4){
      var num = $('.item-image').length + 1
    } else if (num==5) {
      $('#image-box-1').append(`<ul class='item-images'></ul>`)
      $('#image-box__container').removeClass(`item-num-4`)
      var num = $('.item-image').length -4
    } else if (num == 6){      
      var num = 1
      $('.item-images').toggleClass('active');
    } else if (num >= 6 && num < 10){
      $('#image-box__container').removeClass(`item-num-4`)
      var num = $('.item-image').length -4
    } else {
      $('#image-box__container').remove()
    }
    var fr = new FileReader();
    fr.onload = function(e) {
      var src = e.target.result
      var html =`<li class='item-image item-list-${num} data-image-${num}'><div class='item-image__content'>
      <div class='item-image__content--icon'><img src=${src} width="114" height="80"></div>
      </div><div class='item-image__operetion'>
      <div class='item-image__operetion--edit'>編集</div><div class='item-image__operetion--delete'>削除</div></div></li>`
        
      $('#image-box__container').removeClass(`item-num-${num-1}`)
      $('#image-box__container').addClass(`item-num-${num}`)
      $('.item-images.active').append(html);
      images.push(html)
    }; 
    fr.readAsDataURL(file);
    })
  })

  $(document).on('click', '.item-image__operetion--delete', function() {
    var target_image = $(this).parent().parent();
    $.each(inputs, function(index, input){
      if ($(this).data('image') == target_image.data('image')){
        $(this).remove();
        target_image.remove();
        var num = $(this).data('image');
        images.splice(num, 1);
        inputs.splice(num, 1);
        if(inputs.length == 0) {
          $('input[type= "file"]').attr({
            'data-image': 0
          })
        }
      }
    })

    $('input[type= "file"]:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type= "file"]:first').after(input)
      })
  })
  }
})


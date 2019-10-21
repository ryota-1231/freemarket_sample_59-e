$(function(){
  var inputs = []
  var list = new DataTransfer();
  var dropZone = document.getElementById("image-box-1");
  var doc = document.querySelector('input[type=file]')


window.onload = function(e){
   
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

    $.each(files, function(i,file){
        var fr = new FileReader();
        list.items.add(file)
        doc.files = list.files
        var num = $('.item-image').length + 1 + i
        fr.readAsDataURL(file);

        if (num==10){
          $('#image-box__container').css('display', 'none')   
        }

        fr.onload = function() {
          var src = fr.result
          var html =`<div class='item-image' data-image="${file.name}">
                    <div class=' item-image__content'>
                      <div class='item-image__content--icon'>
                        <img src=${src} width="114" height="80" >
                      </div>
                    </div>
                    <div class='item-image__operetion'>
                      <div class='item-image__operetion--delete'>削除</div>
                    </div>
                  </div>`
         $('#image-box__container').before(html);
         inputs.push(html)
        };
        $('#image-box__container').attr('class', `item-num-${num}`)
    })
  },false);

  $(document).on('change','input[type=file]',function(e) {
    $('.image-box__container').css({'margin-left':'13px','border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'});
    var file = $(this).prop('files')[0];

    $.each(this.files, function(i,input){
      var fr = new FileReader();
      list.items.add(file)
      doc.files = list.files
      var num = $('.item-image').length + 1 + i
      fr.readAsDataURL(file);

      if (num==10){
        $('#image-box__container').css('display', 'none')   
      }

      fr.onload = function() {
        var src = fr.result
        var html =`<div class='item-image' data-image="${file.name}">
                    <div class=' item-image__content'>
                      <div class='item-image__content--icon'>
                        <img src=${src} width="114" height="80" >
                      </div>
                    </div>
                    <div class='item-image__operetion'>
                      <div class='item-image__operetion--delete'>削除</div>
                    </div>
                  </div>`
       $('#image-box__container').before(html);
       inputs.push(html)
      };
      $('#image-box__container').attr('class', `item-num-${num}`)
  })
})

  $(document).on('click', '.item-image__operetion--delete', function(e) {
    var target_image = $(this).parent().parent()
    var input = doc.files
    var target_name = $(target_image).data('image');
    if (doc.files.length==1){
      $('input[type=file]').val(null)
      list.clearData()
    }  else {
    $.each(input, function(i,inp){
     if (inp.name==target_name){
      list.items.remove(i)
     }
    })
      doc.files = list.files
    }
    
    target_image.remove()

    var num = $('.item-image').length
    $('#image-box__container').show()
    $('#image-box__container').attr('class', `item-num-${num}`)

  })
  }
})
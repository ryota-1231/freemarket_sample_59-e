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
          var html =`<div class='item-image' data-image="${num}">
                    <div class=' item-image__content'>
                      <div class='item-image__content--icon'>
                        <img src=${src} width="114" height="80" >
                      </div>
                    </div>
                    <div class='item-image__operetion'>
                      <div class='item-image__operetion--edit'>編集</div>
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
        var html =`<div class='item-image' data-image="${num}">
                    <div class=' item-image__content'>
                      <div class='item-image__content--icon'>
                        <img src=${src} width="114" height="80" >
                      </div>
                    </div>
                    <div class='item-image__operetion'>
                      <div class='item-image__operetion--edit'>編集</div>
                      <div class='item-image__operetion--delete'>削除</div>
                    </div>
                  </div>`
       $('#image-box__container').before(html);
       inputs.push(html)
      };
      $('#image-box__container').attr('class', `item-num-${num}`)
  })

})

  // $(document).on('click', '.item-image__operetion--delete', function(e) {
  //   var target_image = $(this).parent().parent();
  //   var num = $(target_image).data('image');

  //   var files = e.dataTransfer.files;
    
  //   inputs.splice(num-1, 1);
  //   target_image.remove();

  //   // list.splice(num-1,1)
  //   // doc.files = list.files

  //   console.log(files)


  //   // $('input[type= "file"]:first').attr({
  //   //   'data-image': inputs.length
  //   // })
  //   // $.each(inputs, function(index, input) {
  //   //   var input = $(this)
  //   //   input.attr({
  //   //     'data-image': index
  //   //   })
  //   //   $('input[type= "file"]:first').after(input)
  //   //   })
  // })
  }
})


$(function(){

  var images = []
  var inputs = []

  	
window.onload = function(){

  var list = new DataTransfer();
  var dropZone = document.getElementById("image-box-1");

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
      inputs.push($(this))
      var src = e.target.result
      var html =`<li class='item-image item-list-${num}'><div class='item-image__content'>
      <div class='item-image__content--icon'><img src=${src} width="114" height="80"></div>
      </div><div class='item-image__operetion'>
      <div class='item-image__operetion--edit'><a href=''>編集</a></div><div class='item-image__operetion--delete'><a href=''>削除</a></div></div></li>`
        
      $('#image-box__container').removeClass(`item-num-${num-1}`)
      $('#image-box__container').addClass(`item-num-${num}`)
      $('.item-images.active').append(html);
    };
    fr.readAsDataURL(file);
    // list.push()

  })
}


})



// $(document).on('turbolinks:load', function(){
//   var dropzone = $('.dropzone-area');
//   var dropzone2 = $('.dropzone-area2');
//   var dropzone_box = $('.dropzone-box');
//   var images = [];
//   var inputs  =[];
//   var input_area = $('.input_area');
//   var preview = $('#preview');
//   var preview2 = $('#preview2');

//   var list = new DataTransfer()

//   $(document).on('change', 'input[type= "file"].upload-image',function(event) {
//     var file = $(this).prop('files')[0];
//     var reader = new FileReader();
//     inputs.push($(this));
//     var img = $(`<div class= "img_view"><img></div>`);
//     reader.onload = function(e) {
//       var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>');
//       img.append(btn_wrapper);
//       img.find('img').attr({
//         src: e.target.result
//       })
//     }
//     reader.readAsDataURL(file);
//     images.push(img);

//     if(images.length >= 5) {
//       dropzone2.css({
//         'display': 'block'
//       })
//       dropzone.css({
//         'display': 'none'
//       })
//       $.each(images, function(index, image) {
//         image.attr('data-image', index);
//         preview2.append(image);
//         dropzone2.css({
//           'width': `calc(100% - (135px * ${images.length - 5}))`
//         })
//       })
//       if(images.length == 9) {
//         dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
//       }
//     } else {
//         $('#preview').empty();
//         $.each(images, function(index, image) {
//           image.attr('data-image', index);
//           preview.append(image);
//         })
//         dropzone.css({
//           'width': `calc(100% - (135px * ${images.length}))`
//         })
//       }
//       if(images.length == 4) {
//         dropzone.find('p').replaceWith('<i class="fa fa-camera"></i>')
//       }
//     if(images.length == 10) {
//       dropzone2.css({
//         'display': 'none'
//       })
//       return;
//     }
//     var new_image = $(`<input multiple= "multiple" name="product_images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
//     input_area.prepend(new_image);
//   });
//   $(document).on('click', '.delete', function() {
//     var target_image = $(this).parent().parent();
//     $.each(inputs, function(index, input){
//       if ($(this).data('image') == target_image.data('image')){
//         $(this).remove();
//         target_image.remove();
//         var num = $(this).data('image');
//         images.splice(num, 1);
//         inputs.splice(num, 1);
//         if(inputs.length == 0) {
//           $('input[type= "file"].upload-image').attr({
//             'data-image': 0
//           })
//         }
//       }
//     })
//     $('input[type= "file"].upload-image:first').attr({
//       'data-image': inputs.length
//     })
//     $.each(inputs, function(index, input) {
//       var input = $(this)
//       input.attr({
//         'data-image': index
//       })
//       $('input[type= "file"].upload-image:first').after(input)
//     })
//     if (images.length >= 5) {
//       dropzone2.css({
//         'display': 'block'
//       })
//       $.each(images, function(index, image) {
//         image.attr('data-image', index);
//         preview2.append(image);
//       })
//       dropzone2.css({
//         'width': `calc(100% - (135px * ${images.length - 5}))`
//       })
//       if(images.length == 9) {
//         dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
//       }
//       if(images.length == 8) {
//         dropzone2.find('i').replaceWith('<p>ココをクリックしてください</p>')
//       }
//     } else {
//       dropzone.css({
//         'display': 'block'
//       })
//       $.each(images, function(index, image) {
//         image.attr('data-image', index);
//         preview.append(image);
//       })
//       dropzone.css({
//         'width': `calc(100% - (135px * ${images.length}))`
//       })
//     }
//     if(images.length == 4) {
//       dropzone2.css({
//         'display': 'none'
//       })
//     }
//     if(images.length == 3) {
//       dropzone.find('i').replaceWith('<p>ココをクリックしてください</p>')
//     }
//   })
// });
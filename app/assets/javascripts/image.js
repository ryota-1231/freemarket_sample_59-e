$(function(){
  	
window.onload = function(){
var formData = new FormData();
var dropZone = document.getElementById("image-box");

  dropZone.addEventListener("dragover", function(e) {
    e.stopPropagation();
    e.preventDefault();
    
    $(this).children('.image-box__container').css({'border': '1px solid rgb(204, 204, 204)','box-shadow': '0px 0px 12px'})
  }, false);

  dropZone.addEventListener("dragleave", function(e) {
    e.stopPropagation();
    e.preventDefault();
    
    $(this).children('.image-box__container').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'})
  }, false);

  dropZone.addEventListener("drop", function(e) {
    e.stopPropagation();
    e.preventDefault();

    $(this).children('.image-box__container').css({'margin-left':'13px','border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'});

    var files = e.dataTransfer.files;
   
    for (var i = 0; i < files.length; i++) {
      (function() {
        var fr = new FileReader();
        fr.onload = function() {
          // var img = document.createElement('img');

          var src = fr.result
          var html =`<li class='item-image'>
                      <div class='item-image__content'>
                        <div class='item-image__content--icon'>
                          <img src=${src} width="114" height="80">
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
            
          $('.item-images').append(html);
        };
        fr.readAsDataURL(files[i]);
      })();
      formData.append("file", files[i]);
    }
  },false);

  $('input[type=file]').change(function(e) {
 
    $(this).children('.image-box__container').css({'margin-left':'13px','border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'});
     var last_image_id = $('.item-image:last').data('image');
     console.log(last_image_id);

        for (var i = 0; i < 3; i++) {
          (function() {
            var fr = new FileReader();
            fr.onload = function(e) {
              var src = e.target.result
              var data_id = 1;
              var html =`<li class='item-image'><div class='item-image__content'>
              <div class='item-image__content--icon'><img src=${src} width="114" height="80" data-image=${data_id} ></div>
              </div><div class='item-image__operetion'>
              <div class='item-image__operetion--edit'><a href=''>編集</a></div><div class='item-image__operetion--delete'><a href=''>削除</a></div></div></li>`
                
              $('.item-images').append(html);
            };
            fr.readAsDataURL(e.target.files[i]);
          })();
        }

})
}

})

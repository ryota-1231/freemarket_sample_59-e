$(function(){

  function buildHTML(category){
    var html = 
      `<option value=${category.id}>${category.name}</option>`
    return html;
  }
  function addHtml(brand){
    var html = 
      `<li id="${brand.id}" class="brand_chose">${brand.name}</li>`
    return html;
  }

  $('#item_category_id').change(function(e){
  e.preventDefault();
  $('.category_children').empty()
  $('.category_g_children').empty()
  $('.item-category__choice__size').css('display','none')
  $('.item-category__choice__brand').css('display','none')
  var parent_id= this.options[this.options.selectedIndex].value
  $('.category_children').css('display','block')

  $.ajax({
    type: 'get',
    url: '/api/categories',
    data: { parent_id: parent_id },
    dataType: 'json'
  })

    .done(function(child_category){
      $('.category_children').append(`<option value="">---</option>`)
      $.each(child_category, function(i, e) {
          var html = buildHTML(e);
          $('.category_children').append(html)
      })
        $('.category_children').change(function(e){
          e.preventDefault();
          $('.category_g_children').empty()

          var parent_id= this.options[this.options.selectedIndex].value
          $('.category_g_children').css('display','block')
        
          $.ajax({
            type: 'get',
            url: '/api/categories',
            data: { parent_id: parent_id },
            dataType: 'json'
          })
          .done(function(child_category){
            $('.category_g_children').empty()
            $('.category_g_children').append(`<option value="">---</option>`)
            $.each(child_category, function(i, e) {
                var html = buildHTML(e);
                $('.category_g_children').append(html)
            })


            $('.category_g_children').change(function(e){
              var parent_id= this.options[this.options.selectedIndex].value
              $('.item-category__choice__size-area').empty()
              $('.item-category__choice__size').css('display','none')

              if (!parent_id==""){
              $.ajax({
                type: 'get',
                url: '/api/sizetypes',
                data: { parent_id: parent_id },
                dataType: 'json'
              })

              .done(function(sizetypes){
                
                $('.item-category__choice__size').css('display','block')
                $('.item-category__choice__size-area').empty()
                $('.item-category__choice__size-area').append(`<option value="">---</option>`)
                $.each(sizetypes, function(i, e) {
                    var html = buildHTML(e);
                    $('.item-category__choice__size-area').append(html)
                })
              })
            }
          })

            $('.category_g_children').change(function(e){
              var parent_id= this.options[this.options.selectedIndex].value
              $('.item-category__choice__size-area').empty()
              $('.item-category__choice__size').css('display','none')

              if (!parent_id==""){
              $.ajax({
                type: 'get',
                url: '/api/sizetypes',
                data: { parent_id: parent_id },
                dataType: 'json'
              })

              .done(function(sizetypes){
                $('.item-category__choice__size').css('display','block')
                $('.item-category__choice__size-area').empty()
                $('.item-category__choice__size-area').append(`<option value="">---</option>`)
                $.each(sizetypes, function(i, e) {
                    var html = buildHTML(e);
                    $('.item-category__choice__size-area').append(html)
                })
                

              })
            }

            })
          })
        })
    })
    .fail(function(){
    alert('選択してください')
    })
  })

  $('.category_g_children').change(function(e){
    e.preventDefault();
    $('.item-category__choice__brand').css('display','block')

    $('.item-category__choice__brand').keyup(function(){
    var input = $(".item-category__choice__brand-area").val();
    if (input == "") {
      $('.brand_area').css('border','none');
      $('.brands_area').css('display','none')
      return
    }

    $.ajax({
      type: 'GET',
      url: '/api/brands',
      data: { input: input },
      dataType: 'json'
    })

    .done(function(brands) {
      $(".brand_area").empty();
      $('.brands_area').css('display','block')
      $('.brand_area').css('border','1px solid rgb(226, 226, 226)');

      if (brands.length !== 0)  {
        $.each(brands, function(i, brand) {
          var addhtml = addHtml(brand)
          $('.brand_area').append(addhtml)
      })
      }
      else {
        $('.brand_area').append(`<li id="" class="brand_chose">一致する名前はありません</li>`);
      };

    })
    .fail(function(){
     })

     $(document).on("click", ".brand_chose", function (e) {
       chosen_text = $(this).text()
       choice_id = $(this).attr('id')
       
       $('.brand_choice').val(choice_id)
       $('.item-category__choice__brand-area').val(chosen_text)

       $('.brand_area').css('display','none')     

    })
    $(document).on('keyup', '.item-category__choice__brand',function(e){
      var input = $(".item-category__choice__brand-area").val();
      if (input == "") {
        $('.brand_area').css('border','none');
        return
      }
  
      $.ajax({
        type: 'GET',
        url: '/api/brands',
        data: { input: input },
        dataType: 'json'
      })
  
      .done(function(brands) {
        $(".brand_area").empty();
        $('.brand_area').css('display','block')
        $('.brand_area').css('border','1px solid rgb(226, 226, 226)');
  
        if (brands.length !== 0)  {
          $.each(brands, function(i, brand) {
            var addhtml = addHtml(brand)
            $('.brand_area').append(addhtml)
        })
        }
        else {
          $('.brand_area').append(`<li id="" class="brand_chose">一致する名前はありません</li>`);
        };
  
      })
      .fail(function(){
       })

   })
  })
  })
})




  






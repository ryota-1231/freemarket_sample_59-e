$(function(){

  function buildHTML(category){
    var html = 
      `<option value=${category.id}>${category.name}</option>`
    return html;
  }
  function addHTML(g_children){
    var html = 
      `<div class="check-box-default"><input type="checkbox" value="${g_children.id}" name="q[category_id_in][]" id="q_category_id_in_${g_children.id}">
      <label for="q_category_id_in_${g_children.id}">${g_children.name}</label></div>`
    return html;
  }
  function brandAddHtml(brand){
    var html = 
      `<li id="${brand.id}" class="brand_chose">${brand.name}</li>`
    return html;
  }
  function sizeAddHTML(g_children){
    var html = 
      `<div class="sizetype-select">
        <input type="checkbox" value="${g_children.id}" name="q[sizetype_id_in][]" id="q_sizetype_id_in_${g_children.id}">
        <label for="q_sizetype_id_in_${g_children.id}">${g_children.name}</label>
      </div>`
    return html;
  }

  // カテゴリーの検索
  $('#q_category_id').change(function(e){
    e.preventDefault();
    $('.category_children').empty()
    $('.search-content__category__select').empty()
    $('.category_children').css('display','block')

    var parent_id= this.options[this.options.selectedIndex].value

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
    })

    $(document).on('change','.category_children',function(e){
      e.preventDefault();
      var parent_id= this.options[this.options.selectedIndex].value

      $.ajax({
        type: 'get',
        url: '/api/categories',
        data: { parent_id: parent_id },
        dataType: 'json'
      })

      .done(function(child_category){
        $('.search-content__category__select').empty()
        $('.search-content__category__select').append(`<input name="q[category_id_in][]" type="hidden" value="">`)
        $.each(child_category, function(i, e) {
          var html = addHTML(e);
          $('.search-content__category__select').append(html)
        })
      })
    })
  })
  // ブランドの検索
  $('.search-content__brand-area').keyup(function(){
    var input = $(".search-content__brand-area").val();
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
      $('.brand_area').css('box-shadow','rgba(0, 0, 0, 0.4) 0px 10px 10px 1px');

      if (brands.length !== 0)  {
        $.each(brands, function(i, brand) {
          var addhtml = brandAddHtml(brand)
          $('.brand_area').append(addhtml)
      })
      }
      else {
        $('.brand_area').append(`<li id="" class="brand_chose">一致する名前はありません</li>`);
      };

    })
  })
  $(document).on("click", ".brand_chose", function (e) {
      chosen_text = $(this).text()
      choice_id = $(this).attr('id')
      
      $('.brand_choice').val(choice_id)
      $('.search-content__brand-area').val(chosen_text)
      $('.brand_area').css('display','none')     

  })
  $(document).on('keyup', '.search-content__brand-area',function(e){
        var input = $(".search-content__brand-area").val();
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
              var addhtml = brandAddHtml(brand)
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
  // サイズの検索
  $('#q_sizetype_id').change(function(e){
    e.preventDefault();
    $('.search-content__sizetype__select').empty()
    $('.search-content__sizetype__select').append(`<input name="q[sizetype_id_in][]" type="hidden" value="">`)

    var sizetype_id= this.options[this.options.selectedIndex].value

    $.ajax({
      type: 'get',
      url: '/api/sizetypes',
      data: { sizetypes: sizetype_id },
      dataType: 'json'
    })

    .done(function(child_sizetype){
      $('.search-content__sizetype__select').empty()
      $('.search-content__sizetype__select').append(`<input type="hidden" name="q[sizetype_id_eq][]" value="">`)
      
      $.each(child_sizetype, function(i, e) {
          var html = sizeAddHTML(e);
          $('.search-content__sizetype__select').append(html) 
      })
    })
  })
})
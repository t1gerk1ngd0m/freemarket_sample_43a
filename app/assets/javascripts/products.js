$(function() {
  $(document).on("change", "#product_category_small", function(){
    $("#size").removeClass("hidden");
  });

  // 配送負担選択時のフォーム追加
  $("#product_shipping_charges_burden").change(function(){
    $("#shipping_method").removeClass("hidden");
  });

  // 値段の算出
  $("#product_price").keyup(function(){

    var maxPrice = 9999999
    var minPrice = 300
    var str = $('#product_price').val();
    var commission = Math.floor(str * 0.1)
    var profit = str - commission

    if(str >= minPrice && str <= maxPrice) {
      $("#commission").text(commission);
      $("#profit").text(profit);
    } else {
      $("#commission").text("-");
      $("#profit").text("-");
    }
  });

  // 画像プレビュー表示のための関数
  function imagePreview(files, $preview) {
    for (var i = 0; i < files.length; i++){
      file = files[i];
      reader = new FileReader();

      // 画像ファイル以外の場合は何もしない
      if(file.type.indexOf("image") < 0){
        return false;
      }

    // ファイル読み込みが完了した際のイベント登録
      reader.onload = (function(file) {
        return function(e) {
          var loadedImageUri = e.target.result;
          var appendImage = `<li class="image-upload-item">
                              <figure class="sell-upload-figure portrait">
                                <img src="${ loadedImageUri }" alt class>
                              </figure>
                              <div class="sell-upload-button"><!--
                                --><a href="" class="sell-upload-edit">編集</a><!--
                                --><a href="" class="delete-preview">削除</a><!--
                              --></div>
                            </li>`
          // .prevewの領域の中にロードした画像を表示するimageタグを追加
          $preview.append(appendImage);
        };
      })(file);
      reader.readAsDataURL(file);
    }
  }

  // 画像アップロード時のview変更
  $('#product_item_images_attributes_0_name').change(function(e) {
    var files = e.target.files,
        $preview = $(".image-upload-items ul");
    imagePreview(files, $preview)
  });

  // ドラッグアンドドロップで画像選択した時にプレビューを表示させる
  $('.image-upload-dropbox').on('dragover', function(event) {
    event.preventDefault();
  });
  $('.image-upload-dropbox').on('drop', function drop(e) {
    e.preventDefault();
    var files = e.originalEvent.dataTransfer.files,
        $preview = $(".image-upload-items ul");
    imagePreview(files, $preview)
  });

  // 画像プレビューを削除する
  $(document).on('click', '.delete-preview', function(e) {
    e.preventDefault();
    $(this).parents('.image-upload-item').remove();
  })

  // カテゴリーフォームのオプションを作成する
   function buildOption(selections){
    var options = ``
    selections.forEach(function(selection){
      option = `<option value="${selection.id}">${selection.name}</option>`
      options += option
    });
    return options;
  }

  // category_middleフォームを作成する
  function buildFormMiddle(selections){
    var buildOptions = buildOption(selections)
    var form = `<div class="select-wrap">
                  <select class="select-default" name="product[category_middle]" id="product_category_middle">
                    <option value="">---</option>
                    ${buildOptions}
                  </select>
                  <i class="icon-arrow-bottom"></i>
                </div>`
    return form;
  }

  // category_smallフォームを作成する
  function buildFormSmall(selections){
    var buildOptions = buildOption(selections)
    var form = `<div class="select-wrap">
                  <select class="select-default" name="product[category_small]" id="product_category_small">
                    <option value="">---</option>
                    ${buildOptions}
                  </select>
                  <i class="icon-arrow-bottom"></i>
                </div>`
    return form;
  }

  // category_large選択時のajax通信
  $("#product_category_large").change(function(e){
    e.preventDefault();

    $("#product_category_middle").remove();
    $("#product_category_small").remove();

    var selectData = $(this).val();
    if (selectData != "") {
      var url = "/products/getCategory_middles";
      $.ajax({
        url: url,
        type: "GET",
        data: {
          category_large: selectData
        },
        dataType: 'json'
      })
      .done(function(data){
        var html = buildFormMiddle(data);
        $('#category_select').append(html)
      })
      .fail(function(){
        alert('error');
      })
    }
  });

  // category_middle選択時のajax通信
  $(document).on("change", "#product_category_middle", function(e){
    e.preventDefault();

    $("#product_category_small").remove();

    var selectData = $(this).val();
    if (selectData != "") {
      var url = "/products/getCategory_smalls";
      $.ajax({
        url: url,
        type: "GET",
        data: {
          category_middle: selectData
        },
        dataType: 'json'
      })
      .done(function(data){
        var html = buildFormSmall(data);
        $('#category_select').append(html)
      })
      .fail(function(){
        alert('error');
      })
    }
  });
});

$(function(){
  // カテゴリ選択時のフォーム追加
  $("#product_category_large").change(function(){
    $("#product_category_middle").removeClass("hidden");
  });
  $("#product_category_middle").change(function(){
    $("#product_category_small").removeClass("hidden");
  });
  $("#product_category_small").change(function(){
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

  // function drop(e) {
  //   e.preventDefault();
  //   e.stopPropagation();
  //   var file = e.dataTransfer.files[0];
  //       reader = new FileReader(),
  //       $preview = $(".image-upload-items ul");
  //   console.log(file);
  //   if(file.type.indexOf("image") < 0){
  //     return false;
  //   }

  //   reader.onload = (function(file) {
  //     return function(e) {
  //       var loadedImageUri = e.target.result;
  //       var appendImage = '<li class="image-upload-item">
  //                           <figure class="sell-upload-figure portrait">
  //                             <img src="${ loadedImageUri }" alt class>
  //                           </figure>
  //                           <div class="sell-upload-button"><!--
  //                             --><a href class="sell-upload-edit">編集</a><!--
  //                             --><a href>削除</a><!--
  //                           --></div>
  //                         </li>'
  //       // .prevewの領域の中にロードした画像を表示するimageタグを追加
  //       $preview.append(appendImage)
  //     };
  //   })(file);
  //   reader.readAsDataURL(file);
  // };


  // 画像アップロード時のview変更
  $('#product_item_images_attributes_0_name').change(function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".image-upload-items ul");
    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

  // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        var loadedImageUri = e.target.result;
        var appendImage = '<li class="image-upload-item">
                            <figure class="sell-upload-figure portrait">
                              <img src="${ loadedImageUri }" alt class>
                            </figure>
                            <div class="sell-upload-button"><!--
                              --><a href class="sell-upload-edit">編集</a><!--
                              --><a href>削除</a><!--
                            --></div>
                          </li>'
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append(appendImage)
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

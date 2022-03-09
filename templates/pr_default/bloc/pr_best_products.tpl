<!--{*
 * Copyright(c) 2008 PakuReserve, Inc. All Rights Reserved.
 *}-->
<script type="text/javascript">
$(document).ready(function() {
    //おすすめ商品読み込み用
    var loadBestProducts = function() {
         with(this)
         {
             _noimage = '<!--{$smarty.const.NO_IMAGE_DIR}-->',
             _image_width = 196,
             _image_height = 196,
             _tile_group_id = 'tile_group';
         }
    };
    
    loadBestProducts.prototype = {
         initialize:function() {
         
         },
         setImageWidth:function(width) {
             this._image_width = width;
         },
         setImageHeight:function(height) {
             this._image_height = height;
         },
         setTileGroupId:function(tile_group_id) {
             this._tile_group_id = tile_group_id;
         },
         load:function(group_id) {
             var api_url = '/api/?jb=api-best_products';
             var params = {group_id:group_id};
             var ref = this;
             $.ajax({
                 url:api_url,
                 data:params,
                 type:'POST',
                 dataType:'json',
                 cache:false,
                 success:function (res) { ref._success(res); },
                 error:function (res) { ref._error(res); }
             });
         },
         _success:function(res) {
             var best_products = res.result;
             for (idx in best_products) {
                var best_product = best_products[idx];
                
                if (!best_product.main_list_image || typeof best_product.main_list_image == 'undefined') {
                    best_product.main_list_image = this._noimage;
                }
                
                //copy dom
                var c_tile = $('#source_child').clone();
                c_tile.children('a').attr('href' , '/product/detail/' + best_product.product_id);
                c_tile.children('a').children('img').attr('src' , '/resize_image.php?image=' + best_product.main_list_image + '&width=' + this._image_width + '&height=' + this._image_height);
                $('#' + this._tile_group_id).append(c_tile.attr('id' , 'tile_' + idx));
                //console.log(c_tile);
             }
             
             //remove copy source
             $('#source_child').remove(); 
         },
         _error:function(res) {
             alert('おすすめ商品の読み込みに失敗しました。');
             return;
         }
    };
    
    var objLoadBestProducts = new loadBestProducts();

    var lib_path = '/js/tilescroller.min.js?<!--{$smarty.const.FRONT_JS_VERSION}-->';
    //スクロール用js読み込み後に第3引数の関数を実施
    objJSLoader.add('js' , lib_path , function() {
         var options = {
             show_area_width:588, //表示エリアのwidth #recommendsのwidthを指定
             show_area_height:'auto',//一応用意したプロパティだが不要
             map_dom:'recommends', //一番外側のdomのID
             tile_group_dom:'tile_group',//タイル(スクロール対象の画像）の親domのID
             tile_width:196,//タイル(スクロール対象の1画像の）
             tile_height:196 //タイル(スクロール対象の1画像の）
         };
         
         //スクロールイベントアタッチ
         (new tileScroller(options)).bind();
    });
    
    //おすすめ商品読み込み
    objLoadBestProducts.load(1);
    objLoadBestProducts.setTileGroupId('tile_group');
    //objLoadBestProducts.setImageWidth(); //おすすめ商品画像のwidth(default 196)
    //objLoadBestProducts.setImageHieght();//おすすめ商品画像のheight(default 196)
    objJSLoader.load();
    
});
</script>
<style type="text/css">
#recommends{
     width:588px;
     border:1px solid gray;
     float:left;
}

.tile {
    width:196px;
    overflow:hidden;
}

.tile_group {
    position:relative;
    float:left;
}

#r_s_e_target {
   background:url(/gold/img/arrow_left.gif) center left no-repeat;
   float:left;
   display:block;
   height:196px;
   width:15px;
   cursor:pointer;
}

#l_s_e_target {
   background:url(/gold/img/arrow_right.gif) center left no-repeat;
   height:196px;
   width:15px;
   float:left;
   display:block;
   cursor:pointer;
}
</style>
<!--▼おすすめ情報ここから-->
<div>
  <div id="r_s_e_target" ><a href="#" ></a></div>
  <div id="recommends">
    <div id="tile_group">
      <div id="source_child" class="tile">
      <a href=""><img src="" /></a>
      </div>
    </div>
  </div>
  <div  id="l_s_e_target" ><a href="#"></a></div>
</div>
<!--▲おすすめ情報ここまで-->
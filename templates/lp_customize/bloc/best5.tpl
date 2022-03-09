<!--▼おすすめ情報ここから-->
<div id="recommend_all2">
	<div id="bloc_head_recommend">
		<h2>おすすめ情報<Br /><span class="mini">＜スライダー表示＞</span></h2>
	</div>
	<div id="slider1" class="owl-carousel owl-theme">
		<!--▼おすすめ情報　商品ブロック▼-->
		<!--{section name=cnt loop=$arrBestProducts step=1}-->
		<!--▼掲載商品数設定▼-->
		<!--{if $smarty.section.cnt.iteration < 9}-->
		<!--▲掲載商品数設定▲-->
		<div class="item">
          <div class="recomendblock2">
              <ul>
              <!--{if $arrBestProducts[cnt].main_list_image != ""}-->
              <!--{assign var=image_path value="`$arrBestProducts[cnt].main_list_image`"}-->
              <!--{else}-->
              <!--{assign var=image_path value="`$smarty.const.NO_IMAGE_DIR`"}-->
              <!--{/if}-->
                  <li>
                      <div class="reco_pic">
                          <a href="<!--{$smarty.const.URL_DIR}-->product/detail/<!--{$arrBestProducts[cnt].product_id}-->">
                              <img src="<!--{$smarty.const.URL_DIR}-->upload/save_image/<!--{$image_path|sfRmDupSlash}-->" alt="<!--{$arrBestProducts[cnt].name|escape}-->" />
                          </a>
                      </div>
                          <h3>
                              <a href="<!--{$smarty.const.URL_DIR}-->product/detail/<!--{$arrBestProducts[cnt].product_id}-->"><!--{$arrBestProducts[cnt].name|mb_truncate:20|mb_strimwidth:0:40:'...':'UTF-8'|escape}--></a>
                          </h3>

                          <!--{assign var=price01 value=`$arrBestProducts[cnt].price01_min`}-->
                          <!--{assign var=price02 value=`$arrBestProducts[cnt].price02_min`}-->
                          <!--{assign var=session_customer_id value=$smarty.session.customer|@null_coalescing:"customer_id"}-->

                          <p><span class="price">
                              <!--{if $price02 == "" && !strlen($price02)}-->
                              <!--{$arrBestProducts|@tax_min_normal_price_from_product:$arrInfo:$session_customer_id:$smarty.section.cnt.index|number_format|escape}-->
                              <!--{else}-->
                              <!--{$arrBestProducts|@reduce_tax_min_price_from_product:$arrInfo:$session_customer_id:$smarty.section.cnt.index|number_format|escape}-->
                              <!--{/if}-->円</span><span class="mini">(税込)</span>
                          </p>
                          <!--▼詳細コメント　表示にする場合はコメントアウトを削除して下さい▼-->
                          <!--<p class="mini"><!--{$arrBestProducts[cnt].comment|escape|nl2br|mb_strimwidth:0:80:'...':'UTF-8'}--></p>-->
                  </li>
              </ul>
          </div>
        </div>
		<!--{/if}-->
		<!--{/section}-->
		<!--▲おすすめ情報　商品ブロック▲-->

	</div>
</div>
<!--▲おすすめ情報ここまで-->

<!--設置上の注意-->
<!--
【左右どちらかに表示したい場合】
1.デザイン管理>PC用設定のレイアウト設定で左,もしくは右にブロックを設置します。
2.FTPからsite_frame.tplを開きます。
3.【▼横並びスライダー】javascriptの中、itemsの数を全て1に修正します。

修正表示例)
<script type="text/javascript">
  $(document).ready(function(){
	$('#slider1').owlCarousel({
        items : 1, //ブラウザの幅が1199px 以上の時 6
        itemsDesktop : [1199,1], // 1199px から 600px　まで 5つ
        itemsDesktopSmall : false, // betweem 900px and 601px
        itemsTablet: [600,1], //600px から 479px　まで　4つ
        itemsMobile : [479,1], // 479px　以下は 2つ
        autoPlay : true,
        stopOnHover : true,
        navigation : true
    });
  });
</script>
-->
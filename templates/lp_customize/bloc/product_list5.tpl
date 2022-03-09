<!--{*
 * Copyright(c) 2008 PakuReserve, Inc. All Rights Reserved.
5だよ
 *}-->
<!--▼おすすめ情報ここから-->
<div id="recomendarea">
<div id="bloc_head">
  <h2>
    <img src="<!--{$TPL_DIR}-->img/top/osusume.jpg" width="400" height="29" alt="おすすめ情報" />
  </h2>
</div>
  <!--{section name=cnt loop=$arrBestProducts step=2}-->
  <div class="recomendblock">
    <div class="recomendleft">
    <!--{if $arrBestProducts[cnt].main_list_image != ""}-->
      <!--{assign var=image_path value="`$arrBestProducts[cnt].main_list_image`"}-->
    <!--{else}-->
      <!--{assign var=image_path value="`$smarty.const.NO_IMAGE_DIR`"}-->
    <!--{/if}-->

      <a href="/product/detail/<!--{$arrBestProducts[cnt].product_id}-->">
        <img src="/resize_image.php?image=<!--{$image_path|sfRmDupSlash}-->&width=48&height=48" alt="<!--{$arrBestProducts[cnt].name|escape}-->" />
      </a>

      <h3>
        <a href="/product/detail/<!--{$arrBestProducts[cnt].product_id}-->"><!--{$arrBestProducts[cnt].name|escape}--></a>
      </h3>

<!--{assign var=price01 value=`$arrBestProducts[cnt].price01_min`}-->
<!--{assign var=price02 value=`$arrBestProducts[cnt].price02_min`}-->

      <p>価格<span class="mini">(税込)</span>：<span class="price">
<!--{if $price02 == ""}-->
  <!--{$arrBestProducts|@tax_min_normal_price_from_product:$arrInfo:$smarty.session.customer.customer_id:$smarty.section.cnt.index|number_format|escape}-->
<!--{else}-->
  <!--{$arrBestProducts|@reduce_tax_min_price_from_product:$arrInfo:$smarty.session.customer.customer_id:$smarty.section.cnt.index|number_format|escape}-->
<!--{/if}-->円
        </span>
      </p>
      <p class="mini"><!--{$arrBestProducts[cnt].comment|escape|nl2br}--></p>
    </div>

    <div class="recomendright">
      <!--{assign var=cnt2 value=`$smarty.section.cnt.iteration*$smarty.section.cnt.step-1` }-->
      <!--{if $arrBestProducts[$cnt2]|count > 0}-->
        <!--{if $arrBestProducts[$cnt2].main_list_image != ""}-->
          <!--{assign var=image_path value="`$arrBestProducts[$cnt2].main_list_image`"}-->
        <!--{else}-->
          <!--{assign var=image_path value="`$smarty.const.NO_IMAGE_DIR`"}-->
        <!--{/if}-->

      <a href="/product/detail/<!--{$arrBestProducts[$cnt2].product_id}-->">
        <img src="/resize_image.php?image=<!--{$image_path|sfRmDupSlash}-->&width=48&height=48" alt="<!--{$arrBestProducts[$cnt2].name|escape}-->" />
      </a>

      <h3>
      <a href="/product/detail/<!--{$arrBestProducts[$cnt2].product_id}-->"><!--{$arrBestProducts[$cnt2].name|escape}--></a>
      </h3>

<!--{assign var=price01 value=`$arrBestProducts[$cnt2].price01_min`}-->
<!--{assign var=price02 value=`$arrBestProducts[$cnt2].price02_min`}-->

      <p>価格<span class="mini">(税込)</span>：<span class="price">
<!--{if $price02 == ""}-->
  <!--{$arrBestProducts|@tax_min_normal_price_from_product:$arrInfo:$smarty.session.customer.customer_id:$smarty.section.cnt.index|number_format|escape}-->
<!--{else}-->
  <!--{$arrBestProducts|@reduce_tax_min_price_from_product:$arrInfo:$smarty.session.customer.customer_id:$smarty.section.cnt.index|number_format|escape}-->
<!--{/if}-->円</span>
      </p>

      <p class="mini"><!--{$arrBestProducts[$cnt2].comment|escape|nl2br}--></p>
      <!--{/if}-->
    </div>
  </div>
  <!--{/section}-->
</div>
<!--▲おすすめ情報ここまで-->

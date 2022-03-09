<!--▼おすすめ情報ここから-->
<div id="recommend_all">
	<div id="bloc_head_recommend">
		<h2>おすすめ情報<Br /><span class="mini">＜固定表示＞</span></h2>
	</div>
	<div id="recomendarea">
		<!--▼おすすめ情報　商品ブロック▼-->
		<!--{section name=cnt loop=$arrBestProducts step=1}-->
		<!--▼掲載商品数設定▼-->
		<!--{if $smarty.section.cnt.iteration < 9}-->
		<!--▲掲載商品数設定▲-->
		<div class="recomendblock">
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
						<!--{if $price02 == ""}-->
						<!--{$arrBestProducts|@tax_min_normal_price_from_product:$arrInfo:$session_customer_id:$smarty.section.cnt.index|number_format|escape}-->
						<!--{else}-->
                        <!--{$arrBestProducts|@reduce_tax_min_price_from_product:$arrInfo:$session_customer_id:$smarty.section.cnt.index|number_format|escape}-->
						<!--{/if}-->円
						</span>
                        <span class="mini">(税込)</span>
					</p>
					<p class="reco_cmt"><!--{$arrBestProducts[cnt].comment|mb_truncate:24|escape|nl2br|mb_strimwidth:0:80:'...':'UTF-8'}--></p>
				</li>
			</ul>
		</div>
		<!--{/if}-->
		<!--{/section}-->
		<!--▲おすすめ情報　商品ブロック▲-->
	</div>
</div>
<!--▲おすすめ情報ここまで-->
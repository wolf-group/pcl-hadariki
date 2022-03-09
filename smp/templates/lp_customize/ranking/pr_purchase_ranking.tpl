<div id="rankingarea">
	<div id="bloc_head_ranking">
		<h2>人気ランキング</h2>
	</div>
	<!--{foreach from=$rankingData key=key item=val name=loop}-->
		<!--{assign var=type value="`$smarty.foreach.loop.iteration%2`"}-->
		<!--{if $type == 0}-->
			<!--{* 偶数行 *}-->
			<!--{assign var=backcolor value="listarea2"}-->
		<!--{else}-->
			<!--{* 奇数行 *}-->
			<!--{assign var=backcolor value="listarea"}-->
		<!--{/if}-->
		<!--▼商品ここから-->
		<div class="<!--{$backcolor}-->">
			<ul>
				<!--★画像★-->
				<li>
					<div class="listphoto" style="">
						<!--{assign var=rank_icon_tag value='<span style="float:left;"><img style="padding:1px 5px 0 5px;width:15px;height:15px;" border="0"  src="'|cat:$TPL_DIR|cat:'../common/img/ranking/pr_ranking_crown.gif"></span>'}-->
						<!--{if $smarty.foreach.loop.iteration==1}-->
							<!--{assign var=rank_text_style value="color:#DAA520;"}-->
						<!--{elseif $smarty.foreach.loop.iteration==2}-->
							<!--{assign var=rank_text_style value="color:#808080;"}-->
						<!--{elseif $smarty.foreach.loop.iteration==3}-->
							<!--{assign var=rank_text_style value="color:#8B4513;"}-->
						<!--{else}-->
							<!--{assign var=rank_text_style value="color:#000000;"}-->
							<!--{assign var=rank_icon_tag value='<span></span>'}-->
						<!--{/if}-->
						<!--{$rank_icon_tag}--><span style="<!--{$rank_text_style}-->font-size:15px;font-weight:bold;"><!--{$smarty.foreach.loop.iteration}-->位</span>
						<a href="<!--{$smarty.const.DETAIL_P_HTML_SMP}--><!--{$val.product_id}-->" class="over"><!--商品写真-->
							<img src="<!--{$smarty.const.IMAGE_SAVE_URL|sfTrimURL}-->/<!--{$val.main_list_image}-->" alt="<!--{$val.name|escape}-->" class="picture"<!--{if $val.main_list_image_width > 78}--> width="78"<!--{/if}--> />
						</a>
					</div>
					<!--★商品名★-->
					<div class="listrightblock" style="margin:10px 2px 10px 2px">
						<a href="<!--{$smarty.const.DETAIL_P_HTML_SMP}--><!--{$val.product_id}-->">
							<h3><!--{$val.name}--></h3>
							<p class="pricebox" style="margin-top:35px;">価格<span class="mini">(税込):</span>
								<span class="price1">
									<!--{assign var=session_customer_id value=$smarty.session.customer|@null_coalescing:"customer_id"}-->
									<!--{if $val.price02min == $val.price02max}-->
                                        <!--{$rankingData|@reduce_tax_min_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.foreach.loop.index|number_format|escape}-->
									<!--{else}-->
                                        <!--{$rankingData|@reduce_tax_min_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.foreach.loop.index|number_format|escape}-->～
                                        <!--{$rankingData|@reduce_tax_max_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.foreach.loop.index|number_format|escape}-->
									<!--{/if}-->円
								</span>
							</p>
						</a>
					</div>
				</li>
			</ul>
		</div>
		<!--▲商品ここまで-->
	<!--{/foreach}-->
</div>


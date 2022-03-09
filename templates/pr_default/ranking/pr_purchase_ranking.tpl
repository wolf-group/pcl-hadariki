<div id="rank_m_all">
	<!--{assign var=session_customer_id value=$smarty.session.customer|@null_coalescing:"customer_id"}-->
	<div id="head_rankm">
		<h2>ランキング</h2>
	</div>
	<!--{section name=cnt loop=$rankingData}-->
	<!--{assign var="rank" value=$smarty.section.cnt.index+1}-->
	<!--{assign var=rank_icon_tag value='<span style="float:left;"><img style="padding:1px 5px 0 5px;width:30px;height:18px;" border="0" src="'|cat:$TPL_DIR|cat:'img/ranking/pr_ranking_crown.gif"></span>'}-->
	<!--{if $rank==1}-->
		<!--{assign var=rank_text_style value="color:#DAA520;"}-->
	<!--{elseif $rank==2}-->
		<!--{assign var=rank_text_style value="color:#808080;"}-->
	<!--{elseif $rank==3}-->
		<!--{assign var=rank_text_style value="color:#8B4513;"}-->
	<!--{else}-->
		<!--{assign var=rank_text_style value="color:#555;"}-->
		<!--{assign var=rank_icon_tag value='<span></span>'}-->
	<!--{/if}-->

	<!--▼商品ここから-->
	<div class="rank_m_area">
		<div class="rank_m_pic" >
			<!--★画像★-->
			<a href="<!--{$smarty.const.DETAIL_P_HTML}--><!--{$rankingData[cnt].product_id}-->" class="over">
				<!--商品写真-->
				<img src="<!--{$smarty.const.IMAGE_SAVE_URL|sfTrimURL}-->/<!--{$rankingData[cnt].main_list_image}-->" alt="<!--{$rankingData[cnt].name|escape}-->"
			 	title="<!--{$rankingData[cnt].name|escape}-->" class="picture" " />
			 </a>
		</div>
		<div class="rank_m_rightblock">

            <!--★NO★-->
            <div class="rank_txt2" style="<!--{$rank_text_style}-->">
                <!--{$rank_icon_tag}-->NO.<!--{$rank}-->
            </div>
            <!--★商品名★-->
			<h3>
				<a href="<!--{$smarty.const.DETAIL_P_HTML}--><!--{$rankingData[cnt].product_id}-->"><!--{$rankingData[cnt].name|escape}--></a>
			</h3>
			<p>
				<span class="pricebox">
				価格<span class="mini">(税込)
				</span>：
				<span class="price">
				<!--{if $rankingData[cnt].price02min == $rankingData[cnt].price02max}-->
                    <!--{$rankingData|@reduce_tax_min_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.section.cnt.index|number_format|escape}-->
				<!--{else}-->
                    <!--{$rankingData|@reduce_tax_min_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.section.cnt.index|number_format|escape}-->～
                    <!--{$rankingData|@reduce_tax_max_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.section.cnt.index|number_format|escape}-->
				<!--{/if}-->円
				</span>
			</p>
		</div>
		<!--★詳細ボタン★-->
		<div class="btnbox" >
			<!--{assign var=name value="detail`$smarty.section.cnt.iteration`"}-->
			<a href="<!--{$smarty.const.DETAIL_P_HTML}--><!--{$rankingData[cnt].product_id}-->">詳しくはこちら<input type="hidden" name="<!--{$name}-->" id="<!--{$name}-->" /></a>
		</div>
	</div>
	<!--{/section}-->
</div>

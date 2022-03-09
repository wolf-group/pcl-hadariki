<div id="ranking_all">
	<!--{assign var=session_customer_id value=$smarty.session.customer|@null_coalescing:"customer_id"}-->
	<div id="bloc_head_ranking">
		<h2>ランキング</h2>
	</div>
	<!--{section name=cnt loop=$rankingData}-->
	<!--{if $smarty.section.cnt.iteration < 9}-->
	<!--{assign var="rank" value=$smarty.section.cnt.index+1}-->
	<!--{assign var=rank_icon_tag value='<img style="padding:0px 5px 0px 0;width:30px;height:18px;" border="0" src="'|cat:$TPL_DIR|cat:'img/ranking/pr_ranking_crown.gif">'}-->
	<!--{if $rank==1}-->
		<!--{assign var=rank_text_style value="color:#555;"}-->
	<!--{elseif $rank==2}-->
		<!--{assign var=rank_text_style value="color:#555;"}-->
	<!--{elseif $rank==3}-->
		<!--{assign var=rank_text_style value="color:#555;"}-->
	<!--{elseif $rank==4}-->
		<!--{assign var=rank_text_style value="color:#555;"}-->
	<!--{elseif $rank==5}-->
		<!--{assign var=rank_text_style value="color:#555;"}-->

    <!--{else}-->
		<!--{assign var=rank_text_style value="color:#555;"}-->
		<!--{assign var=rank_icon_tag value='<span></span>'}-->
	<!--{/if}-->
	<div class="rankarea">
		<div class="rank_txt" style="<!--{$rank_text_style}-->">
			<!--{$rank_icon_tag}-->NO.<!--{$rank}-->
		</div>

		<div class="rank_pic" >
			<a href="<!--{$smarty.const.DETAIL_P_HTML}--><!--{$rankingData[cnt].product_id}-->" class="over">
				<img src="<!--{$smarty.const.IMAGE_SAVE_URL|sfTrimURL}-->/<!--{$rankingData[cnt].main_list_image}-->" alt="<!--{$rankingData[cnt].name|escape}-->"
				title="<!--{$rankingData[cnt].name|escape}-->" class="picture" style="width:100%;"/>
			</a>
		</div>

		<div class="rankrightblock">
			<h3><a href="<!--{$smarty.const.DETAIL_P_HTML}--><!--{$rankingData[cnt].product_id}-->"><!--{$rankingData[cnt].name|mb_truncate:15|escape}--></a></h3>
			<p>
				<span class="price">
					<!--{if $rankingData[cnt].price02min == $rankingData[cnt].price02max}-->
                    <!--{$rankingData|@reduce_tax_min_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.section.cnt.index|number_format|escape}-->
					<!--{else}-->
                    <!--{$rankingData|@reduce_tax_min_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.section.cnt.index|number_format|escape}-->～
                    <!--{$rankingData|@reduce_tax_max_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.section.cnt.index|number_format|escape}-->
					<!--{/if}-->円
				</span>
                <span class="mini">(税込)</span>
				<!--▼詳細ボタンここから-->
			</p>
		</div>
		<div class="btnbox166">
			<!--{assign var=name value="detail`$smarty.section.cnt.iteration`"}-->
			<a href="<!--{$smarty.const.DETAIL_P_HTML}--><!--{$rankingData[cnt].product_id}-->">
				詳しくはこちら<input type="hidden" name="<!--{$name}-->" id="<!--{$name}-->" /></a>
		</div>
	</div>
	<!--{/if}-->
	<!--{/section}-->
	<div class="btnbox">
	<a href="/ranking/index.php">もっと見る</a>
	</div>

</div>




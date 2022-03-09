<script type="text/javascript">//<![CDATA[
<!--{include file="`$smarty.const.S_TEMPLATE_PATH`/countdown.tpl" }-->

// セレクトボックスに項目を割り当てる。
function lnSetSelect(name1, name2, id, val) {
	sele1 = document.form1[name1];
	sele2 = document.form1[name2];
	lists = eval('lists' + id);
	vals = eval('vals' + id);
	if(sele1 && sele2) {
		index = sele1.selectedIndex;
		// セレクトボックスのクリア
		count = sele2.options.length;
		for(i = count; i >= 0; i--) {
			sele2.options[i] = null;
		}
		// セレクトボックスに値を割り当てる
		len = lists[index].length;
		for(i = 0; i < len; i++) {
			sele2.options[i] = new Option(lists[index][i], vals[index][i]);
			if(val != "" && vals[index][i] == val) {
				sele2.options[i].selected = true;
			}
		}
	}
}
//]]>
</script>
<!--▼CONTENTS-->
<div id="undercolumn">
	<form name="form1" id="form1" method="post" action="<!--{$smarty.server.REQUEST_URI|escape}-->">
		<input type="hidden" name="pageno" value="<!--{$tpl_pageno|escape}-->" />
		<input type="hidden" name="mode" value="" />
		<input type="hidden" name="orderby" value="<!--{$orderby|escape}-->" />
		<input type="hidden" name="product_id" value="" />
		<div id="listtitle">
			<h2><!--★タイトル★-->
				<!--{if $arrCatNavi}-->
					<!--{foreach from=$arrCatNavi item=catNavi key=idx name=loop1}-->
						<!--{if $smarty.foreach.loop1.last}-->  	  
							<a href="/product/list/<!--{$catNavi.category_id|escape}-->" ><!--{$catNavi.category_name|escape}--></a>
						<!--{/if}-->
					<!--{/foreach}-->
				<!--{else}-->
					<!--★タイトル★--><!--{$tpl_subtitle|escape}-->
				<!--{/if}-->
			</h2>
		</div>
		<!--検索条件ここから-->
		<!--{if $tpl_subtitle == "検索結果"}-->
			<ul class="pagecondarea">
				<li><strong>商品カテゴリ：</strong><!--{$arrSearch.category|escape}--></li>
				<li><strong>商品名：</strong><!--{$arrSearch.name|escape}--></li>
				<li><strong>販売価格：</strong>
				<!--{if !is_numeric($arrSearch.price_min) && !is_numeric($arrSearch.price_max)}-->
				指定なし
				<!--{else}-->
				<!--{if is_numeric($arrSearch.price_min)}-->
				<!--{$arrSearch.price_min|escape}-->円
				<!--{else}-->
				指定なし
				<!--{/if}-->
				～
				<!--{if is_numeric($arrSearch.price_max)}-->
				<!--{$arrSearch.price_max|escape}-->円
				<!--{else}-->
				指定なし
				<!--{/if}-->
				<!--{/if}-->
				</li>
			</ul>
		<!--{/if}-->
		<!--検索条件ここまで-->
		<!--{if $tpl_linemax > 0}-->
		<!--件数ここから-->
			<ul class="pagenumberarea">
				<li class="left"><span class="pagenumber"><!--{$tpl_linemax}--></span>件の商品がございます。</li>
				<li class="right">
					<!--{if $orderby != 'price'}-->
						<a href="javascript:fnModeSubmit('', 'orderby', 'price')">価格順</a>
					<!--{else}-->
						<strong>価格順</strong>
					<!--{/if}-->
					&nbsp;
					<!--{if $orderby != "date"}-->
						<a href="javascript:fnModeSubmit('', 'orderby', 'date')">新着順</a>
					<!--{else}-->
						<strong>新着順</strong>
					<!--{/if}-->
				</li>
			</ul>
		<!--件数ここまで-->
		<!--{else}-->
			<!--{include file="`$smarty.const.S_TEMPLATE_PATH`/frontparts/search_zero.tpl"}-->
		<!--{/if}-->
		<!--{foreach from=$arrProducts key=key item=val name=loop}-->
			<!--{assign var=type value="`$smarty.foreach.loop.iteration%2`"}-->
			<!--{if $type == 0}-->
				<!--{* 偶数行 *}-->
				<!--{assign var=backcolor value="listarea2"}-->
			<!--{else}-->
				<!--{* 奇数行 *}-->
				<!--{assign var=backcolor value="listarea"}-->
			<!--{/if}-->
			<!--▼商品ここから-->
			<div class="<!--{$backcolor}--> product_list_div">
				<ul>
					<!--★画像★-->
					<li>
						<div class="listphoto" style="padding:5px 5px">
							<a href="<!--{$smarty.const.DETAIL_P_HTML_SMP}--><!--{$val.product_id}-->" class="over"><!--商品写真-->
								<img src="<!--{$smarty.const.IMAGE_SAVE_URL|sfTrimURL}-->/<!--{$val.main_list_image}-->" alt="<!--{$val.name|escape}-->" class="picture"<!--{if $val.main_list_image_width > 78}--> width="78"<!--{/if}--> />
							</a>
						</div>
						<!--★商品名★-->
						<div class="listrightblock">
							<a href="<!--{$smarty.const.DETAIL_P_HTML_SMP}--><!--{$val.product_id}-->">
								<h3><!--{$val.name}--></h3>
								<!--{if $val.timesales_flg == 1}-->
								<div class="count_down_box" id="count_down_<!--{$val.product_id|escape}-->" ></div>
								<!--{/if}-->
								<p class="listcomment"><!--★コメント★--><!--{$val.smartphone_list_comment|escape|nl2br}--></p>
								<p class="pricebox">価格<span class="mini">(税込):</span>
									<span class="price1">
                                        <!--{assign var=price02_min value=$arrProducts|@reduce_tax_min_price_from_product:$arrSiteInfo:$smarty.session.customer.customer_id:$smarty.foreach.loop.index}-->
                                        <!--{assign var=price02_max value=$arrProducts|@reduce_tax_max_price_from_product:$arrSiteInfo:$smarty.session.customer.customer_id:$smarty.foreach.loop.index}-->
										<!--{if $price02_min == $price02_max}-->
                                            <!--{$price02_min|number_format|escape}-->
										<!--{else}-->
                                            <!--{$price02_min|number_format|escape}-->～<!--{$price02_max|number_format|escape}-->
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
		<div class="loading_product_btn" style="display:block;width:100%;height:35px;border:1px solid gray;background-color:#FFE5F2" ></div>
		<!--件数ここから-->
		<!--{if $tpl_linemax > 0}-->
			<ul class="pagenumberarea">
				<li class="left"><span class="pagenumber"><!--{$tpl_linemax}--></span>件の商品がございます</li>
				<li class="center"><!--{$tpl_strnavi}--></li>
				<li class="ct_btn">
					<!--{if $orderby != 'price'}-->
						<a href="javascript:fnModeSubmit('', 'orderby', 'price')">価格順</a>
					<!--{else}-->
						<strong>価格順</strong>
					<!--{/if}-->
				</li>
				<li class="ct_btn">
					<!--{if $orderby != "date"}-->
						<a href="javascript:fnModeSubmit('', 'orderby', 'date')">新着順</a>
					<!--{else}-->
						<strong>新着順</strong>
					<!--{/if}-->
				</li>
			</ul>
		<!--{/if}-->
		<!--件数ここまで-->
	</form>
</div>
<!--▲CONTENTS-->

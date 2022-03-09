<script type="text/javascript">//<![CDATA[
<!--{include file="`$smarty.const.S_TEMPLATE_PATH`/countdown.tpl" }-->


// セレクトボックスに項目を割り当てる。
function lnSetSelect(form, name1, name2, val) {
	sele11 = document[form][name1];
	sele12 = document[form][name2];
	if(sele11 && sele12) {
		index = sele11.selectedIndex;
		// セレクトボックスのクリア
		count = sele12.options.length;
		for(i = count; i >= 0; i--) {
						sele12.options[i] = null;
		}
		// セレクトボックスに値を割り当てる
		len = lists[index].length;
		for(i = 0; i < len; i++) {
			sele12.options[i] = new Option(lists[index][i], vals[index][i]);
			if(val != "" && vals[index][i] == val) {
				sele12.options[i].selected = true;
			}
		}
	}
}
//]]>

$(document).ready(function() {
    $('#favorite').click(function(){
        $("#favorite").attr("disabled", "disabled");
        $.ajax({
            dataType: "text",
            data: {
                "product_id": "<!--{$arrProduct.product_id|escape}-->",
                "type": 1,
            },
            cache: false,
            url: "/smp/products/add_favorite.php",
            success: function (data, status) {
                if(data == 'true'){
                    $("#favorite").text('お気に入りに追加しました');
                }
            },
            error : function(){
                alert('エラーが発生しました');
            }
        });
    });
});

</script>
<script type="text/javascript">//<![CDATA[
function tweet() {
	var login	= '*****';
	var apiKey = '*****';
	bitly = 'http://api.bit.ly/shorten'
			+ '?version=2.0.1&format=json&callback=callback'
			+ '&login=' + login
			+ '&apiKey=' + apiKey + '&longUrl=';
	var script = document.createElement('script');
	script.type = 'text/javascript';
	script.src = bitly + encodeURIComponent(location.href) ;
	document.body.appendChild(script);
}
function callback(bitlyResponse) {
	var title = '<!--{$arrProduct.name|escape}-->';
	var url = 'http://twitter.com/home/?status='
			+ encodeURIComponent(
					 title + ' ' + bitlyResponse.results[location.href]['shortUrl']
				);
	window.open(url);
}

//]]>
</script>
<!--▼CONTENTS-->
<div id="detailcolumn">
	<!--{assign var=session_customer_id value=$smarty.session.customer|@null_coalescing:"customer_id"}-->
	<div id="detailtitle01">
		<h2>
			<!--{if $arrCatNavi}-->
		        <!--{foreach from=$arrCatNavi item=catNavi key=idx}-->
		        	<!--{foreach from=$catNavi item=navi key=idx2}-->
		        	<!--{if $idx2 > 0}-->&nbsp;&gt;&gt;&nbsp;<!--{/if}--><a href="/product/list/<!--{$navi.category_id|escape}-->" ><!--{$navi.category_name|escape}--></a>
		        <!--{/foreach}-->
		        <br />
	        	<!--{/foreach}-->
	   		<!--{else}-->
	  			<!--★タイトル★--><!--{$tpl_subtitle|escape}-->
	  		<!--{/if}-->
		</h2>
	</div>
	<div id="detailtitle">
		<h2><!--{$arrProduct.name|escape}--></h2>
	</div>
	<div class="count_down_box" id="count_down_<!--{$arrProduct.product_id}-->"></div>
	<div id="detailarea">
		<div id="detailphotoblock">
			<!--{assign var=key value="main_image"}-->
			<!--{if $arrProduct.main_large_image != ""}-->
				<!--★画像★-->
				<a href="/smp/products/detail_image.php?product_id=<!--{$arrProduct.product_id}-->&amp;image=main_large_image<!--{if $smarty.get.admin == 'on'}-->&amp;admin=on<!--{/if}-->">
					<img src="<!--{$arrFile[$key].filepath}-->" alt="<!--{$arrProduct.name|escape}-->" class="picture"<!--{if $arrFile[$key].width > 260}--> width="260"<!--{/if}--> />
				</a>
				<p>
					<!--★拡大する★-->
					<a href="/smp/products/detail_image.php?product_id=<!--{$arrProduct.product_id}-->&amp;image=main_large_image<!--{if $smarty.get.admin == 'on'}-->&amp;admin=on<!--{/if}-->" onmouseover="chgImg('<!--{$TPL_DIR}-->img/products/b_expansion_on.gif','expansion01');" onMouseOut="chgImg('<!--{$TPL_DIR}-->img/products/b_expansion.gif','expansion01');">
						<img src="<!--{$TPL_DIR}-->img/products/b_expansion.gif" width="85" height="13" alt="画像を拡大する" name="expansion01" id="expansion01" />
					</a>
				</p>
			<!--{else}-->
				<img src="<!--{$arrFile[$key].filepath}-->" alt="<!--{$arrProduct.name|escape}-->" class="picture"<!--{if $arrFile[$key].width > 260}--> width="260"<!--{/if}--> />
			<!--{/if}-->
		</div>
		<!--★詳細メインコメント★-->
		<p style="padding:0px 10px;word-wrap:break-word;"><!--{$arrProduct.smartphone_comment|nl2br}--></p>
		<!--{if !$no_cart_flg}-->
		<div id="detailrightblock">
			<!--★商品コード★-->
			<!--{assign var=codecnt value=$arrProductCode|@count}-->
			<!--{assign var=codemax value=`$codecnt-1`}-->
			<div>

				<!--★商品名★-->
				<h3>商品名:<!--{$arrProduct.name|escape}--></h3>
				<p>商品コード:
				<!--{if $codecnt > 1}-->
					<!--{$arrProductCode.0|wordwrap:25:'<wbr />':true}-->～<!--{$arrProductCode[$codemax]|wordwrap:25:'<wbr />':true}-->
				<!--{else}-->
					<!--{$arrProductCode.0|wordwrap:25:'<wbr />':true}-->
				<!--{/if}-->
                </p>
				<!--{if $arrProduct.regular_only_flg == 0}-->
                <!--{* ▼▼▼↓定期購入設定中の商品で、都度購入用の「カゴに入れる」ボタンを非表示にする場合は、if文を有効にする ▼▼▼*}-->
				<!--{*if $arrProduct.regular != 1*}-->
					<!--★価格★-->
					<!--{$smarty.const.SALE_PRICE_TITLE}-->
					<span class="mini">(税込):</span>
					<span class="price1">
                        <!--{assign var=price02_min value=$arrProduct|@reduce_tax_min_price_from_product:$arrSiteInfo:$session_customer_id}-->
                        <!--{assign var=price02_max value=$arrProduct|@reduce_tax_max_price_from_product:$arrSiteInfo:$session_customer_id}-->
						<!--{if $price02_min == $price02_max}-->
                            <!--{$price02_min|number_format|escape}-->
						<!--{else}-->
                            <!--{$price02_min|number_format|escape}-->～<!--{$price02_max|number_format|escape}-->
						<!--{/if}-->円
					</span>
					<p>
						<!--{if $arrProduct.price01_max > 0}-->
							<!--{$smarty.const.NORMAL_PRICE_TITLE}-->
							<span class="mini">:</span>
							<span>
                                <!--{assign var=price01_min value=$arrProduct|@tax_min_normal_price_from_product:$arrSiteInfo:$session_customer_id}-->
                                <!--{assign var=price01_max value=$arrProduct|@tax_max_normal_price_from_product:$arrSiteInfo:$session_customer_id}-->
								<!--{if $price01_min == $price01_max}-->
                                    <!--{$price01_min|number_format|escape}-->
								<!--{else}-->
                                    <!--{$price01_min|number_format|escape}-->～<!--{$price01_max|number_format|escape}-->
								<!--{/if}-->円
							</span>
						<!--{/if}-->
					</p>
				<!--{*/if*}-->
				<!--{/if}-->

                 <!--▼ ポイント ▼-->
                <!--{if $point_flg != 2}-->
                <p>
                    ポイント:
                    <span>
                        <!--{if $arrProduct.price02_min == $arrProduct.price02_max}-->
                        <!--{$arrProduct.price02_min|reduce_price:$arrProduct.product_id:$session_customer_id|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id}-->
                        <!--{else}-->
                        <!--{if $arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id == $arrProduct.price02_max|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id}-->
                        <!--{$arrProduct.price02_min|reduce_price:$arrProduct.product_id:$session_customer_id|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id}-->
                        <!--{else}-->
                        <!--{$arrProduct.price02_min|reduce_price:$arrProduct.product_id:$session_customer_id|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id}-->～<!--{$arrProduct.price02_max|reduce_price:$arrProduct.product_id:$session_customer_id|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id}-->
                        <!--{/if}-->
                        <!--{/if}-->Pt
                    </span>
                </p>
                <!--{/if}-->
                <!--▲ ポイント ▲-->


				<!--{* 在庫表示 *}-->
				<!--{if $sc_stock_config.view_flg == 'YES'}-->
					<p>
						在庫:
						<!--{* 規格が設定されていない商品 *}-->
						<!--{if $class_cnt == '0'}-->
							<!--{* 在庫無制限設定中の商品 *}-->
							<!--{if $product_detail_arr[0][0].stock_unlimited == '1'}-->
								<!--{$sc_stock_config.stock_unlimited_str|escape}-->
							<!--{else}-->
								<!--{* 在庫切れ *}-->
								<!--{if $product_detail_arr[0][0].stock == '0'}-->
									<!--{$sc_stock_config.out_of_stock_str|escape}-->
									<!--{* 在庫切れの場合に入荷お知らせメールを表示 *}-->
									<!--{if $req_link_flg}-->
										<a href="/smp/products/request.php?product_id=<!--{$arrProduct.product_id}-->" class="pr_a_link">
											<!--{$product_request_config[1]|escape}-->
										</a>
									<!--{/if}-->
								<!--{else}-->
									<!--{$product_detail_arr[0][0].stock|number_format}-->
								<!--{/if}-->
							<!--{/if}-->
						<!--{* 規格が設定されている商品 *}-->
						<!--{else}-->
							<!--{* 全て在庫無制限 *}-->
							<!--{if $max_min.all_stock_unlimited_flg}-->
								<!--{$sc_stock_config.stock_unlimited_str|escape}-->
							<!--{* 全て在庫切れ、且つ、入荷お知らせメールが無効の場合 *}-->
							<!--{elseif $max_min.all_out_of_stock_flg && !$req_link_flg}-->
								<!--{$sc_stock_config.out_of_stock_str|escape}-->
							<!--{* 全て同一在庫 *}-->
							<!--{elseif $max_min.all_same_stock_flg}-->
								<!--{$max_min.stock_max|number_format}-->
							<!--{else}-->
								<!--{* 在庫状況詳細を折り畳む場合 *}-->
								<!--{if $fold_flg}-->
									<a href="#" onClick="PrShowHide('stock_detail');return false;" class="pr_a_link">▼詳細を表示</a>
								<!--{/if}-->
								<div id="stock_detail"<!--{if $fold_flg}--> style="display:none;"<!--{/if}-->>
									<table class="pr_smp_stock_table">
									<tr>
										<th><!--{$class_name1|escape}--></th>
										<!--{* 規格が2つ以上 *}-->
										<!--{if $class_cnt == 2}-->
											<th><!--{$class_name2|escape}--></th>
										<!--{/if}-->
										<th>在庫</th>
									</tr>
									<!--{foreach name=loop1 key=key item=val from=$product_detail_arr}-->
										<!--{foreach name=loop2 key=kkey item=vval from=$val}-->
											<tr>
												<!--{if $smarty.foreach.loop2.first}-->
													<td rowspan="<!--{$vval.cc_cnt}-->" style="vertical-align:top;"><!--{$vval.classcategory_name1|escape}--></td>
												<!--{/if}-->
												<!--{* 規格が2つ以上 *}-->
												<!--{if $class_cnt == 2}-->
													<td><!--{$vval.classcategory_name2|escape}--></td>
												<!--{/if}-->
												<td>
												<!--{if $vval.stock_unlimited == '1'}-->
													<!--{$sc_stock_config.stock_unlimited_str|escape}-->
												<!--{else}-->
													<!--{if $vval.stock == '0'}-->
														<!--{$sc_stock_config.out_of_stock_str|escape}-->
														<!--{* 在庫切れの場合に入荷お知らせメールを表示 *}-->
														<!--{if $req_link_flg}-->
														<br />
														<a href="/smp/products/request.php?product_id=<!--{$arrProduct.product_id}-->&classcategory_id1=<!--{$key}-->&classcategory_id2=<!--{$kkey}-->" class="pr_a_link">
															<!--{$product_request_config[1]|escape}-->
														</a>
														<!--{/if}-->
													<!--{else}-->
														<!--{$vval.stock|number_format}-->
													<!--{/if}-->
												<!--{/if}-->
												</td>
											</tr>
										<!--{/foreach}-->
									<!--{/foreach}-->
									</table>
								</div>
							<!--{/if}-->
						<!--{/if}-->
					</p>
				<!--{/if}-->

				<div class="pr_gray_line pr_mt5"></div>

				<form name="form1" id="form1" method="post" action="<!--{$smarty.server.REQUEST_URI|omit_query_part|escape}-->">
					<input type="hidden" name="mode" value="cart" />
					<input type="hidden" name="product_id" value="<!--{$tpl_product_id}-->" />
					<input type="hidden" name="pageno" value="<!--{$tpl_pageno|escape}-->" />
					<!--{if $arrProduct.regular_only_flg == 0}-->
					<!--{* ▼▼▼↓定期購入設定中の商品で、都度購入用の「カゴに入れる」ボタンを非表示にする場合は、if文を有効にする▼▼▼ *}-->
					<!--{*if $arrProduct.regular != 1*}-->

						<p>
							<!--{if $tpl_classcat_find1}-->
								<!--{$tpl_class_name1|escape}-->:
								<select name="classcategory_id1"style="<!--{$arrErr.classcategory_id1|sfGetErrorColor}-->" onchange="lnSetSelect('form1', 'classcategory_id1', 'classcategory_id2', ''); ">
									<option value="">選択してください</option>
									<!--{html_options options=$arrClassCat1 selected=$arrForm.classcategory_id1.value}-->
								</select>
								<!--{if $arrErr.classcategory_id1 != ""}-->
									<br /><span class="attention">※ <!--{$tpl_class_name1|escape}-->を入力して下さい。</span>
								<!--{/if}-->
							<!--{/if}-->
						</p>
						<!--{if $tpl_stock_find}-->
							<p>
							<!--{if $tpl_classcat_find2}-->
								<!--{$tpl_class_name2|escape}-->:
								<select name="classcategory_id2" style="<!--{$arrErr.classcategory_id2|sfGetErrorColor}-->">
									<option value="">選択してください</option>
								</select>
								<!--{if $arrErr.classcategory_id2 != ""}-->
									<br /><span class="attention">※ <!--{$tpl_class_name2|escape}-->を入力して下さい。</span>
								<!--{/if}-->
							<!--{/if}-->
							</p>
							<!-- ▼規格3以上▼ -->
							<!--{if $pcc_list_extra}-->
								<!--{foreach from=$pcc_list_extra item=item key=key}-->
									<p>
										<!--{$item.class_name|escape}-->:
										<!--{assign var="classcategory_id" value="classcategory_id`$key`"}-->
										<select name="classcategory_id<!--{$key}-->" id="classcategory_id<!--{$key}-->>"
											style="<!--{$arrErr.$classcategory_id|sfGetErrorColor}-->">
											<option value="">選択してください</option>
											<!--{html_options options=$item.classcategory selected=$arrForm.$classcategory_id.value}-->
										</select>
										<!--{if $arrErr.$classcategory_id != ""}-->s
											<br /><span class="attention">※ <!--{$item.class_name|escape}-->を選択して下さい。</span>
										<!--{/if}-->
									</p>
								<!--{/foreach}-->
							<!--{/if}-->
							<!-- ▲規格3以上▲ -->
							<p>
								数量:<input type="text" name="quantity" class="box54" value="<!--{$arrForm.quantity.value|default:1}-->" maxlength="<!--{$smarty.const.INT_LEN}-->" style="<!--{$arrErr.quantity|sfGetErrorColor}-->" />
								<!--{if $arrErr.quantity != ""}-->
									<br /><span class="attention"><!--{$arrErr.quantity}--></span>
								<!--{/if}-->
							</p>
						<!--{/if}-->
						<!--{if $arrReturning != ""}-->
							<!--{foreach from=$arrReturning key="id" item="returning" name="returning"}-->
								<!--{$returning}-->
							<!--{/foreach}-->
						<!--{/if}-->
						<!--{if $tpl_stock_find}-->
							<!--{if $tpl_message_upper_cart_btn != ""}-->
							<p class="btn"></p>
							<p class="attention"><!--{$tpl_message_upper_cart_btn}--></p>
							<!--{/if}-->
							<!--★▼カートに入れる▼★-->
								<ul>
									<li class="sp_btn">
										<a href="javascript:void(0);" onclick="document.form1.submit();">カートに入れる<input type="hidden" name="cart" id="cart" /></a>
									</li>
								</ul>
							<!--★▲カートに入れる▲★-->
						<!--{else}-->
							<p class="attention">申し訳ございませんが、只今品切れ中です。</p>
						<!--{/if}-->
					<!--{*/if*}-->
					<!--{/if}-->
					<!--{if $no_class_stock_flg}-->
					<!--★入荷お知らせメールを書き込む★-->
					<ul>
						<li class="sp_btn">
							<a href="/smp/products/request.php?product_id=<!--{$arrProduct.product_id}-->">
								入荷お知らせメールを書き込む<input type="hidden" name="request" id="request" />
							</a>
						</li>
					</ul>
					<!--{/if}-->
				</form>

                <!--お気に入り-->
                <!--{if 'products-add_favorite'|get_option_use_flg == true}-->
	                <!--{if $session_customer_id}-->
	                <!--{if $favorite_count == 0}-->
	                <div class="newbtn">
	                    <button id="favorite"<!--{if $favorite_count != 0}-->disabled<!--{/if}-->>お気に入りに追加する</button>
	                </div>
	                <!--{/if}-->
	                <!--{/if}-->
				<!--{/if}-->
                <!--お気に入り-->

				<!--{if 'basis-lp_only'|get_option_use_flg == false}-->
					<!--{if $arrProduct.regular != 0}-->
						<div class="teiki">
							<h3><a name="regular" id="regular"></a>定期購入</h3>
							<form name="form2" id="form2" method="post" action="<!--{$smarty.server.REQUEST_URI|omit_query_part|escape}-->">
								<input type="hidden" name="mode" value="cart" />
								<input type="hidden" name="regular" value="1" />
								<input type="hidden" name="product_id" value="<!--{$tpl_product_id}-->" />
								<input type="hidden" name="pageno" value="<!--{$tpl_pageno|escape}-->" />
								<p>販売価格 (税込):<!--{$arrProduct.rg_fprice|number_format}-->円</p>
								<p>
									<!--{if $tpl_classcat_find1}-->
										<!--{$tpl_class_name1|escape}-->:
										<select name="classcategory_id1" style="<!--{$arrErr.classcategory_id1|sfGetErrorColor}-->" onchange="lnSetSelect('form2', 'classcategory_id1', 'classcategory_id2', ''); ">
											<option value="">選択してください</option>
											<!--{html_options options=$arrClassCat1 selected=$arrForm.classcategory_id1.value}-->
										</select>
										<!--{if $arrErr.classcategory_id1 != ""}-->
											<br /><span class="attention">※ <!--{$tpl_class_name1|escape}-->を入力して下さい。</span>
										<!--{/if}-->
									<!--{/if}-->
								</p>
								<!--{if $tpl_stock_find}-->
									<!--{if $tpl_classcat_find2}-->
										<p>
											<!--{$tpl_class_name2|escape}-->:
											<select name="classcategory_id2" style="<!--{$arrErr.classcategory_id2|sfGetErrorColor}-->">
												<option value="">選択してください</option>
											</select>
											<!--{if $arrErr.classcategory_id2 != ""}-->
												<br /><span class="attention">※ <!--{$tpl_class_name2|escape}-->を入力して下さい。</span>
											<!--{/if}-->
										</p>
									<!--{/if}-->
									<!-- ▼規格3以上▼ -->
									<p>
										数量:<input type="text" name="quantity" class="box54" value="<!--{$arrForm.quantity.value|default:1}-->" maxlength="<!--{$smarty.const.INT_LEN}-->" style="<!--{$arrErr.quantity|sfGetErrorColor}-->" />
										<!--{if $arrErr.quantity != ""}-->
											<br /><span class="attention"><!--{$arrErr.quantity}--></span>
										<!--{/if}-->
									</p>
								<!--{/if}-->
								<!--{if $tpl_stock_find}-->
								<!--★▼カートに入れる▼★-->
									<div class="sp_btn">
										<a href="javascript:void(0);" onclick="document.form2.submit();" >カートに入れる<input type="hidden" name="cart2" id="cart2" /></a>
									</div>
								<!--★▲カートに入れる▲★-->
								<!--{else}-->
									<div class="attention">申し訳ございませんが、只今品切れ中です。</div>
								<!--{/if}-->
							</form>
						</div>
					<!--{/if}-->
				<!--{/if}-->
			</div>
		</div>
		<!--{/if}-->
		<!--{if $arrProduct.sub_title1 != ""}-->
		<div id="subareablock">
			<!--{if $arrProduct.sub_title1 != ""}-->
				<h2>その他の商品写真</h2>
			<!--{/if}-->
			<!--{* オペビルダー用 *}-->
			<!--{if "sfViewDetailOpe"|function_exists === TRUE}-->
				<!--{include file=`$smarty.const.MODULE_PATH`mdl_opebuilder/detail_ope_view.tpl}-->
			<!--{/if}-->
			<!--詳細ここまで-->
			<!--▼サブコメントここから-->
			<!--{section name=cnt loop=10}-->
				<!--{assign var=key value="sub_title`$smarty.section.cnt.iteration`"}-->
				<!--{if $arrProduct[$key] != ""}-->
					<div class="subarea">
						<h3><!--★サブタイトル★--><!--{$arrProduct[$key]|escape}--></h3>
						<!--{assign var=ckey value="sub_comment`$smarty.section.cnt.iteration`"}-->
						<!--拡大写真がある場合ここから-->
						<!--{assign var=key value="sub_image`$smarty.section.cnt.iteration`"}-->
						<!--{assign var=lkey value="sub_large_image`$smarty.section.cnt.iteration`"}-->
						<!--{if $arrFile[$key].filepath != ""}-->
							<div class="subtext"><!--★サブテキスト★--><!--{$arrProduct[$ckey]|nl2br}--></div>
							<div class="subphotoimg">
								<!--{if $arrFile[$lkey].filepath != ""}-->
									<a href="/smp/products/detail_image.php?product_id=<!--{$arrProduct.product_id}-->&amp;image=<!--{$lkey}-->">
								<!--{/if}-->
										<!--サブ画像-->
										<img src="<!--{$arrFile[$key].filepath}-->" alt="<!--{$arrProduct.name|escape}-->"/>
								<!--{if $arrFile[$lkey].filepath != ""}-->
									</a>
									<p>
										<a href="/smp/products/detail_image.php?product_id=<!--{$arrProduct.product_id}-->&amp;image=<!--{$lkey}-->" onmouseover="chgImg('<!--{$TPL_DIR}-->img/products/b_expansion_on.gif','<!--{$key}-->');" onmouseout="chgImg('<!--{$TPL_DIR}-->img/products/b_expansion.gif','<!--{$key}-->');">
											<img src="<!--{$TPL_DIR}-->img/products/b_expansion.gif" width="85px" height="13px" alt="画像を拡大する"	name="<!--{$key}-->" id="<!--{$key}-->" />
										</a>
									</p>
								<!--{/if}-->
							</div>
							<!--拡大写真がある場合ここまで-->
						<!--{else}-->
							<p><!--★サブテキスト★--><!--{$arrProduct[$ckey]|nl2br}--></p>
						<!--{/if}-->
					</div>
				<!--{/if}-->
			<!--{/section}-->
			<!--▲サブコメントここまで-->
		</div>
		<!--{/if}-->
		<span class="clear"></span>
		<!--{if $arrReviewView == "ON"}-->
			<!--この商品に対するお客様の声-->
			<div id="customervoicearea">
				<h2>この商品に対するお客様の声</h2>
				<!--{if $reviewWritableFlg}-->
					<!--★新規コメントを書き込む★-->
					<p class="sp_btn">
						<a href="/smp/products/review.php?product_id=<!--{$arrProduct.product_id}-->">
							新規コメントを書き込む<input type="hidden" name="review" id="review" />
						</a>
					</p>
				<!--{/if}-->
				<!--{if $tpl_linemax > 0}-->
					<div style="clear: both;width:100%;margin:5px 0;padding-top:10px;padding-bottom:10px;background-color:#f3f3f3">
						<span style="font-weight:bold;color:#ff0000;"><!--{$tpl_linemax}--></span>件のレビューがございます。<br />
						<!--{$tpl_strnavi}-->
					</div>
				<!--{/if}-->
				<!--{if count($arrReview) > 0}-->
					<ul>
						<!--{section name=cnt loop=$arrReview}-->
							<li>
								<p class="voicedate"><!--{$arrReview[cnt].create_date|sfDispDBDate:false}-->　投稿者：<!--{if $arrReview[cnt].reviewer_url}--><a href="<!--{$arrReview[cnt].reviewer_url}-->" target="_blank"><!--{$arrReview[cnt].reviewer_name|escape}--></a><!--{else}--><!--{$arrReview[cnt].reviewer_name|escape}--><!--{/if}--><br />おすすめレベル：<span class="price"><!--{assign var=level value=$arrReview[cnt].recommend_level}--><!--{$arrRECOMMEND[$level]|escape}--></span></p>
								<!--{if $arrReview[cnt].title}-->
									<p class="voicetitle"><!--{$arrReview[cnt].title|escape}--></p>
								<!--{/if}-->
								<p class="voicecomment"><!--{$arrReview[cnt].comment|escape|nl2br}--></p>
							</li>
						<!--{/section}-->
					</ul>
				<!--{/if}-->
			</div>
			<span class="clear"></span>
			<!--お客様の声ここまで-->
		<!--{/if}-->
		<!--{if $arrTrackbackView == "ON"}-->
			<!--▼トラックバックここから-->
			<div id="trackbackarea">
				<h2>この商品に対するトラックバック</h2>
				<h3>この商品のトラックバック先URL</h3>
				<input type="text" name="trackback" value="<!--{$trackback_url}-->" size="100" class="box500" onclick="this.select(0,this.value.length)" readonly />
				<!--{if $arrTrackback}-->
					<ul>
						<!--{section name=cnt loop=$arrTrackback}-->
							<li>
								<strong><!--{$arrTrackback[cnt].create_date|sfDispDBDate:false}-->&nbsp;&nbsp;<a href="<!--{$arrTrackback[cnt].url}-->" target="_blank"><!--{$arrTrackback[cnt].title|escape}--></a> from <!--{$arrTrackback[cnt].blog_name|escape}--></strong>
								<p><!--{$arrTrackback[cnt].excerpt|escape|mb_strimwidth:0:200:"..."}--></p>
							</li>
						<!--{/section}-->
					</ul>
				<!--{/if}-->
				<!--▲トラックバックここまで-->
			</div>
		<!--{/if}-->
		<!--▼関連商品ここから-->
		<!--{if $arrRecommend}-->
			<div id="whoboughtare">
				<h2>関連商品</h2>
				<!--{section name=cnt loop=$arrRecommend}-->
					<!--{if $arrRecommend[cnt].product_id}-->
						<!-- 左列 -->
						<!--{if $arrRecommend[cnt].main_list_image != ""}-->
							<!--{assign var=image_path value="`$arrRecommend[cnt].main_list_image`"}-->
						<!--{else}-->
							<!--{assign var=image_path value="`$smarty.const.NO_IMAGE_DIR`"}-->
						<!--{/if}-->
						<div class="whoboughtblock">
							<div class="leftblock">
								<a href="/smp<!--{$smarty.const.DETAIL_P_HTML}--><!--{$arrRecommend[cnt].product_id}-->">
									<img src="/resize_image.php?image=<!--{$image_path|sfRmDupSlash}-->&amp;width=65&amp;height=65" alt="<!--{$arrRecommend[cnt].name|escape}-->" />
								</a>
							</div>
                            <!--{assign var=price02_min value=$arrRecommend|@reduce_tax_min_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.section.cnt.index}-->
                            <!--{assign var=price02_max value=$arrRecommend|@reduce_tax_max_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.section.cnt.index}-->
							<div class="rightblock">
								<a href="/smp<!--{$smarty.const.DETAIL_P_HTML}--><!--{$arrRecommend[cnt].product_id}-->">
									<h3><!--{$arrRecommend[cnt].name|escape}--></h3>
									<p>
										<span class="textblack">価格(税込)</span>：<span class="price">
										<!--{if $price02_min == $price02_max}-->
                                            <!--{$price02_min|number_format|escape}-->
										<!--{else}-->
											<br />
                                            <!--{$price02_min|number_format|escape}-->円&nbsp;～&nbsp;
                                            <!--{$price02_max|number_format|escape}-->
										<!--{/if}-->円</span>
									</p>
									<p class="textgray"><!--{$arrRecommend[cnt].comment|escape|nl2br}--></p>
								</a>
							</div>
						</div>
						<span class="clear"></span>
					<!--{/if}-->
					<!--{if $smarty.section.cnt.last}--><!--{/if}-->
				<!--{/section}-->
			</div>
		<!--{/if}-->
	</div>
</div>
<!--▲CONTENTS-->

<script type="text/javascript">//<![CDATA[
<!--{include file="`$smarty.const.TEMPLATE_DIR`countdown.tpl"}-->

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
function submitRegular(product_id) {
	document.form1.regular.value = '1';
	document.form1.mode.value = 'cart';
	document.form1.product_id.value = product_id;
	document.form1.submit();
}


$(document).ready(function() {
    $('.favorite').click(function(){
        id = $(this).attr('id');
        $.ajax({
            dataType: "text",
            data: {
                "product_id": id,
                "type": 2,
            },
            cache: false,
            url: "/products/add_favorite.php",
            success: function (data, status) {
                if(data == 'true'){
                    $('#' + id).text('お気に入りに追加しました');
                    $('#' + id).removeAttr('id');
                }
            },
            error : function(){
                alert('エラーが発生しました');
            }
        });
    });
});


//fnSetCookie('back_to_addr', location.href);
//window.alert(fnGetCookie('back_to_addr'));

//]]>
</script>

<!--▼CONTENTS-->
<div id="productscolumn">
	<!-- img src='/set_backaddr.php'/ -->
	<form name="form1" id="form1" method="post" action="<!--{$smarty.server.REQUEST_URI|escape}-->">
		<input type="hidden" name="pageno" value="<!--{$tpl_pageno|escape}-->" />
		<input type="hidden" name="mode" value="" />
		<input type="hidden" name="orderby" value="<!--{$orderby|escape}-->" />
		<input type="hidden" name="product_id" value="" />
		<input type="hidden" name="regular" value="" />

    <!--▼パンくず-->
      <div class="ict_bg">
          <a href="/">HOME</a>&nbsp;&nbsp;&gt;&nbsp;
          <!--{if $arrCatNavi}-->
              <!--{foreach from=$arrCatNavi item=catNavi key=idx}-->
                  <!--{if $idx > 0}-->&gt;&nbsp;<!--{/if}--><a href="/product/list/<!--{$catNavi.category_id|escape}-->" ><!--{$catNavi.category_name|escape}--></a>
              <!--{/foreach}-->
          <!--{else}-->
              <!--★タイトル★-->
              <!--{$tpl_subtitle|escape}-->
          <!--{/if}-->
       </div>

    　<!--▼タイトル-->
        <div id="listtitle">
  			<h2>
				<!--{if $arrCatNavi}-->
					<!--{foreach from=$arrCatNavi item=catNavi key=idx}-->
						<!--{if $idx > 0}-->&gt;&nbsp;<!--{/if}--><a href="/product/list/<!--{$catNavi.category_id|escape}-->" ><!--{$catNavi.category_name|escape}--></a>
					<!--{/foreach}-->
				<!--{else}-->
					<!--★タイトル★-->
					<!--{$tpl_subtitle|escape}-->
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
		<!--件数ここから-->
		<!--{if $tpl_linemax > 0}-->
			<ul class="pagenumberarea">
				<li class="left"><span class="pagenumber"><!--{$tpl_linemax}--></span>件の商品がございます。</li>
				<li class="center"><!--{$tpl_strnavi}--></li>
				<li class="right">
					<!--{if $orderby != 'price'}-->
						<span class="btn_down"><a href="javascript:fnModeSubmit('', 'orderby', 'price')">価格順</a></span>
					<!--{else}-->
						<span class="btn_down"><strong>価格順</strong></span>
					<!--{/if}-->&nbsp;
					<!--{if $orderby != "date"}-->
						<span class="btn_down"><a href="javascript:fnModeSubmit('', 'orderby', 'date')">新着順</a></span>
					<!--{else}-->
						<span class="btn_down"><strong>新着順</strong></span>
					<!--{/if}-->
					<!--{if $orderby != 'disp_start'}-->
						<span class="btn_down"><a href="javascript:fnModeSubmit('', 'orderby', 'disp_start')">公開順</a></span>
					<!--{else}-->
						<span class="btn_down"><strong>公開順</strong></span>
					<!--{/if}-->
				</li>
			</ul>
			<!--件数ここまで-->
		<!--{else}-->
			<!--{include file="frontparts/search_zero.tpl"}-->
		<!--{/if}-->
		<!--{section name=cnt loop=$arrProducts}-->
		<!--{assign var=id value=$arrProducts[cnt].product_id}-->
		<!--▼商品ここから-->
		<div class="listarea" id="listarea_<!--{$arrProducts[cnt].product_id}-->">
			<div class="listphoto">
				<!--★画像★-->
				<a href="<!--{$smarty.const.DETAIL_P_HTML}--><!--{$arrProducts[cnt].product_id}-->" class="over"><!--商品写真-->
					<img src="<!--{$smarty.const.IMAGE_SAVE_URL|sfTrimURL}-->/<!--{$arrProducts[cnt].main_list_image}-->" alt="<!--{$arrProducts[cnt].name|escape}-->" class="picture"<!--{if $arrProducts[cnt].main_list_image_width > 350}--> width="350"<!--{/if}--><!--{if $arrProducts[cnt].main_list_image_height > 350}--> height="350"<!--{/if}--> />
				</a>
			</div>
			<div class="listrightblock">
				<!--商品ステータス アイコン-->
				<!--{if count($arrProducts[cnt].product_flag) > 0}-->
					<ul>
						<!--{section name=flg loop=$arrProducts[cnt].product_flag|count_characters}-->
							<!--{if $arrProducts[cnt].product_flag[flg] == "1"}-->
								<!--{assign var=key value="`$smarty.section.flg.iteration`"}-->
								<li><img src="<!--{$TPL_DIR}--><!--{$arrSTATUS_IMAGE[$key]}-->" alt="<!--{$arrSTATUS[$key]}-->" title="<!--{$arrSTATUS[$key]}-->"/></li>
								<!--{assign var=sts_cnt value=$sts_cnt+1}-->
							<!--{/if}-->
						<!--{/section}-->
					</ul>
				<!--{/if}-->
				<!--商品ステータス アイコン-->

                <!--★商品名★-->
				<h3>
					<a href="<!--{$smarty.const.DETAIL_P_HTML}--><!--{$arrProducts[cnt].product_id}-->"><!--{$arrProducts[cnt].name|mb_truncate:35|escape}--></a>
				</h3>
				<div class="count_down_box" id="count_down_<!--{$arrProducts[cnt].product_id}-->"></div>
				<div class="listcomment"><!--★コメント★--><!--{$arrProducts[cnt].main_list_comment|mb_truncate:50|escape|nl2br}--></div>
				<div class="pricebox">
					<span class="pricebox">
					<span class="price">
					<!--{assign var=session_customer_id value=$smarty.session.customer|@null_coalescing:"customer_id"}-->
                    <!--{assign var=price02_min value=$arrProducts|@reduce_tax_min_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.section.cnt.index}-->
                    <!--{assign var=price02_max value=$arrProducts|@reduce_tax_max_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.section.cnt.index}-->
					<!--{if $price02_min == $price02_max}-->
                        <!--{$price02_min|number_format|escape}-->
					<!--{else}-->
                        <!--{$price02_min|number_format|escape}-->～
                        <!--{$price02_max|number_format|escape}-->
					<!--{/if}-->円</span><span class="mini">(税込)</span></span>
					<!--★詳細ボタン★-->
					<!--{assign var=name value="detail`$smarty.section.cnt.iteration`"}-->
					<div class="rpst_btnbox">
                        <a href="<!--{$smarty.const.DETAIL_P_HTML}--><!--{$arrProducts[cnt].product_id}-->">
                            詳しくはこちら<input type="hidden" name="<!--{$name}-->" id="<!--{$name}-->" />
                        </a>
					</div>
				</div>
				<!--{if $arrProducts[cnt].stock_max == 0 && $arrProducts[cnt].stock_unlimited_max != 1}-->
					<p class="soldout"><em>只今品切れ中です。</em></p>
				<!--{else}-->
				<!--▼買い物かご-->
				<div class="in_cart">
                       <div class="ct_list">
                            <!--{assign var=class1 value=classcategory_id`$id`_1}-->
                            <!--{assign var=class2 value=classcategory_id`$id`_2}-->
                            <!--{if $tpl_classcat_find1[$id]}-->
                             <dl>
                               <dt><!--{$tpl_class_name1[$id]|escape}--></dt>
                                <dd>
                                    <div class="custom-selectbox w100">
                                        <select name="<!--{$class1}-->" style="<!--{$arrErr[$class1]|sfGetErrorColor}-->" onchange="lnSetSelect('<!--{$class1}-->', '<!--{$class2}-->', '<!--{$id}-->','');">
                                        <option value="">選択してください</option>
                                        <!--{html_options options=$arrClassCat1[$id] selected=$arrForm[$class1]}-->
                                        </select>
                                    </div>
                                    <!--{if $arrErr[$class1] != ""}-->
                                        <br /><span class="attention">※ <!--{$tpl_class_name1[$id]|escape}-->を選択して下さい。</span>
                                    <!--{/if}-->
                                </dd>
                                <!--{/if}-->

                                <!--{if $tpl_classcat_find2[$id]}-->
                                <dt><!--{$tpl_class_name2[$id]|escape}--></dt>
                                <dd>
                                    <div class="custom-selectbox w100">
                                        <select name="<!--{$class2}-->" style="<!--{$arrErr[$class2]|sfGetErrorColor}-->">
                                        <option value="">選択してください</option>
                                        </select>
                                    </div>
                                    <!--{if $arrErr[$class2] != ""}-->
                                        <br /><span class="attention">※ <!--{$tpl_class_name2[$id]|escape}-->を選択して下さい。</span>
                                    <!--{/if}-->
                                </dd>
                                <!--{/if}-->

                            <!-- ▼規格3以上▼ -->
                            <!--{if $arrProducts[cnt].pcc_list_extra && $arrProducts[cnt].regular_only_flg == 0}-->
                            <!--{foreach from=$arrProducts[cnt].pcc_list_extra item=item key=key}-->
                                <!--{assign var=extra_class value=classcategory_id`$id`_`$key`}-->
                                <dt><!--{$item.class_name|escape}--></dt>
                                <dd>
                                    <div class="custom-selectbox w100">
                                        <select name="<!--{$extra_class}-->" id="<!--{$extra_class}-->"
                                            class="listselect" style="<!--{$arrErr[$extra_class]|sfGetErrorColor}-->">
                                            <option value="">選択してください</option>
                                            <!--{html_options options=$item.classcategory selected=$arrForm[$extra_class]}-->
                                        </select>
                                    </div>
                                    <!--{if $arrErr[$extra_class] != ""}-->
                                        <br /><span class="attention">※ <!--{$item.class_name|escape}-->を選択して下さい。</span>
                                    <!--{/if}-->
                                </dd>
                            <!--{/foreach}-->
                            <!--{/if}-->
                            	</dl>
                            </div>
                            <!-- ▲規格3以上▲ -->

                            <!-- ▼数量▼ -->
                            <!--{assign var=quantity value=quantity`$id`}-->
                            <div class="num_quantity">
                                   <dl>
                                    <dt>数量：</dt>
                                    <dd><input type="text" name="<!--{$quantity}-->" size="3" class="box54" value="<!--{$arrForm[$quantity]|default:1}-->" maxlength="<!--{$smarty.const.INT_LEN}-->" style="<!--{$arrErr[$quantity]|sfGetErrorColor}-->" />
                                        <!--{if $arrErr[$quantity] != ""}-->
                                            <br /><span class="attention"><!--{$arrErr[$quantity]}--></span>
                                        <!--{/if}-->
                                    </dd>
                                </dl>
                            </div>
                     		<!-- ▲数量▲ -->
					<!--{*if $arrProducts[cnt].regular != 1*}-->	<!--{* ←定期購入設定中の商品で、都度購入用の「カゴに入れる」ボタンを非表示する場合は、if文を有効にする *}-->

					<!--{if $arrProducts[cnt].regular_only_flg == 0}-->
						<div class="lst_cartbtn">
							<a onclick="fnChangeAction('<!--{request_uri|escape:javascript}-->#product<!--{$id|escape:javascript}-->'); fnModeSubmit('cart','product_id','<!--{$id|escape:javascript}-->'); return false;">
								カゴに入れる<input type="hidden" name="cart<!--{$id|escape}-->" id="cart<!--{$id|escape}-->" />
							</a>
						</div>
					<!--{/if}-->
					<!--{*/if*}-->	<!--{* ←定期購入設定中の商品で、都度購入用の「カゴに入れる」ボタンを非表示する場合は、if文を有効にする *}-->
					<!--{if 'basis-lp_only'|get_option_use_flg == false}-->
						<!--{if $arrProducts[cnt].regular == 1}-->
							<div class="t_cartbtn2 mgt10">
								<a onclick="fnChangeAction('<!--{request_uri|escape:javascript}-->#product<!--{$id|escape:javascript}-->'); submitRegular('<!--{$id|escape:javascript}-->'); return false;">
									定期購入する<input type="hidden" name="regular_cart<!--{$id|escape}-->" id="regular_cart<!--{$id|escape}-->" />
								</a>
							</div>
						<!--{/if}-->
					<!--{/if}-->

                	<!--{if 'products-add_favorite'|get_option_use_flg == true}-->
	                    <!--{if $customer_id}-->
	                    <!--{if $arrProducts[cnt].count_favorite == 0}-->
	                    <div class="cartbtn2 mgt10">
	                            <span class="favorite" id="favorite_<!--{$id}-->">お気に入りに追加する</span>
	                    </div>
	                    <!--{/if}-->
	                    <!--{/if}-->
                	<!--{/if}-->
				</div>
				<!--▲買い物かご-->
				<!--{/if}-->
				<!--★入荷お知らせメール-->
	            <!--{if $class_stock_empty_ids && $arrProducts[cnt].product_id|in_array:$class_stock_empty_ids}-->
					<div class="newbtn2">
						<a href="./request.php"
							onclick="win02('/products/request.php?product_id=<!--{$arrProducts[cnt].product_id}-->','request','<!--{$request_popup_width}-->','<!--{$request_popup_height}-->'); return false;" target="_blank">
							入荷お知らせメール<input type="hidden" name="request" id="request" />
						</a>
					</div>
				<!--{/if}-->
			<!--★入荷お知らせメール-->
			</div>
		</div>
		<!--{/section}-->

		<!--件数ここから-->
		<!--{if $tpl_linemax > 0}-->
		<ul class="pagenumberarea mgt10" style="border-bottom:none;border-top:1px solid #aaa;">
			<li class="left"><span class="pagenumber"><!--{$tpl_linemax}--></span>件の商品がございます。</li>
			<li class="center"><!--{$tpl_strnavi}--></li>
			<li class="right">
				<!--{if $orderby != 'price'}-->
					<span class="btn_down"><a href="javascript:fnModeSubmit('', 'orderby', 'price')">価格順</a></span>
				<!--{else}-->
					<span class="btn_down"><strong>価格順</strong></span>
				<!--{/if}-->&nbsp;
				<!--{if $orderby != "date"}-->
					<span class="btn_down"><a href="javascript:fnModeSubmit('', 'orderby', 'date')">新着順</a></span>
				<!--{else}-->
					<span class="btn_down"><strong>新着順</strong></span>
				<!--{/if}-->
				<!--{if $orderby != 'disp_start'}-->
					<span class="btn_down"><a href="javascript:fnModeSubmit('', 'orderby', 'disp_start')">公開順</a></span>
				<!--{else}-->
					<span class="btn_down"><strong>公開順</strong></span>
				<!--{/if}-->
			</li>
		</ul>
		<!--件数ここまで-->
	<!--{/if}-->
	</form>
</div>
<!--▲CONTENTS-->

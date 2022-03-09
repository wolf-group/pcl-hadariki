<script type="text/javascript">//<![CDATA[
var send = true;
function fnCheckSubmit() {
	if(send) {
		send = false;
		document.form1.submit();
	} else {
		alert("只今、処理中です。しばらくお待ち下さい。");
		return false;
	}
}
<!--{include file="`$smarty.const.S_TEMPLATE_PATH`/countdown.tpl" }-->
//]]>
</script>
<!--▼CONTENTS-->
<div id="shoppingcolumn">
	<div class="shopping_inner">
		<h2>ご入力内容のご確認</h2>
		<p>
			下記ご注文内容で送信してもよろしいでしょうか？<br />
			よろしければ、一番下の「<!--{if !$lp_order && $payment_type != "" || $select_paidy_flg}-->次へ<!--{else}-->注文を確定する<!--{/if}-->」ボタンをクリックしてください。
		</p>
		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="confirm" />
            <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid|escape}-->" />
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$transactionid|escape}-->" />

			<h3>▼ご注文内容確認</h3>
			<table summary="ご注文内容確認" border="0" class="bdr_top">
				<!--{section name=cnt loop=$arrProductsClass}-->
					<tr>
						<td rowspan="4">
							<span class="phototd">
								<img src="/resize_image.php?image=<!--{$arrProductsClass[cnt].main_list_image}-->&amp;width=65&amp;height=65" alt="<!--{$arrProductsClass[cnt].name|escape}-->" />
							</span>
						</td>
					</tr>
					<tr>
						<td>
							商品名:<!--{* 商品名 *}--><strong><!--{$arrProductsClass[cnt].name|escape}--></strong><!--{if $reg_get == 1}-->(定期購入)<!--{/if}--><br />
							<!--{if $arrProductsClass[cnt].classcategory_name1 != ""}-->
								<!--{$arrProductsClass[cnt].class_name1}-->：<!--{$arrProductsClass[cnt].classcategory_name1}--><br />
							<!--{/if}-->
							<!--{if $arrProductsClass[cnt].classcategory_name2 != ""}-->
								<!--{$arrProductsClass[cnt].class_name2}-->：<!--{$arrProductsClass[cnt].classcategory_name2}-->
							<!--{/if}-->
							<!-- ▼規格3以上▼ -->
								<!--{foreach from=$arrProductsClass[cnt].extra_classcategory key=key item=val}-->
									<li>
										<!--{$val.class_name}-->：<!--{foreach from=$val.classcategory item=vval}--><!--{$vval}--><!--{/foreach}-->
									</li>
								<!--{/foreach}-->
							<!-- ▲規格3以上▲ -->
							<div class="count_down_box" id="count_down_<!--{$arrProductsClass[cnt].product_id}-->" ></div>
						</td>
					</tr>
					<tr>
						<td>
							単価:
							<span class="pricetd">
								<!--{if $reg_get == 1 && $regular_product.type == 1}-->
									<!--{$tpl_regular_add_price|number_format}-->円
								<!--{else}-->
                                    <!--{$arrProductsClass[cnt]|@calc_tax_include_price:$arrInfo|number_format|escape}-->円
								<!--{/if}-->
                                <!--{if $arrProductsClass[cnt]|@taxIdByProductsAndBaseinfo:$arrInfo|number_format|escape == $tax_id_mitigation}--><span class="attention">※</span><!--{/if}-->
							</span>
							/個数:
							<span><!--{$arrProductsClass[cnt].quantity|number_format|escape}-->個</span>
						</td>
					</tr>
                    <!--{if $arrProductsClass[cnt].returning}-->
                        <tr>
                            <td>返品特約:
                                <!--{if $arrProductsClass[cnt].returning.img}-->
                                    <img src="/upload/save_image/<!--{$arrProductsClass[cnt].returning.img.0}-->" />
                                <!--{else}-->
                                    <!--{$arrProductsClass[cnt].returning.name.0}-->
                                <!--{/if}-->
                            </td>
                        </tr>
                    <!--{/if}-->
					<tr>
						<td>小計:<span class="pricetd">
							<!--{if $reg_get == 1 && $regular_product.type == 1}-->
								<!--{$tpl_regular_add_price|number_format}-->円
							<!--{else}-->
								<!--{math equation="x + y" x=$arrProductsClass[cnt].total_pretax y=$tpl_regular_add_price assign="total_pretax_view"}--><!--{$total_pretax_view|number_format}-->円
								<!--{if $tpl_regular_add_price > 0 && $regular_product.type == '0'}-->
									<br /><em>[同梱商品分:<!--{$tpl_regular_add_price|number_format|escape}-->円]</em>
								<!--{/if}-->
							<!--{/if}-->
                            </span>
						</td>
					</tr>
				<!--{/section}-->
			</table>

            <table summary="ご注文内容確認">
                    <tr><td><span class="attention">単価欄に※が表示されている商品は軽減税率対象です。</span></td></tr>
				<!--{if $coupon_tr}-->
					<tr>
						<th class="resulttd">クーポン適用</th>
					</tr>
					<tr>
						<td class="pricetd">-<!--{$coupon_tr|number_format}-->円</td>
					</tr>
				<!--{/if}-->
                    <!--{foreach from=$tax_amount_list key="num" item="tax" name="tax_list"}-->
                    <tr>
                        <th class="resulttd">小 計(<!--{$tax.tax_type_name|escape}-->対象 : <!--{$tax.tax_rate|number_format|escape}-->%)</th>
                    </tr>
                    <tr>
                        <td class="resulttd_right">
                            <!--{$tax.amount|number_format|escape}-->円
                        </td>
                    </tr>
                    <!--{/foreach}-->
					<tr>
						<th class="resulttd">小 計</th>
					</tr>
					<tr>
						<td class="resulttd_right" >
							<!--{if $reg_get == 1 && $regular_product.type == 1}-->
								<!--{$tpl_regular_add_price|number_format}-->円
							<!--{else}-->
								<!--{math equation="x + y" x=$tpl_total_pretax y=$tpl_regular_add_price assign="total_pretax_view2"}--><!--{$total_pretax_view2|number_format}-->円
							<!--{/if}-->
						</td>
					</tr>
				<!--{if $point_flg != 2 && $reg_get != 1 && !$use_code_coupon}-->
					<tr>
						<th class="resulttd">値引き（ポイントご使用時）</th>
					</tr>
					<tr>
						<td class="resulttd_right">
						<!--{assign var=discount value=`$arrData.use_point*$smarty.const.POINT_VALUE`}-->
						-<!--{$discount|number_format|default:0}-->円
						</td>
					</tr>
				<!--{/if}-->
                <!--{foreach from=$tax_amount_list key="num" item="tax" name="tax_list"}-->
                    <!--{if $tax.proration_price}-->
                        <tr>
                            <th class="resulttd"><!--{$tax.tax_type_name|escape}-->対象割引後(<!--{$tax.tax_rate|number_format|escape}-->%)</th>
                        </tr>
                        <tr>
                            <td class="resulttd_right"><!--{$tax.proration_price|number_format|escape}-->円</td>
                        </tr>
                    <!--{/if}-->
                <!--{/foreach}-->
				<tr>
					<th class="resulttd">送 料</th>
				</tr>
				<tr>
					<td class="resulttd_right"><!--{$arrData.deliv_fee|number_format}-->円</td>
				</tr>
				<tr>
					<th class="resulttd">手数料</th>
				</tr>
				<tr>
					<td class="resulttd_right"><!--{$arrData.charge|number_format}-->円</td>
				</tr>
				<!--{if $sendingData}-->
					<!--{foreach from=$sendingData key=k item=val }-->
					<tr>
						<th class="resulttd"><!--{$val.service}--></th>
					</tr>
					<tr>
						<td class="resulttd_right"><!--{$val.cost|number_format}-->円</td>
					</tr>
				<!--{/foreach}-->
                <!--{/if}-->
                <!--{if $arrData.relay_fee != 0}-->
                    <tr>
                        <th class="resulttd">離島手数料</th>
                    </tr>
                    <tr>
                        <td class="resulttd_right"><!--{$arrData.relay_fee|number_format}-->円</td>
                    </tr>
                <!--{/if}-->
            </table>

            <div class="totalbg">合計
                <div class="reg_price">
					<em>
						<!--{if $reg_get == 1 && $regular_product.type == 1}-->
							<!--{math equation="a + b + c + d" a=$arrData.deliv_fee b=$tpl_regular_add_price c=$arrData.charge d=$arrData.relay_fee assign="totalview"}-->
							<!--{$totalview|number_format}-->円
						<!--{else}-->
							<!--{math equation="x + y" x=$arrData.payment_total y=$tpl_regular_add_price assign="totalview"}--><!--{$totalview|number_format}-->円
						<!--{/if}-->
					</em>
				</div>
             </div>
			<!--{* 定期購入詳細 ここから *}-->
            <!--{if $total_amount_flg && ($regular_bind_on_flg || $regular_important_matter !== '')}-->
				<!--{* 強制継続回数 ここから *}-->
				<!--{if $regular_bind_on_flg}-->
					<div class="regular_dt">
						<h3>▼定期内容詳細</h3>
						<h4>定期コース回数内訳</h4>
						<div class="ttl"><!--{$arrProductsClass[0].name|escape}--></div>
						<table summary="ポイント確認">
							<!--{section name=total_amount start=1 loop=$regular_bind_count+1}-->
							<tr>
								<!--{if $smarty.section.total_amount.iteration == 1}--><th rowspan="<!--{$regular_bind_count}-->" class="bg_gray bd_rt" width="40%">商品価格</th><!--{/if}-->
								<td class="cttd bd_rt bgnone" width="30%"><!--{$smarty.section.total_amount.iteration}-->回目</td>
								<td class="rttd bgnone" width="30%"><!--{$total_amount_detail.subtotal[$smarty.section.total_amount.iteration]|number_format}-->円</td>
							</tr>
							<!--{/section}-->

							<tr>
								<th class="bg_gray bd_rt" width="40%">商品総合計(税込)</th>
								<td></td>
								<td class="rttd"><!--{$total_amount_detail.subtotal.total|number_format}-->円</td>
							</tr>

							<tr>
								<th class="bg_gray bd_rt" width="40%">消費税総合計</th>
								<td></td>
								<td class="rttd"><!--{$total_amount_detail.tax.total|number_format}-->円</td>
							</tr>

							<tr>
								<th class="bg_gray bd_rt" width="40%">送料総合計</th>
								<td></td>
								<td class="rttd"><!--{$total_amount_detail.deliv_fee.total|number_format}-->円</td>
							</tr>

							<tr>
								<th class="bg_gray bd_rt" width="40%">手数料総合計</th>
								<td></td>
								<td class="rttd"><!--{$total_amount_detail.charge.total|number_format}-->円</td>
							</tr>
							<!--{if $total_amount_detail.discount.total > 0}-->
							<tr>
								<th class="bg_gray bd_rt" width="40%">値引額総合計</th>
								<td></td>
								<td class="rttd"><!--{$total_amount_detail.discount.total|number_format}-->円</td>
							</tr>
							<!--{/if}-->
						</table>

						<div class="totalreg2">
							定期<!--{$regular_bind_count|escape}-->回総合計
							<div class="reg_price"><!--{$total_amount|number_format}-->円</div>
						</div>
					</div>
				<!--{* 強制継続回数 ここまで *}-->
				<!--{/if}-->

				<div class="reg_memo">
					<p>
						<!--{eval var=$regular_important_matter}-->
					</p>
				</div>
			<!--{* 定期購入詳細 ここまで *}-->
            <!--{/if}-->

            <!--{if $lp_order}-->
                <table>
                    <tr>
                        <td class="resulttd_right">
                            <a href="./lp.php"><img src="<!--{$TPL_DIR|escape}-->img/shopping/confirm_change_btn.png" /></a>
                        </td>
                    </tr>
                </table>
            <!--{/if}-->
	</div>

	<div class="shopping_inner">
		<!--{* ログイン済みの会員のみ *}-->
		<!--{if $point_flg != 2 && $reg_get != 1 && !$use_code_coupon}-->
			<!--{if $tpl_login == 1 || $arrData.member_check == 1}-->
				<h3>▼ポイント確認</h3>
					<table summary="ポイント確認" class="delivname">
						<tr>
							<th class="resulttd">ご注文前のポイント</th>
						</tr>
						<tr>
							<td class="resulttd_right"><!--{$tpl_user_point|number_format|default:0}-->Pt</td>
						</tr>
						<tr>
							<th class="resulttd">ご使用ポイント</th>
						</tr>
						<tr>
							<td class="resulttd_right">-<!--{$arrData.use_point|number_format|default:0}-->Pt</td>
						</tr>
						<!--{if $arrData.birth_point > 0}-->
							<tr>
								<th class="resulttd">お誕生月ポイント</th>
							</tr>
							<tr>
								<td class="resulttd_right">+<!--{$arrData.birth_point|number_format|default:0}-->Pt</td>
							</tr>
						<!--{/if}-->
						<tr>
							<th class="resulttd">今回加算されるポイント</th>
						</tr>
						<tr>
							<td class="resulttd_right">+<!--{$arrData.add_point|number_format|default:0}-->Pt</td>
						</tr>
						<tr>
							<!--{assign var=total_point value=`$tpl_user_point-$arrData.use_point+$arrData.add_point`}-->
							<th class="resulttd"><!--{if $tpl_is_view_add_purchase_point_timing == true}--><!--{$tpl_add_purchase_point_timing_text}--><!--{else}-->ご注文完了後<!--{/if}-->のポイント</th>
						</tr>
						<tr>
							<td class="resulttd_right"><!--{$total_point|number_format}-->Pt</td>
						</tr>
					</table>
			<!--{/if}-->
		<!--{/if}-->
		<!--{* ログイン済みの会員のみ *}-->
	</div>
	<div class="shopping_inner">
		<h3>▼お届け先確認</h3>
		<table summary="お届け先確認">
			<tbody>
			<!--{* 別のお届け先が選択されている場合 *}-->
				<!--{if $arrData.deliv_check >= 1 || 'amazon_pay_v2_usable'|amazon_pay_v2_usable && $chosen_payment_amazon_pay_v2}-->
					<tr>
						<th class="resulttd">お名前</th>
					</tr>
					<tr>
						<td class="resulttd_right"><!--{$arrData.deliv_name01|escape}--> <!--{$arrData.deliv_name02|escape}--></td>
					</tr>
					<tr>
						<th class="resulttd">お名前<br />（ﾌﾘｶﾞﾅ）</th>
					</tr>
					<tr>
						<td class="resulttd_right"><!--{$arrData.deliv_kana01|escape}--> <!--{$arrData.deliv_kana02|escape}--></td>
					</tr>
					<tr>
						<th class="resulttd">郵便番号</th>
					</tr>
					<tr>
						<td class="resulttd_right">〒<!--{$arrData.deliv_zip01|escape}-->-<!--{$arrData.deliv_zip02|escape}--></td>
					</tr>
					<tr>
						<th class="resulttd">住 所</th>
					</tr>
					<tr>
						<td class="resulttd_right"><!--{$arrPref[$arrData.deliv_pref]}--><!--{$arrData.deliv_addr01|escape}--><!--{$arrData.deliv_addr02|escape}--></td>
					</tr>
					<tr>
						<th class="resulttd">電話番号</th>
					</tr>
					<tr>
						<td class="resulttd_right"><!--{$arrData.deliv_tel01}-->-<!--{$arrData.deliv_tel02}-->-<!--{$arrData.deliv_tel03}--></td>
					</tr>
				<!--{else}-->
					<tr>
						<th class="resulttd">お名前</th>
					</tr>
					<tr>
						<td class="resulttd_right"><!--{$arrData.order_name01|escape}--> <!--{$arrData.order_name02|escape}--></td>
					</tr>
					<tr>
						<th class="resulttd">お名前（フリガナ）</th>
					</tr>
					<tr>
						<td class="resulttd_right"><!--{$arrData.order_kana01|escape}--> <!--{$arrData.order_kana02|escape}--></td>
					</tr>
					<tr>
						<th class="resulttd">郵便番号</th>
					</tr>
					<tr>
						<td class="resulttd_right">〒<!--{$arrData.order_zip01|escape}-->-<!--{$arrData.order_zip02|escape}--></td>
					</tr>
					<tr>
						<th class="resulttd">住 所</th>
					</tr>
					<tr>
						<td class="resulttd_right"><!--{$arrPref[$arrData.order_pref]}--><!--{$arrData.order_addr01|escape}--><!--{$arrData.order_addr02|escape}--></td>
					</tr>
					<tr>
						<th class="resulttd">電話番号</th>
					</tr>
					<tr>
						<td class="resulttd_right"><!--{$arrData.order_tel01}-->-<!--{$arrData.order_tel02}-->-<!--{$arrData.order_tel03}--></td>
					</tr>
					<tr>
						<th class="resulttd">メールアドレス</th>
					</tr>
					<tr>
						<td class="resulttd_right"><!--{$arrData.order_email|escape}--></td>
					</tr>
				<!--{/if}-->
				<!--{if $smarty.session.nonmember_melmaga_regist}-->
					<tr>
						<th class="resulttd">メールマガジンの送付</th>
					</tr>
					<tr>
						<td class="resulttd_right">
							<!--{if $smarty.session.nonmember_melmaga_regist==1}-->
								受け取る
							<!--{elseif $smarty.session.nonmember_melmaga_regist==3}-->
								受け取らない
							<!--{/if}-->
						</td>
					</tr>
				<!--{/if}-->
                <!--{if $lp_order}-->
                    <tr>
                        <td class="resulttd_right">
                            <a href="./lp.php"><img src="<!--{$TPL_DIR|escape}-->img/shopping/confirm_change_btn.png" /></a>
                        </td>
                    </tr>
                <!--{/if}-->
			</tbody>
		</table>
		<!--お届け先ここまで-->
	</div>
	<div class="shopping_inner">
		<h3>▼お支払方法・お届け時間の指定・その他</h3>
		<table summary="お支払方法・お届け時間の指定・その他お問い合わせ" class="delivname">
			<tbody>
				<tr>
					<th class="resulttd">お支払方法</th>
				</tr>
				<tr>
					<td class="resulttd_right"><!--{$arrData.payment_method|escape}--></td>
				</tr>
				<!--{if $reg_get != 1}-->
					<tr>
						<th class="resulttd"><!--{$arrDelivDateDisplay.deliv_date_display}--></th>
					</tr>
					<tr>
						<td class="resulttd_right"><!--{$arrData.deliv_date|escape|default:"指定なし"}--></td>
					</tr>
				<!--{/if}-->
				<tr>
					<th class="resulttd">お届け時間</th>
				</tr>
				<tr>
					<td class="resulttd_right"><!--{$arrData.deliv_time|escape|default:"指定なし"}--></td>
				</tr>
				<!--{if $reg_get == 1}-->
					<tr>
						<th class="resulttd">お届けサイクル</th>
					</tr>
					<tr>
						<td class="resulttd_right"><!--{$date_text}--></td>
					</tr>
				<!--{/if}-->
				<tr>
					<th class="resulttd">その他お問い合わせ</th>
				</tr>
				<tr>
                    <td class="resulttd word_wrap"><!--{$arrData.message|escape|nl2br}--></td>
				</tr>
				<!--{if $point_flg != 2 && $reg_get != 1 && !$use_code_coupon}-->
					<!--{if $tpl_login == 1}-->
						<tr>
							<th class="resulttd">ポイント使用</th>
						</tr>
						<tr>
							<td class="resulttd_right"><!--{$arrData.use_point|default:0}-->Pt</td>
						</tr>
					<!--{/if}-->
				<!--{/if}-->
                <!--{if $lp_order}-->
                    <tr>
                        <td class="resulttd_right">
                            <a href="./lp.php"><img src="<!--{$TPL_DIR|escape}-->img/shopping/confirm_change_btn.png" /></a>
                        </td>
                    </tr>
                <!--{/if}-->
			</tbody>
		</table>
	</div>
	</form>

<!--{* ▼アップセル▼ *}-->
<!--{if $lp_order}-->
	<!--{* ▽商品指定▽ *}-->
				<!--{if $arrProductsClass[0].product_id == '###'}--><!--{* ###にサンプル・単品の商品IDを入力 *}-->
					<!--{assign var=tups value='###'}--><!--{* ###に定期購入の商品IDを入力 *}-->
				<!--{/if}-->
	<!--{* △商品指定△ *}-->

	<!--{* ▽表示コンテンツ▽ *}-->
				<!--{if $tups != ''}-->
				<a href="lp.php?up=<!--{$tups|escape}-->&p=<!--{$lp_page|escape}-->&scroll=#form1"><div class="btn_ups"><img src="<!--{$TPL_DIR|escape}-->img/shopping/upsell.png" /></div></a>
				<!--{/if}-->
	<!--{* △表示コンテンツ△ *}-->
<!--{/if}-->
<!--{* ▲アップセル▲ *}-->

<!--{if $lp_order}-->
    <!--{if $tups != ''}-->
    <div class="lp_combtn">
        <a href="./lp.php?up=<!--{$tups|escape}-->&p=<!--{$lp_page|escape}-->&scroll=#form1">定期購入に変更する<input type="hidden" name="back03" id="back03"></a>
    </div>
    <!--{/if}-->

    <div class="btn_area">
        <ul>
            <li class="prv_btn">
                <a href="./lp.php">前に戻る<input type="hidden" name="back03" id="back03" /></a>
            </li>
            <li class="nx_btn">
                <!--{if $select_paidy_flg}-->
                    <a href="javascript:void(0);" id="<!--{$paidy_pay_id|escape}-->">次へ</a>
                <!--{else}-->
                    <a href="javascript:void(0);" onclick="return fnCheckSubmit();">注文を確定する<input type="hidden" name="next" id="next" /></a>
                <!--{/if}-->
            </li>
        </ul>
    </div>
<!--{else}-->
	<ul class="btn_area">
		<li class="prv_btn">
			<a href="./payment.php">戻る<input type="hidden" name="back03" id="back03" /></a>
		</li>
		<li class="nx_btn">
            <!--{if $select_paidy_flg}-->
                <a href="javascript:void(0);" id="<!--{$paidy_pay_id|escape}-->">次へ</a>
            <!--{else}-->
                <a href="javascript:void(0);" onclick="return fnCheckSubmit();"><!--{if $payment_type != ""}-->次へ<!--{else}-->注文を確定する<!--{/if}--></a>
            <!--{/if}-->
		</li>
	</ul>
<!--{/if}-->
<!--{* アップセルダイアログを使用する場合は下記のコメントアウトを外してください。 *}-->
<!--{* <!--{include file="`$smarty.const.S_TEMPLATE_PATH`/shopping/lp_ups_dialog.tpl"}--> *}-->
</div>


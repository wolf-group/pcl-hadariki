<!--{*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2007 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *}-->
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
//]]>
</script>
<!--▼CONTENTS-->
<!--{assign var=regular_type_master value='Page::REGULAR_TYPE_MASTER'|const}-->
<!--{assign var=type_buying_club    value='Page::TYPE_BUYING_CLUB'|const}-->
<div id="shoppingcolumn">
	<!--Start Flow Area-->
	<!--{if $lp_order}-->
	<div style="margin:0 auto; text-align:center;">
		<img src="<!--{$TPL_DIR}-->img/shopping/lp_flow02.png" style="margin:0 auto;" />
	</div>
	<!--{else}-->
	<div class="flowarea">
		<!--{if $reg_get == 1 || $tpl_login != 1}-->
			<!--{if $arrData.payment_id|sfIsPaygentConveni || $arrData.memo03 == 'CONVENI'}-->
				<img src="<!--{$TPL_DIR}-->img/shopping/n_step3-convini.png" style="margin:0 auto;" />
			<!--{elseif $arrData.payment_id|sfIsPaygentCredit || $arrData.memo03 == '###'}-->
				<img src="<!--{$TPL_DIR}-->img/shopping/n_step3_credit.png" style="margin:0 auto;" />
			<!--{else}-->
				<img src="<!--{$TPL_DIR}-->img/shopping/flow03.png" style="margin:0 auto;" />
			<!--{/if}-->
		<!--{else}-->
			<!--{if $arrData.payment_id|sfIsPaygentConveni || $arrData.memo03 == 'CONVENI'}-->
				<img src="<!--{$TPL_DIR}-->img/shopping/m_step2-convini.png" style="margin:0 auto;" />
			<!--{elseif $arrData.payment_id|sfIsPaygentCredit || $arrData.memo03 == '###'}-->
				<img src="<!--{$TPL_DIR}-->img/shopping/m_step2-credit.png" style="margin:0 auto;" />
			<!--{else}-->
				<img src="<!--{$TPL_DIR}-->img/shopping/flow06-2.png" style="margin:0 auto;" />
			<!--{/if}-->
		<!--{/if}-->
	</div>
    <!--{/if}-->
	<!--End Flow Area-->
    <!--{if $arrErr}-->
        <div class="pt05 pb05 ">
            <!--{foreach from=$arrErr key=key item=val}-->
                <span class="attention"><!--{$val}--></span>
            <!--{/foreach}-->
        </div>
    <!--{/if}-->
	<div class="head">
		<h2 class="t_conf">ご入力内容のご確認</h2>
	</div>

	<p class="pdtb10">下記ご注文内容で送信してもよろしいでしょうか？<br />
	よろしければ、一番下の「<!--{if !$lp_order && $payment_type != "" || $select_paidy_flg}-->次へ<!--{else}-->注文を確定する<!--{/if}-->」ボタンをクリックしてください。</p>

	<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
		<input type="hidden" name="mode" value="confirm" />
    <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid|escape}-->" />
    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$transactionid|escape}-->" />

		<table summary="ご注文内容確認">
			<tr>
				<th class="centertd">商品写真</th>
				<th class="centertd">商品名</th>
				<th class="centertd">単価</th>
				<th class="centertd">個数</th>
				<th class="centertd">返品特約</th>
				<th class="centertd">小計</th>
			</tr>
		<!--{section name=cnt loop=$arrProductsClass}-->
			<tr>
				<td class="phototd" width="20%">
					<a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="win01('/products/detail_image.php?product_id=<!--{$arrProductsClass[cnt].product_id}-->&amp;image=main_image','detail_image','<!--{$arrProductsClass[cnt].tpl_image_width}-->','<!--{$arrProductsClass[cnt].tpl_image_height}-->'); return false;" target="_blank">
						<img src="/resize_image.php?image=<!--{$arrProductsClass[cnt].main_list_image}-->&amp;width=65&amp;height=65" alt="<!--{$arrProductsClass[cnt].name|escape}-->" />
					</a>
				</td>
				<td class="centertd" width="50%">
					<ul>
						<li><strong><!--{$arrProductsClass[cnt].name|escape}--></strong><!--{if $reg_get == 1}-->(定期購入)<!--{/if}--></li>
					<!--{if $arrProductsClass[cnt].classcategory_name1 != ""}-->
						<li><!--{$arrProductsClass[cnt].class_name1}-->：<!--{$arrProductsClass[cnt].classcategory_name1}--></li>
					<!--{/if}-->
					<!--{if $arrProductsClass[cnt].classcategory_name2 != ""}-->
						<li><!--{$arrProductsClass[cnt].class_name2}-->：<!--{$arrProductsClass[cnt].classcategory_name2}--></li>
					<!--{/if}-->
						<!-- ▼規格3以上▼ -->
					<!--{foreach from=$arrProductsClass[cnt].extra_classcategory key=key item=val}-->
						<li>
								<!--{$val.class_name}-->：<!--{foreach from=$val.classcategory item=vval}--><!--{$vval}--><!--{/foreach}-->
						</li>
					<!--{/foreach}-->
						<!-- ▲規格3以上▲ -->
					</ul>
				</td>
				<td class="centertd">
				<!--{if $reg_get == $regular_type_master && $regular_product.type == $type_buying_club}-->
					<!--{$tpl_regular_add_price|number_format|escape}-->円
				<!--{else}-->
					<!--{$arrProductsClass[cnt]|@calc_tax_include_price:$arrInfo|number_format|escape}-->円
				<!--{/if}-->
				<!--{if $arrProductsClass[cnt]|@taxIdByProductsAndBaseinfo:$arrInfo|number_format|escape == $tax_id_mitigation}-->
					<span class="attention">※</span>
				<!--{/if}-->
				</td>
				<td class="centertd"><!--{$arrProductsClass[cnt].quantity|number_format}-->個</td>
				<td align="right">
					<!--{foreach from=$arrProductsClass[cnt].returning key="type" item="returning" name="returning"}-->
						<!--{if $type == "img"}-->
							<!--{foreach from=$returning key="cnt" item="returning_image" name="returning_image"}-->
								<img src="/upload/save_image/<!--{$returning_image}-->" /><br />
							<!--{/foreach}-->
						<!--{else}-->
						<!--{foreach from=$returning key="cnt" item="returning_name" name="returning_name"}-->
							<span style="color:#FF0000">[<!--{$returning_name}-->]</span>
						<!--{/foreach}-->
						<!--{/if}-->
					<!--{/foreach}-->
				</td>
				<td class="pricetd">
				<!--{if $reg_get == $regular_type_master && $regular_product.type == $type_buying_club}-->
					<!--{$tpl_regular_add_price|number_format|escape}-->円
				<!--{else}-->
					<!--{math equation="x + y" x=$arrProductsClass[cnt].total_pretax y=$tpl_regular_add_price assign="total_pretax_view"}--><!--{$total_pretax_view|number_format|escape}-->円
					<!--{if $tpl_regular_add_price > 0 && $regular_product.type == '0'}-->
						<br /><em>[同梱商品分:<!--{$tpl_regular_add_price|number_format|escape}-->円]</em>
					<!--{/if}-->
				<!--{/if}-->
				</td>
			</tr>
		<!--{/section}-->
		<!--{if $coupon_tr}-->
		<tr class="qponbg">
			<td colspan="5" class="righttd">クーポン適用</td>
			<td align="right"><span class="qpon_pr">-<!--{$coupon_tr|number_format}-->円</span></td>
		</tr>
		<!--{/if}-->
        <tr>
            <!--{math equation=a+b a=$tax_amount_list|@count b=1 assign=rowspan}-->
            <td rowspan="<!--{$rowspan}-->" class="righttd">小計</td>
            <td colspan="4" class="righttd">計</td>
            <td class="pricetd">
            <!--{if $reg_get == $regular_type_master && $regular_product.type == $type_buying_club}-->
                <!--{$tpl_regular_add_price|number_format|escape}-->円
            <!--{else}-->
                <!--{math equation="x + y" x=$arrData.subtotal y=$tpl_regular_add_price assign="total_pretax_view2"}--><!--{$total_pretax_view2|number_format|escape}-->円
            <!--{/if}-->
            </td>
        </tr>
        <!--{foreach from=$tax_amount_list key="num" item="tax" name="tax_list"}-->
        <tr>
            <td colspan="4" class="righttd"><!--{$tax.tax_type_name|escape}-->対象(<!--{$tax.tax_rate|number_format|escape}-->%)</td>
            <td class="pricetd"><!--{$tax.amount|number_format|escape}-->円</td>
        </tr>
        <!--{/foreach}-->
		<!--{if $point_flg != 2 && $reg_get != 1 && !$use_code_coupon}-->
		<tr>
			<td colspan="5" class="righttd">値引き（ポイントご使用時）</td>
				<td class="pricetd">
				<!--{assign var=discount value=`$arrData.use_point*$smarty.const.POINT_VALUE`}-->
				-<!--{$discount|number_format|default:0}-->円
			</td>
		</tr>
		<!--{/if}-->
		<!--{foreach from=$tax_amount_list key="num" item="tax" name="tax_list"}-->
			<!--{if $tax.proration_price}-->
				<tr>
					<td colspan="5" class="righttd"><!--{$tax.tax_type_name|escape}-->対象割引後(<!--{$tax.tax_rate|number_format|escape}-->%)</td>
					<td class="pricetd"><!--{$tax.proration_price|number_format|escape}-->円</td>
				</tr>
			<!--{/if}-->
		<!--{/foreach}-->
			<tr>
				<td colspan="5" class="righttd">送料</td>
				<td class="pricetd"><!--{$arrData.deliv_fee|number_format}-->円</td>
			</tr>
			<tr>
				<td colspan="5" class="righttd">手数料</td>
				<td class="pricetd"><!--{$arrData.charge|number_format}-->円</td>
			</tr>
			<!--{if $sendingData}-->
				<!--{foreach from=$sendingData key=k item=val }-->
				<tr>
					<td colspan="5" class="righttd"><!--{$val.service}--></td>
					<td class="pricetd"><!--{$val.cost|number_format}-->円</td>
				</tr>
				<!--{/foreach}-->
			<!--{/if}-->
			<!--{if $arrData.relay_fee != 0}-->
			<tr>
				<td colspan="5" class="righttd">離島手数料</td>
				<td class="pricetd"><!--{$arrData.relay_fee|number_format}-->円</td>
			</tr>
			<!--{/if}-->
			<tr class="totalbg">
				<td colspan="5" class="righttd">合計</td>
				<td class="pricetd"><span class="price">
				<!--{if $reg_get == $regular_type_master && $regular_product.type == $type_buying_club}-->
					<!--{math equation="a + b + c + d" a=$arrData.deliv_fee b=$tpl_regular_add_price c=$arrData.charge d=$arrData.relay_fee assign="totalview"}-->
					<!--{$totalview|number_format|escape}-->円
				<!--{else}-->
					<!--{math equation="x + y" x=$arrData.payment_total y=$tpl_regular_add_price assign="totalview"}-->
					<!--{$totalview|number_format|escape}-->円
				<!--{/if}-->
				</span></td>
			</tr>
		</table>
		<span class="attention">単価欄に※が表示されている商品は軽減税率対象です。</span>
		<!--{if $total_amount_flg && ($regular_bind_on_flg || $regular_important_matter !== '')}-->
		<!--{* 定期購入詳細 ここから *}-->
		<div class="regular_dt">
			<!--{if $regular_bind_on_flg}-->
			<h3>▼定期コース申込内容 </h3>
			<h4>定期コース回数内訳</h4>
			<div class="ttl"><!--{$arrProductsClass[0].name|escape}--></div>
			<table summary="ポイント確認">
				<!--{section name=total_amount start=1 loop=$regular_bind_count+1}-->
				<tr>
					<!--{if $smarty.section.total_amount.iteration == 1}--><th rowspan="<!--{$regular_bind_count}-->" class="lftd bd_rt" width="50%">商品価格</th><!--{/if}-->
					<td class="cttd bd_rt bgnone" width="25%"><!--{$smarty.section.total_amount.iteration}-->回目</td>
					<td class="rttd bgnone" width="25%"><!--{$total_amount_detail.subtotal[$smarty.section.total_amount.iteration]|number_format}-->円</td>
				</tr>
			<!--{/section}-->
			</table>
			<table>
				<tr>
					<!--{if $total_amount_detail.discount.total > 0}-->
					<th class="bd_rt" width="20%">商品総合計(税込)</th>
					<th class="bd_rt" width="20%">消費税総合計</th>
					<th class="bd_rt" width="20%">送料総合計</th>
					<th class="bd_rt" width="20%">手数料総合計</th>
					<th class="bd_rt" width="20%">値引額総合計</th>
					<!--{else}-->
					<th class="bd_rt" width="25%">商品総合計(税込)</th>
					<th class="bd_rt" width="25%">消費税総合計</th>
					<th class="bd_rt" width="25%">送料総合計</th>
					<th class="bd_rt" width="25%">手数料総合計</th>
					<!--{/if}-->
				</tr>

				<tr>
					<td class="cttd bd_rt pd10"><!--{$total_amount_detail.subtotal.total|number_format}-->円</td>
					<td class="cttd bd_rt pd10"><!--{$total_amount_detail.tax.total|number_format}-->円</td>
					<td class="cttd bd_rt pd10"><!--{$total_amount_detail.deliv_fee.total|number_format}-->円</td>
					<td class="cttd pd10"><!--{$total_amount_detail.charge.total|number_format}-->円</td>
					<!--{if $total_amount_detail.discount.total > 0}--><td class="cttd pd10"><!--{$total_amount_detail.discount.total|number_format}-->円</td><!--{/if}-->
				</tr>


				<tr class="totalreg">
					<td class="" ></td>
					<td class="" ></td>
					<!--{if $total_amount_detail.discount.total > 0}--><td class="" ></td><!--{/if}-->
					<td class="cttd bd_rt" width="25%">定期<!--{$regular_bind_count|escape}-->回総合計</td>
					<td class="rttd"><span class="reg_price"><!--{$total_amount|number_format}-->円</span></td>
				</tr>
			</table>
			<!--{/if}-->
			<div class="reg_memo">
				<p>
					<!--{eval var=$regular_important_matter}-->
				</p>
			</div>
		</div>
		<!--{* 定期購入詳細 ここまで *}-->
		<!--{/if}-->



	<!--{* ログイン済みの会員のみ *}-->
	<!--{if $point_flg != 2 && $reg_get != 1 && !$use_code_coupon}-->
		<!--{if $tpl_login == 1 || $arrData.member_check == 1}-->
		<table summary="ポイント確認" class="delivname">
			<tr>
				<th width="50%">ご注文前のポイント</th>
				<td><!--{$tpl_user_point|number_format|default:0}-->Pt</td>
			</tr>
			<tr>
				<th>ご使用ポイント</th>
				<td>-<!--{$arrData.use_point|number_format|default:0}-->Pt</td>
			</tr>
			<!--{if $arrData.birth_point > 0}-->
			<tr>
				<th>お誕生月ポイント</th>
				<th>+<!--{$arrData.birth_point|number_format|default:0}-->Pt</td>
			</tr>
			<!--{/if}-->
			<tr>
				<th>今回加算されるポイント</th>
				<td>
				+<!--{$arrData.add_point|number_format|default:0}-->Pt
				<!--{if $coupon_reward_point}--> +<!--{$coupon_reward_point|number_format}-->Pt(クーポン分)<!--{/if}-->
				</td>
			</tr>
			<tr>
				<!--{assign var=total_point value=`$tpl_user_point-$arrData.use_point+$arrData.add_point`}-->
				<th>
					<!--{if $tpl_is_view_add_purchase_point_timing == true}-->
						<!--{$tpl_add_purchase_point_timing_text}-->のポイント
					<!--{else}-->
						ご注文完了後のポイント
					<!--{/if}-->
				</th>
				<td><!--{$total_point|number_format}-->Pt</td>
			</tr>
		</table>
		<!--{/if}-->
	<!--{/if}-->
	<!--{* ログイン済みの会員のみ *}-->
        <!--{* 別のお届け先が選択されている場合 *}-->
		<!--{if $arrData.deliv_check >= 1 || 'amazon_pay_v2_usable'|amazon_pay_v2_usable && $chosen_payment_amazon_pay_v2}-->
			<!--{if $lp_order}-->
			<div class="lp_h3">
				<div class="cf_ttl" style="float:left">▼お届け先</div>
				<div style="text-align:right"><a href="./lp.php"><img src="<!--{$TPL_DIR}-->img/shopping/confirm_change_btn.png"></a></div>
			</div>
			<!--{/if}-->
			<!--{if !$lp_order}-->
				<div class="cf_ttl">▼お届け先</div>
			<!--{/if}-->
			<table summary="お届け先確認" class="delivname">
				<tbody>
					<tr>
						<th width="50%">お名前</th>
						<td><!--{$arrData.deliv_name01|escape}--> <!--{$arrData.deliv_name02|escape}--></td>
					</tr>
					<tr>
						<th>お名前（フリガナ）</th>
						<td><!--{$arrData.deliv_kana01|escape}--> <!--{$arrData.deliv_kana02|escape}--></td>
					</tr>
					<tr>
						<th>郵便番号</th>
						<td>〒<!--{$arrData.deliv_zip01|escape}-->-<!--{$arrData.deliv_zip02|escape}--></td>
					</tr>
					<tr>
						<th>住所</th>
						<td><!--{$arrPref[$arrData.deliv_pref]}--><!--{$arrData.deliv_addr01|escape}--><!--{$arrData.deliv_addr02|escape}--></td>
					</tr>
					<tr>
						<th>電話番号</th>
						<td><!--{$arrData.deliv_tel01}-->-<!--{$arrData.deliv_tel02}-->-<!--{$arrData.deliv_tel03}--></td>
					</tr>
			</table>
		<!--{/if}-->
		<!--お届け先ここまで-->
		<!--{if $lp_order}-->
		<div class="lp_h3">
			<div class="cf_ttl" style="float:left">▼ご注文者様情報</div>
			<div style="text-align:right"><a href="./lp.php"><img src="<!--{$TPL_DIR}-->img/shopping/confirm_change_btn.png"></a></div>
		</div>
		<!--{/if}-->
		<!--{if !$lp_order}-->
			<div class="cf_ttl" style="margin-top:10px;" >▼ご注文者様情報</div>
		<!--{/if}-->
		<table summary="ご注文者様情報" class="delivname" style="margin:0;">
			<tbody>
				<tr>
					<th width="50%">お名前</th>
					<td><!--{$arrData.order_name01|escape}--> <!--{$arrData.order_name02|escape}--></td>
				</tr>
				<tr>
					<th>お名前（フリガナ）</th>
					<td><!--{$arrData.order_kana01|escape}--> <!--{$arrData.order_kana02|escape}--></td>
				</tr>
				<tr>
					<th>郵便番号</th>
					<td>〒<!--{$arrData.order_zip01|escape}-->-<!--{$arrData.order_zip02|escape}--></td>
				</tr>
				<tr>
					<th>住所</th>
					<td><!--{$arrPref[$arrData.order_pref]}--><!--{$arrData.order_addr01|escape}--><!--{$arrData.order_addr02|escape}--></td>
				</tr>
				<tr>
					<th>電話番号</th>
					<td><!--{$arrData.order_tel01}-->-<!--{$arrData.order_tel02}-->-<!--{$arrData.order_tel03}--></td>
				</tr>
				<tr>
					<th>メールアドレス</th>
					<td><!--{$arrData.order_email|escape}--></td>
				</tr>
				<!--{if $smarty.session.nonmember_melmaga_regist}-->
					<tr>
						<th>メールマガジンの送付</th>
						<td>
							<!--{if $smarty.session.nonmember_melmaga_regist==1}-->
								受け取る
							<!--{elseif $smarty.session.nonmember_melmaga_regist==3}-->
								受け取らない
							<!--{/if}-->
						</td>
					</tr>
				<!--{/if}-->
			</tbody>
		</table>
		<!--ご注文者様情報ここまで-->
		<!--{if $lp_order}-->
		<div class="lp_h3">
			<div class="cf_ttl" style="float:left">▼お支払方法・お届け時間の指定・その他お問い合わせ</div>
			<div style="text-align:right"><a href="./lp.php"><img src="<!--{$TPL_DIR}-->img/shopping/confirm_change_btn.png"></a></div>
		</div>
		<!--{/if}-->
		<!--{if !$lp_order}-->
			<div class="cf_ttl" style="margin-top:30px;">▼お支払方法・お届け時間の指定・その他お問い合わせ</div>
		<!--{/if}-->
		<table summary="お支払方法・お届け時間の指定・その他お問い合わせ" class="delivname">
			<tbody>
			<tr>
				<th width="50%">お支払方法</th>
				<td><!--{$arrData.payment_method|escape}--></td>
			</tr>
			<!--{if $reg_get != 1}-->
			<tr>
				<th><!--{$arrDelivDateDisplay.deliv_date_display}--></th>
				<td><!--{$arrData.deliv_date|escape|default:"指定なし"}--></td>
			</tr>
			<!--{/if}-->
			<tr>
				<th>お届け時間</th>
				<td><!--{$arrData.deliv_time|escape|default:"指定なし"}--></td>
			</tr>
			<!--{if $reg_get == 1}-->
			<tr>
				<th>お届けサイクル</th>
				<td><!--{$date_text}--></td>
			</tr>
			<!--{/if}-->
			<tr>
				<th>その他お問い合わせ</th>
				<td><!--{$arrData.message|escape|nl2br}--></td>
			</tr>
			<!--{if $point_flg != 2 and $reg_get != 1}-->
				<!--{if $tpl_login == 1}-->
				<tr>
					<th>ポイント使用</th>
					<td><!--{$arrData.use_point|default:0}-->Pt</td>
				</tr>
				<!--{/if}-->
			<!--{/if}-->
			</tbody>
		</table>
		<br />
		<div class="tblareabtn">
<!--{* ▼アップセル▼ *}-->
<!--{if $lp_order}-->
	<!--{* ▽商品指定▽ *}-->
			<!--{if $arrProductsClass[0].product_id == '###'}--><!--{* ###にサンプル・単品の商品IDを入力 *}-->
				<!--{assign var=tups value='###'}--><!--{* ###に定期購入の商品IDを入力 *}-->
			<!--{/if}-->
	<!--{* △商品指定△ *}-->

	<!--{* ▽表示コンテンツ▽ *}-->
			<!--{if $tups != ''}-->
			<!--{* <!--{$lp_page}--> は元々アクセスしていたLP 必要があればアップセル対象のLPキーに変更してください *}-->
			<a href="lp.php?up=<!--{$tups|escape}-->&p=<!--{$lp_page|escape}-->&scroll=#form1"><span class="btn_ups"><img src="<!--{$TPL_DIR|escape}-->img/shopping/upsell.png" /></span></a>
			<!--{/if}-->
	<!--{* △表示コンテンツ△ *}-->
<!--{/if}-->
<!--{* ▲アップセル▲ *}-->
				<!--{if $lp_order}-->
				<div class="btn_area_shopping">
					<ul>
						<li><a href="./lp.php"><img src="<!--{$TPL_DIR|escape}-->img/shopping/lp_back.png" /><input type="hidden" name="back03" id="back03"></a></li>
						<!--{if $tups != ''}-->
							<!--{* ▼アップセル▼ *}-->
							<!--{* <!--{$lp_page}--> は元々アクセスしていたLP 必要があればアップセル対象のLPキーに変更してください *}-->
							<li><a href="lp.php?up=<!--{$tups|escape}-->&p=<!--{$lp_page|escape}-->&scroll=#form1" id="ups_button">定期購入に変更する</a></li>
							<!--{* ▲アップセル▲ *}-->
						<!--{else}-->
							<li>&nbsp;</li>
						<!--{/if}-->
                        <!--{if $select_paidy_flg}-->
                            <li><button type="button" id="<!--{$paidy_pay_id|escape}-->" class="confirm_button pc_confirm_button">次へ</button></li>
                        <!--{else}-->
					        <li><span class="ordercomp_bt" onclick="return fnCheckSubmit();"><a href="javascript:void(0);">注文を確定する<input type="hidden" name="next" id="next"></a></span></li>
                        <!--{/if}-->
					</ul>
				</div>
				<!--{else}-->
				<div class="btn_rpst1">
					<span class="btn_prev"><a href="./payment.php">前のページへ戻る<input type="hidden" name="back03" id="back03" /></a></span>
				</div>
				<div class="btn_rpst2">

                    <!--{if $select_paidy_flg}-->
                        <span class="btn_next"><a href="javascript:void(0);" id="<!--{$paidy_pay_id|escape}-->">次へ</a></span>
                    <!--{else}-->
                        <span class="btn_next" onclick="return fnCheckSubmit();"><a href="javascript:void(0);"><!--{if $payment_type != ""}-->次へ<!--{else}-->注文を確定する<!--{/if}--><input type="hidden" name="next" id="next" /></a></span>
                    <!--{/if}-->
				</div>
				<!--{/if}-->
		</div>
	</form>
	<!--{* アップセルダイアログを使用する場合は下記のコメントアウトを外してください。 *}-->
	<!--{* <!--{include file='./shopping/lp_ups_dialog.tpl'}--> *}-->
</div>
<!--▲CONTENTS-->


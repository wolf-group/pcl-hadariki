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
	window.onload=function(){
	    <!--{if $arrErr.use_point}-->
	    	document.getElementById('use_point').style.backgroundColor = '<!--{$smarty.const.ERR_COLOR}-->';
	    <!--{else}-->
	    	//fnCheckInputPoint();
	    <!--{/if}-->
    }
//]]>
</script>
<!--▼お届け先の指定-->
<div id="shoppingcolumn">
	<div class="flowarea">
         <!--{if $credit_flg}-->
         <img src="<!--{$TPL_DIR}-->img/shopping/flow05c.png" style="margin:0 auto;" />
         <!--{else}-->
         <img src="<!--{$TPL_DIR}-->img/shopping/flow05.png" style="margin:0 auto;" />
         <!--{/if}-->
	</div>

	<div class="head">
		<h2 class="t_payment">お届け先・お支払い方法・お届け時間等の指定</h2>
	</div>

  <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
    <input type="hidden" name="mode" value="confirm" />
    <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid|escape}-->" />
    <input type="hidden" name="other_deliv_id" value="" />
    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$transactionid|escape}-->" />
        <div class="subhead">
			<h3 class="t_method">お届け先の指定</h3>
        </div>
        <!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable && $chosen_payment_amazon_pay_v2}-->
        <button type="button" id="AmazonPayChangeAddressButton">AmazonPay お届け先住所変更</button><!--{amazon_pay_change_address_button button_id='AmazonPayChangeAddressButton' action='changeAddress'}-->
        <!--{else}-->
            <p class="mgb10">下記一覧よりお届け先住所を選択して、「選択したお届け先に送る」ボタンをクリックしてください。<br />
            一覧にご希望の住所が無い場合は、「新しいお届け先を追加する」より追加登録してください。<br />
            <span class="attention">※最大20件まで登録できます。</span></p>
            <!--{if $tpl_addrmax < $smarty.const.DELIV_ADDR_MAX}-->
                <p class="btnbox_l">
                    <a href="<!--{$smarty.const.URL_DIR}-->mypage/delivery_addr.php" onclick="win02('<!--{$smarty.const.URL_DIR}-->mypage/delivery_addr.php?page=<!--{$smarty.server.PHP_SELF|escape}-->','new_deiv','600','640'); return false;">新しいお届け先を追加する<input type="hidden" name="addition" id="addition" /></a>
                </p>
            <!--{/if}-->
        <!--{/if}-->
		<!--{if $arrErr.deli != ""}-->
			<p class="attention"><!--{$arrErr.deli}--></p>
		<!--{/if}-->
		<table summary="お届け先の指定">
			<tr>
				<th class="centertd" width="100">選択</th>
				<th>住所種類</th>
                <th>お届け先</th>
                <!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable}-->
                <th class="centertd"></th>
                <th class="centertd"></th>
                <!--{else}-->
				<th class="centertd">変更</th>
                <th class="centertd">削除</th>
                <!--{/if}-->
			</tr>
			<!--{section name=cnt loop=$arrAddr}-->
			<tr>
				<td class="centertd">
					<!--{if $smarty.section.cnt.first}-->
						<input type="radio" name="deliv_check" id="chk_id_<!--{$smarty.section.cnt.iteration}-->" value="-1" <!--{if $arrForm.deliv_check.value == "" || $arrForm.deliv_check.value == -1}--> checked="checked"<!--{/if}--> />
					<!--{else}-->
						<input type="radio" name="deliv_check" id="chk_id_<!--{$smarty.section.cnt.iteration}-->" value="<!--{$arrAddr[cnt].other_deliv_id}-->" <!--{if $arrForm.deliv_check.value == $arrAddr[cnt].other_deliv_id}--> checked="checked"<!--{/if}--> />
					<!--{/if}-->
				</td>
				<td>
					<label for="chk_id_<!--{$smarty.section.cnt.iteration}-->">
	               <!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable && $chosen_payment_amazon_pay_v2}-->
                        AmazonPayお届け先住所
					<!--{elseif 'basis-lp_only'|get_option_use_flg == true}-->
						登録住所
					<!--{elseif $smarty.section.cnt.first}-->
						会員登録住所
					<!--{else}-->
						追加登録住所
					<!--{/if}-->
					</label>
				</td>
				<td>
					<!--{assign var=key value=$arrAddr[cnt].pref}-->
					<!--{$arrPref[$key]}--><!--{$arrAddr[cnt].addr01|escape}--><!--{$arrAddr[cnt].addr02|escape}--><br />
					<!--{$arrAddr[cnt].name01|escape}--> <!--{$arrAddr[cnt].name02|escape}-->
				</td>
				<td class="centertd">
					<!--{if !$smarty.section.cnt.first}-->
					<div class="btn_fv"></div><a href="<!--{$smarty.const.URL_DIR|escape}-->mypage/delivery_addr.php" onclick="win02('<!--{$smarty.const.URL_DIR|escape:javascript}-->mypage/delivery_addr.php?page=<!--{$smarty.server.PHP_SELF|escape:javascript}-->&amp;other_deliv_id=<!--{$arrAddr[cnt].other_deliv_id|escape:javascript}-->','new_deiv','600','640'); return false;">変更</a></div>
                    <!--{else}-->
                    <div id="AmazonPayChangeAddressButton"><!--{amazon_pay_change_address_button action='changeAddress'}-->
                    <!--{/if}-->
				</td>
				<td class="centertd">
					<!--{if !$smarty.section.cnt.first}-->
						<div class="btn_fv"><a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('delete', 'other_deliv_id', '<!--{$arrAddr[cnt].other_deliv_id}-->'); return false">削除</a></div>
					<!--{/if}-->
				</td>
			</tr>
			<!--{/section}-->
		</table>
	<!--▲お届け先の指定-->

	<!--▼お支払い方法-->
	<div class="payarea">
		<div class="subhead">
			<h3 class="t_method" id = "payment_method">お支払方法の指定</h3>
        </div>
        <!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable && $chosen_payment_amazon_pay_v2}-->
        <button type="button" id="AmazonPayChangePaymentButton">AmazonPayお支払方法変更</button><!--{amazon_pay_change_address_button button_id='AmazonPayChangePaymentButton' action='changePayment'}-->
        <!--{else}-->
        <p>お支払方法をご選択ください。</p>
        <!--{/if}-->
		<!--{assign var=key value="payment_id"}-->
		<!--{if $arrErr[$key] != ""}-->
			<p class="attention"><!--{$arrErr[$key]}--></p>
		<!--{/if}-->
		<table summary="お支払方法選択">
<!--{* お支払方法をプルダウンにしたい場合は、下記のコメントアウトを外し、ラジオボタンのタグを削除してください *}-->
<!--{* ▼お支払方法プルダウン開始▼ *}-->
<!--{*
			<tr>
				<th width="100">選択</th>
				<th <!--{if $img_exist_flg}--> colspan="2"<!--{/if}-->></th>
			</tr>
			<tr>
				<td style="border: none;">
					<select name="payment_id" onChange="fnModeSubmit('payment', '#_url', '<!--{$smarty.server.PHP_SELF|escape:javascript}-->#payment_method');return;">
						<option value="">選択してください</option>
							<!--{section name=cnt loop=$arrPayment}-->
								<option value="<!--{$arrPayment[cnt].payment_id|escape}-->" id="pay_<!--{$smarty.section.cnt.iteration|escape}-->" <!--{$arrPayment[cnt].payment_id|sfGetSelected:$arrForm[$key].value|escape}--> ><!--{$arrPayment[cnt].payment_method|escape}--><!--{if $arrPayment[cnt].note != ""}--><!--{/if}--></option>
							<!--{/section}-->
					</select>
					<!--{section name=cnt loop=$arrPayment}-->
						<!--{if $arrForm[$key].value == $arrPayment[cnt].payment_id}-->
							<td width="500px" style="border: none;">
								<label for="pay_<!--{$smarty.section.cnt.iteration|escape}-->"><!--{if $arrPayment[cnt].note != ""}--><!--{/if}--></label>
								<br/>
								<!--{if $reg_get == 1 && $arrPayment[cnt].memo03 == '###'}-->
									<em><!--{$arrPayment[cnt].payment_affairs_regular|escape|nl2br}--></em>
								<!--{else}-->
									<em><!--{$arrPayment[cnt].payment_affairs|escape|nl2br}--></em>
								<!--{/if}-->
							</td>
							<!--{if $img_exist_flg}-->
								<!--{if $arrPayment[cnt].payment_image != ""}-->
									<td>
										<img src="<!--{$smarty.const.IMAGE_SAVE_URL|escape}--><!--{$arrPayment[cnt].payment_image|escape}-->" />
									</td>
								<!--{/if}-->
							<!--{/if}-->
						<!--{/if}-->
					<!--{/section}-->
				</td>
			</tr>
*}-->
<!--{* ▲お支払方法プルダウン終了▲ *}-->
<!--{* ▼お支払方法ラジオボタン開始▼ *}-->
			<tr>
				<th width="100">選択</th>
				<th <!--{if $img_exist_flg}--> colspan="2"<!--{/if}-->>お支払方法</th>
			</tr>
			<!--{section name=cnt loop=$arrPayment}-->
			<tr>
				<td class="centertd">
					<input type="radio" id="pay_<!--{$smarty.section.cnt.iteration}-->" name="<!--{$key|escape}-->" onclick="fnModeSubmit('payment', '#_url', '<!--{$smarty.server.PHP_SELF|escape:javascript}-->#payment_method');return;" value="<!--{$arrPayment[cnt].payment_id|escape}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" <!--{$arrPayment[cnt].payment_id|sfGetChecked:$arrForm[$key].value}-->>
				</td>
				<td <!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable && $chosen_payment_amazon_pay_v2}-->class="centertd"<!--{/if}--> width="500px">
                    <label for="pay_<!--{$smarty.section.cnt.iteration}-->"><!--{$arrPayment[cnt].payment_method|escape}--><!--{if $arrPayment[cnt].note != ""}--><!--{/if}--></label>
                    <br />
					<!--{if $reg_get == 1 && $arrPayment[cnt].memo03 == '###'}--><!--{* 定期購入クレジット *}-->
						<em><!--{$arrPayment[cnt].payment_affairs_regular|escape|nl2br}--></em>
					<!--{else}-->
						<em><!--{$arrPayment[cnt].payment_affairs|escape|nl2br}--></em>
					<!--{/if}-->
				</td>
				<!--{if $img_exist_flg}-->
					<!--{if $arrPayment[cnt].payment_image != ""}-->
						<td>
							<img src="<!--{$smarty.const.IMAGE_SAVE_URL}--><!--{$arrPayment[cnt].payment_image}-->" />
						</td>
					<!--{else}-->
						<td>
							&nbsp;
						</td>
					<!--{/if}-->
				<!--{/if}-->
			</tr>
			<!--{/section}-->
<!--{* ▲お支払方法ラジオボタン終了▲ *}-->
		</table>
	</div>
	<!--▲お支払い方法-->

	<!--▼お届け時間の指定-->
	<div class="payarea02">
		<div class="subhead">
			<h3 class="t_time">お届け時間の指定</h3>
		</div>
		<p class="mgb10">ご希望の方は、お届け時間を選択してください。</p>
          <div>
			<!--{if $reg_get != 1}-->
				<!--★配達日指定★-->
				<!--{assign var=key value="deliv_date"}-->
				<span class="attention">
					<!--{$arrErr[$key]}-->
				</span>
				<span class="pdr14"><em><!--{$arrDelivDateDisplay.deliv_date_display}--></em></span>
				<!--{if !$arrDelivDate}-->
					ご指定頂けません。
				<!--{else}-->
					<div class="custom-selectbox w15">
                        <select name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
                            <option value="" selected="">指定なし</option>
                            <!--{html_options options=$arrDelivDate selected=$arrForm[$key].value}-->
                        </select>
                    </div>
				<!--{/if}-->
                <!--{else}-->
                    <input type='hidden' name='deliv_date' value=''>
                <!--{/if}-->
                <!--{assign var=key value="deliv_time_id"}-->
                <div class="attention"><!--{$arrErr[$key]}--></div>
            </div>

            <div class="mgt10">
                <span><em>お届け時間指定：</em></span>
                 <div class="custom-selectbox w15">
                    <select name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
                    <option value="" selected="">指定なし</option>
                    <!--{html_options options=$arrDelivTime selected=$arrForm[$key].value}-->
                    </select>
                </div>
            </div>
	</div>
	<!--▲お届け時間の指定-->
	<!--▼その他問い合わせ-->
	<div class="payarea02">
		<div class="subhead">
			<h3 class="t_e_contact">その他お問い合わせ</h3>
		</div>
		<p class="mgb10">その他お問い合わせ事項がございましたら、こちらにご入力ください。</p>
		<div>
			<!--★その他お問い合わせ事項★-->
			<!--{assign var=key value="message"}-->
			<span class="attention">
				<!--{$arrErr[$key]}-->
			</span>
			<textarea name="<!--{$key}-->"  style="<!--{$arrErr[$key]|sfGetErrorColor}-->" cols="80" rows="8" class="area660" wrap="head"><!--{$arrForm[$key].value|escape}--></textarea>
			<span class="attention"> （<!--{$smarty.const.LTEXT_LEN}-->文字まで）</span>
		</div>
	</div>
	<!--▲その他問い合わせ-->

		<!-- ▼ポイント使用 ここから -->
		<!--{if $point_flg != 2 and $reg_get != 1 && !$use_code_coupon}-->
			<!--{if $tpl_login == 1}-->
				<div class="pointarea">
                        <div class="subhead">
                            <h3 class="t_point">ポイント使用の指定</h3>
                        </div>
                        <p>
                            <span class="attention">1ポイントを1円</span>として使用する事ができます。<br />
                            使用する場合は、「ポイントを使用する」にチェックを入れた後、使用するポイントをご記入ください。
                        </p>
                        <div class="bd_solid">

                                <ul class="use_point_area">
                                    <li> <p class="allbg_blue"><b>使用可能ポイント:<span class="price"><!--{$tpl_available_point|default:0}-->Pt</span></b> </p></li>
                                    <li>
                                        <input type="radio" id="point_on" name="point_check" value="1" <!--{$arrForm.point_check.value|sfGetChecked:1}--> onclick="fnCheckInputPoint();" />
                                        <label for="point_on"><b>ポイントを使用する</b></label>
                                        <!--{assign var="key" value="use_point"}-->
                                        <div class="mgt10 psl30">
                                            今回のお買い物で、
                                            <input type="text" name="use_point" id="use_point" value="<!--{$arrForm.use_point.value|default:0}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="6" class="box65" />
                                            &nbsp;ポイントを使用する。
                                            <br /><span class="attention"><!--{$arrErr[$key]}--></span>
                                        </div>
                                    </li>
                                    <li>
                                        <input type="radio" id="point_off" name="point_check" value="2" <!--{$arrForm.point_check.value|sfGetChecked:2}--> onclick="fnCheckInputPoint();document.getElementById('use_point').value='0';" />
                                        <label for="point_off"><b>ポイントを使用しない</b></label>
                                    </li>
                                </ul>

                            <div class="bd_dash fl_r" style="height:150px;">
                                <p>
                                    <!--{$objCustomer->getValue('name01')|escape}--> <!--{$objCustomer->getValue('name02')|escape}-->様<bR />
                                </p>
                                <div class="allbg_gray mgtb10">
                                    <p>現在の所持ポイント:「<span class="price"><!--{$tpl_user_point|default:0}-->Pt</span>」</p>
                                    <p>今回ご購入合計金額：<span class="price"><!--{$arrData.subtotal|number_format}-->円</span></p>
                                </div>
                                <span class="attention">（送料、手数料を含みません。）</span>

                            </div>
                        </div>

				</div>
			<!--{/if}-->
		<!--{/if}-->
		<!-- ▲ポイント使用 ここまで -->

		<!--▼ボタンエリア-->
        <div class="tblareabtn">
				<div class="btn_rpst1">
                    <span class="btn_prev"><a href="/cart/index.php">前のページへ</a><input type="hidden" name="back03" id="back03"></span>
				</div>
				<div class="btn_rpst2">
					<span class="btn_next"><a href="javascript:void(0);" onclick="document.form1.submit();">次のページへ</a></span>
				</div>
        </div>

		<!--▲ボタンエリア-->

		</form>
</div>
<!--▲お支払い方法-->

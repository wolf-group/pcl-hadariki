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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA02111-1307, USA.
 *}-->
<!--▼CONTENTS-->
<div id="shoppingcolumn">
	<div class="flowarea">
		<img src="<!--{$TPL_DIR}-->img/shopping/flow05-2.png" style="margin:0 auto;" />
	</div>

	<div class="head">
		<h2 class="t_payment">お支払い方法、お届け時間等の指定</h2>
	</div>
	<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
	<input type="hidden" name="mode" value="confirm" />
	<input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
	<div class="payarea">
		<div class="subhead">
			<h3 class="t_method">お支払方法の指定</h3>
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
				<td  style="border: none;">
					<select name="payment_id" onChange="fnModeSubmit('payment', '#_url', '<!--{$smarty.server.PHP_SELF|escape:javascript}-->#payment_method');return;">
						<option value="">選択してください</option>
							<!--{section name=cnt loop=$arrPayment}-->
								<option value="<!--{$arrPayment[cnt].payment_id|escape}-->" id="pay_<!--{$smarty.section.cnt.iteration|escape}-->" <!--{$arrPayment[cnt].payment_id|sfGetSelected:$arrForm[$key].value|escape}--> ><!--{$arrPayment[cnt].payment_method|escape}--><!--{if $arrPayment[cnt].note != ""}--><!--{/if}--></option>
							<!--{/section}-->
					</select>
					<!--{section name=cnt loop=$arrPayment}-->
						<!--{if $arrForm[$key].value == $arrPayment[cnt].payment_id}-->
							<td width="500px"  style="border: none;">
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
				<th<!--{if $img_exist_flg}--> colspan="2"<!--{/if}-->>お支払方法</th>
			</tr>
			<!--{section name=cnt loop=$arrPayment}-->
			<tr>
				<td class="centertd">
					<input type="radio" id="pay_<!--{$smarty.section.cnt.iteration}-->" name="<!--{$key}-->" onclick="fnModeSubmit('payment', '', '');" value="<!--{$arrPayment[cnt].payment_id}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" <!--{$arrPayment[cnt].payment_id|sfGetChecked:$arrForm[$key].value}--> />
				</td>
				<td>
					<label for="pay_<!--{$smarty.section.cnt.iteration}-->"><!--{$arrPayment[cnt].payment_method|escape}--><!--{if $arrPayment[cnt].note != ""}--><!--{/if}--></label>
					<br />
					<em>
						<!--{if $arrPayment[cnt].payment_affairs_regular}-->
							<!--{$arrPayment[cnt].payment_affairs_regular|escape|nl2br}-->
						<!--{else}-->
							<!--{$arrPayment[cnt].payment_affairs|escape|nl2br}-->
						<!--{/if}-->
					</em>
				</td>
				<!--{if $img_exist_flg}-->
				<!--{if $arrPayment[cnt].payment_image != ""}-->
				<td>
					<img src="<!--{$smarty.const.IMAGE_SAVE_URL}--><!--{$arrPayment[cnt].payment_image}-->" />
				</td>
				<!--{else}-->
				<td>&nbsp;</td>
				<!--{/if}-->
			<!--{/if}-->
			</tr>
			<!--{/section}-->
<!--{* ▲お支払方法ラジオボタン終了▲ *}-->
		</table>
	</div>

	<div class="payarea02">
		<div class="subhead">
			<h3 class="t_time">お届け時間の指定</h3>
		</div>
		<p class="mgb20">ご希望の方は、お届け時間を選択してください。</p>
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
                <span class="attention"><!--{$arrErr[$key]}--></span><br>
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

	<div class="payarea02">
		<div class="subhead">
			<h3 class="t_e_contact">その他お問い合わせ</h3>
		</div>
		<div class="mgb10">その他お問い合わせ事項がございましたら、こちらにご入力ください。</div>
		<div>
			<!--★その他お問い合わせ事項★-->
			<!--{assign var=key value="message"}-->
			<span class="attention"><!--{$arrErr[$key]}--></span>
			<textarea name="<!--{$key}-->"style="<!--{$arrErr[$key]|sfGetErrorColor}-->" cols="80" rows="8" class="area660" wrap="head"><!--{$arrForm[$key].value|escape}--></textarea><br>
			<span class="attention">（<!--{$smarty.const.LTEXT_LEN}-->文字まで）</span>
		</div>
	</div>

	<!-- ▼ポイント使用 ここから -->
	<!--{if $point_flg != 2 and $reg_get != 1}-->
	<!--{if $tpl_login == 1}-->
	<div class="pointarea">
		<div class="subhead">
			<h3 class="t_point">ポイント使用の指定</h3>
		</div>

		<p><span class="attention">1ポイントを1円</span>として使用する事ができます。<br />
		使用する場合は、「ポイントを使用する」にチェックを入れた後、使用するポイントをご記入ください。</p>
		<div>
			<p><!--{$objCustomer->getValue('name01')|escape}--> <!--{$objCustomer->getValue('name02')|escape}-->様の、現在の所持ポイントは「<em><!--{$tpl_user_point|default:0}-->Pt</em>」です。</p>
			<p>今回ご購入合計金額：<span class="price"><!--{$arrData.subtotal|number_format}-->円</span><span class="attention">（送料、手数料を含みません。）</span></p>
			<ul class="use_point_area">
				<li><em>使用可能ポイント: <!--{$tpl_available_point|default:0}-->Pt</em></li>
				<li><input type="radio" id="point_on" name="point_check" value="1" <!--{$arrForm.point_check.value|sfGetChecked:1}--> onclick="fnCheckInputPoint();" /><label for="point_on">&nbsp;ポイントを使用する</label></li>
				<!--{assign var=key value="use_point"}-->
				<li class="underline">今回のお買い物で、<input type="text" name="<!--{$key}-->" value="0" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="6" class="box60" />&nbsp;ポイントを使用する。<span class="attention"><!--{$arrErr[$key]}--></span></li>
				<li><input type="radio" id="point_off" name="point_check" value="2" <!--{$arrForm.point_check.value|sfGetChecked:2}--> onclick="fnCheckInputPoint();" /><label for="point_off">&nbsp;ポイントを使用しない</label></li>
			</ul>
		</div>
	</div>
	<!--{/if}-->
	<!--{/if}-->
	<!-- ▲ポイント使用 ここまで -->

	<!--Start Button Page Movie-->
   	<div class="tblareabtn">
		<div class="btn_rpst1">
			<span class="btn_prev">
				<a href="<!--{$tpl_back_url|escape}-->">前のページへ<input type="hidden" name="back03" id="back03" /></a>
			</span>
		</div>
		<div class="btn_rpst2">
			<span class="btn_next">
				<a href="javascript:void(0);" onclick="document.form1.submit();">次のページへ<input type="hidden" name="next" id="next" /></a>
			</span>
		</div>
    </div>
	<!--End Button Page Movie-->

	</form>
</div>
<!--▲CONTENTS-->


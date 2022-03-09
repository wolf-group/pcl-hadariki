<div id="shoppingcolumn">
	<div class="shopping_inner">
		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="confirm" />
			<input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
            <h2>お支払方法の指定</h2>
            <!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable && $chosen_payment_amazon_pay_v2}-->
            <button type="button" id="AmazonPayChangePaymentButton">AmazonPayお支 払方法変更</button><!--{amazon_pay_change_address_button button_id='AmazonPayChangePaymentButton' action='changePayment'}-->
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
					<td>
						<select name="payment_id" onChange="fnModeSubmit('payment', '#_url', '<!--{$smarty.server.PHP_SELF|escape:javascript}-->#payment_method');return;">
							<option value="">選択してください</option>
								<!--{section name=cnt loop=$arrPayment}-->
									<option value="<!--{$arrPayment[cnt].payment_id|escape}-->" id="pay_<!--{$smarty.section.cnt.iteration|escape}-->" <!--{$arrPayment[cnt].payment_id|sfGetSelected:$arrForm[$key].value|escape}--> ><!--{$arrPayment[cnt].payment_method|escape}--><!--{if $arrPayment[cnt].note != ""}--><!--{/if}--></option>
								<!--{/section}-->
						</select>
					</td>
				</tr>
				<!--{section name=cnt loop=$arrPayment}-->
					<!--{if $arrForm[$key].value == $arrPayment[cnt].payment_id}-->
							<label for="pay_<!--{$smarty.section.cnt.iteration|escape}-->"><!--{if $arrPayment[cnt].note != ""}--><!--{/if}--></label>
							<br/>
							<!--{if $reg_get == 1 && $arrPayment[cnt].memo03 == '###'}-->
								<tr>
									<td>
										<em><!--{$arrPayment[cnt].payment_affairs_regular|escape|nl2br}--></em>
									</td>
								</tr>
							<!--{else}-->
								<tr>
									<td>
										<em><!--{$arrPayment[cnt].payment_affairs|escape|nl2br}--></em>
									</td>
								</tr>
							<!--{/if}-->
							<!--{if $img_exist_flg}-->
								<!--{if $arrPayment[cnt].payment_image != ""}-->
								<tr>
									<td>
										<img src="<!--{$smarty.const.URL_DIR|escape}-->resize_image.php?image=<!--{$arrPayment[cnt].payment_image|escape}-->&amp;width=200" />
									</td>
								</tr>
								<!--{/if}-->
							<!--{/if}-->
					<!--{/if}-->
				<!--{/section}-->
*}-->
<!--{* ▲お支払方法プルダウン終了▲ *}-->
<!--{* ▼お支払方法ラジオボタン開始▼ *}-->
				<tr>
					<th width="50">選択</th>
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
							<!--{if $arrPayment[cnt].payment_id|sfIsPaygentCarrierAuKantanPayment}-->
							<em>
							※当サイトで初めてauかんたん決済をご利用のお客様はID連携実施のためau IDログインが必要となります。(右のロゴからはログインできません)<br /><br />
							auかんたん決済の詳細はこちらの<a href="https://id.auone.jp/payment/sp/guide/index.html" target="_blank">「auかんたん決済サービス紹介」</a>をご覧ください。
							</em>
							<!--{/if}-->
						</td>
						<!--{if $img_exist_flg}-->
							<!--{if $arrPayment[cnt].payment_id|sfIsPaygentCarrierAuKantanPayment}-->
								<td>
								<img src="<!--{$smarty.const.URL_DIR}-->img/carrier/au/aupayment/payment_100x15.jpg" /><br /><br />
								<img src="<!--{$smarty.const.URL_DIR}-->img/carrier/au/auid/logo130px_02.jpg" />
								</td>
							<!--{elseif $arrPayment[cnt].payment_image != ""}-->
								<td>
									<img src="<!--{$smarty.const.URL_DIR}-->resize_image.php?image=<!--{$arrPayment[cnt].payment_image}-->&amp;width=100" />
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
			<div class="shopping_inner">
				<h2>お届け時間の指定</h2>
				<p>ご希望の方は、お届け時間を選択してください。</p>
					<!--{if $reg_get != 1}-->
						<!--★配達日指定★-->
						<!--{assign var=key value="deliv_date"}-->
						<span class="attention"><!--{$arrErr[$key]}--></span>
						<em><!--{$arrDelivDateDisplay.deliv_date_display}--></em>
						<!--{if !$arrDelivDate}-->
							ご指定頂けません。
						<!--{else}-->
							<select name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
								<option value="" selected="">指定なし</option>
								<!--{html_options options=$arrDelivDate selected=$arrForm[$key].value}-->
							</select>
						<!--{/if}-->
					<!--{else}-->
						<input type='hidden' name='deliv_date' value=''>
					<!--{/if}-->
					<br />
					<!--{assign var=key value="deliv_time_id"}-->
					<span class="attention"><!--{$arrErr[$key]}--></span>
					<em>お届け時間指定：</em>
					<select name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
						<option value="" selected="">指定なし</option>
						<!--{html_options options=$arrDelivTime selected=$arrForm[$key].value}-->
					</select>
			</div>
			<div class="shopping_inner">
				<h2>その他お問い合わせ</h2>
				<p>その他お問い合わせ事項がございましたら、こちらにご入力ください。</p>
				<div>
					<!--★その他お問い合わせ事項★-->
					<!--{assign var=key value="message"}-->
					<span class="attention"><!--{$arrErr[$key]}--></span>
					<textarea name="<!--{$key}-->"  style="<!--{$arrErr[$key]|sfGetErrorColor}-->;width:95%;" cols="34" rows="8" wrap="head"><!--{$arrForm[$key].value|escape}--></textarea>
					<br />
					<span class="attention"> （<!--{$smarty.const.LTEXT_LEN}-->文字まで）</span>
				</div>
			</div>
		<!-- ▼ポイント使用 ここから -->
		<!--{if $point_flg != 2 and $reg_get != 1}-->
			<div class="shopping_inner">
				<h2>ポイント使用の指定</h2>
				<p>
					<span class="attention">1ポイントを1円</span>として使用する事ができます。<br />
					使用する場合は、「ポイントを使用する」にチェックを入れた後、使用するポイントをご記入ください。
				</p>
				<div class="pointbox">
					<p class="left"><!--{$objCustomer->getValue('name01')|escape}--> <!--{$objCustomer->getValue('name02')|escape}-->様の、現在の所持ポイントは「<em><!--{$tpl_user_point|default:0}-->Pt</em>」です。</p>
					<p class="left">今回ご購入合計金額：<br /><span class="price"><!--{$arrData.subtotal|number_format}-->円</span><span class="attention">（送料、手数料を含みません。）</span></p>
					<ul>
						<li><em>使用可能ポイント: <!--{$tpl_available_point|default:0}-->Pt</em></li>
						<li><input type="radio" id="point_on" name="point_check" value="1" <!--{$arrForm.point_check.value|sfGetChecked:1}--> onclick="fnCheckInputPoint();" /><label for="point_on">ポイントを使用する</label></li>
						<!--{assign var=key value="use_point"}-->
						<li class="underline">今回のお買い物で、<input class="input_tx" type="text" name="<!--{$key}-->" value="0" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="6"/>&nbsp;ポイントを使用する。<span class="attention"><!--{$arrErr[$key]}--></span></li>
						<li><input type="radio" id="point_off" name="point_check" value="2" <!--{$arrForm.point_check.value|sfGetChecked:2}--> onclick="fnCheckInputPoint();" /><label for="point_off">ポイントを使用しない</label></li>
					</ul>
				</div>
			</div>
		<!--{/if}-->
		<!-- ▲ポイント使用 ここまで -->
	</form>
	<ul class="btn_area">
		<li class="prv_btn">
			<a href="<!--{$tpl_back_url|escape}-->">戻る<input type="hidden" name="back03" id="back03" /></a>
		</li>
		<li class="nx_btn">
			<a href="javascript:void(0);" onclick="document.form1.submit();">次へ<input type="hidden" name="next" id="next"/></a>
		</li>
	</ul>
</div>

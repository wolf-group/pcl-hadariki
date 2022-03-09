<!-- ▼お届け先 -->
<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
	<input type="hidden" name="mode" value="confirm" />
    <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid|escape}-->" />
    <input type="hidden" name="other_deliv_id" value="" />
    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$transactionid|escape}-->" />
	<div id="shoppingcolumn">
	<!--{if !$is_nonmember}-->
		<!--{if !$is_new_customer}-->
		<div class="shopping_inner">
            <h2>お届け先の指定</h2>
            <!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable && $chosen_payment_amazon_pay_v2}-->
                <button type="button" id="AmazonPayChangeAddressButton">AmazonPay お届け先住所変更</button><!--{amazon_pay_change_address_button button_id='AmazonPayChangeAddressButton' action='changeAddress'}-->
            <!--{else}-->
                <p>
                    下記一覧よりお届け先住所を選択して、「選択したお届け先へ」ボタンをクリックしてください。<br />
                    一覧にご希望の住所が無い場合は、「新しいお届け先を追加する」ボタンより追加登録してください。<br />
                    ※最大20件まで登録できます。
                </p>
                <!--{if $tpl_addrmax < $smarty.const.DELIV_ADDR_MAX}-->
                <ul>
                    <li class="sp_btn">
                        <!-- <a href="<!--{$smarty.const.URL_DIR}-->smp/mypage/delivery_addr_smp.php?page=<!--{$smarty.server.PHP_SELF|escape|replace:'/smp':''}-->" > -->
                        <a href="<!--{$smarty.const.URL_DIR}-->smp/mypage/delivery_addr_smp.php?page=<!--{$smarty.server.PHP_SELF|escape}-->" >
                            新しいお届け先を追加する<input type="hidden" name="addition" id="addition" />
                        </a>
                    </li>
                </ul>
                <!--{/if}-->
            <!--{/if}-->
			<!--{if $arrErr.deli != ""}-->
			<p class="attention"><!--{$arrErr.deli}--></p>
			<!--{/if}-->
			<!--{if $arrErr.deliv_check != ""}-->
			<p class="attention"><!--{$arrErr.deliv_check}--></p>
			<!--{/if}-->
			<table summary="お届け先の指定">
				<tr>
					<th width="50">選択</th>
					<th>お届け先</th>
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
						<!--{assign var=key value=$arrAddr[cnt].pref}-->
						<div>
							<!--{$arrPref[$key]}--><!--{$arrAddr[cnt].addr01|escape}--><br /><!--{$arrAddr[cnt].addr02|escape}--><br />
							<!--{$arrAddr[cnt].name01|escape}--> <!--{$arrAddr[cnt].name02|escape}-->
						</div>
						<div>
							<!--{if !$smarty.section.cnt.first}-->
								<a href="<!--{$smarty.const.URL_DIR}-->smp/mypage/delivery_addr_smp.php?page=<!--{$smarty.server.PHP_SELF|escape}-->&amp;other_deliv_id=<!--{$arrAddr[cnt].other_deliv_id}-->" >変更</a>
							<!--{/if}-->
							<!--{if !$smarty.section.cnt.first}-->
								<a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('delete', 'other_deliv_id', '<!--{$arrAddr[cnt].other_deliv_id}-->'); return false">削除</a>
							<!--{/if}-->
						</div>
						</td>
					</tr>
				<!--{/section}-->
			</table>
		</div>
		<!--{/if}-->
	<!--{/if}-->
		<!-- ▲お届け先 -->
		<!-- ▼お支払い方法 -->
		<div class="shopping_inner">
			<div class="payarea">
                <h2 id = "payment_method">お支払方法の指定</h2>
                <!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable && $chosen_payment_amazon_pay_v2}-->
                <button type="button" id="AmazonPayChangePaymentButton">AmazonPayお支払方法変更</button><!--{amazon_pay_change_address_button button_id='AmazonPayChangePaymentButton' action='changePayment'}-->
                <!--{else}-->
                <p class="mini2">お支払方法をご選択ください。</p>
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
                        <th <!--{if $img_exist_flg}--> colspan="2"<!--{/if}-->>お支払方法</th>
                    </tr>
                    <!--{section name=cnt loop=$arrPayment}-->
                        <tr>
                            <td class="centertd">
                                <input type="radio" id="pay_<!--{$smarty.section.cnt.iteration}-->" name="<!--{$key}-->" onclick="fnModeSubmit('payment', '#_url', '<!--{$smarty.server.PHP_SELF|escape}-->#payment_method');" value="<!--{$arrPayment[cnt].payment_id}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" <!--{$arrPayment[cnt].payment_id|sfGetChecked:$arrForm[$key].value}--> />
                            </td>
                            <td>
                                <label for="pay_<!--{$smarty.section.cnt.iteration|escape}-->"><!--{$arrPayment[cnt].payment_method|escape}--><!--{if $arrPayment[cnt].note != ""}--><!--{/if}--></label>
                                <!--{if $reg_get == 1 && $arrPayment[cnt].memo03 == '###'}--><!--{* 定期購入クレジット *}-->
                                    <div><em><!--{$arrPayment[cnt].payment_affairs_regular|escape|nl2br}--></em></div>
                                    <!--{if $img_exist_flg}-->
                                        <!--{if $arrPayment[cnt].payment_image != ""}-->
                                            <div><img src="<!--{$smarty.const.URL_DIR|escape}-->resize_image.php?image=<!--{$arrPayment[cnt].payment_image|escape}-->&amp;width=200" /></div>
                                        <!--{else}-->
                                        <!--{/if}-->
                                    <!--{/if}-->
                                <!--{else}-->
                                    <div><em><!--{$arrPayment[cnt].payment_affairs|escape|nl2br}--></em></div>
                                    <!--{if $img_exist_flg}-->
                                        <!--{if $arrPayment[cnt].payment_image != ""}-->
                                            <div><img src="<!--{$smarty.const.URL_DIR|escape}-->resize_image.php?image=<!--{$arrPayment[cnt].payment_image|escape}-->&amp;width=200" /></div>
                                        <!--{else}-->
                                        <!--{/if}-->
                                    <!--{/if}-->
                                <!--{/if}-->
                            </td>
                        </tr>
                    <!--{/section}-->
<!--{* ▲お支払方法ラジオボタン終了▲ *}-->
                </table>
			</div>
			<div class="payarea02">
				<!--<h3><img src="<!--{$TPL_DIR}-->img/shopping/subtitle02.gif" width="670" height="33" alt="お届け時間の指定" /></h3>-->
				<h2>お届け時間の指定</h2>
				<p class="mini2">ご希望の方は、お届け時間を選択してください。</p>
				<div>
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
			</div>
			<div class="payarea02">
				<h2>その他お問い合わせ</h2>
				<p class="mini2">その他お問い合わせ事項がございましたら、こちらにご入力ください。 </p>
				<div>
					<!--★その他お問い合わせ事項★-->
					<!--{assign var=key value="message"}-->
					<span class="attention"><!--{$arrErr[$key]}--></span>
					<textarea name="<!--{$key}-->"  style="<!--{$arrErr[$key]|sfGetErrorColor}-->;width:95%;" cols="34" rows="8" class="area320" wrap="head"><!--{$arrForm[$key].value|escape}--></textarea>
					<span class="attention"> （<!--{$smarty.const.LTEXT_LEN}-->文字まで）</span>
				</div>
			</div>
			<!-- ▼ポイント使用 ここから -->
			<!--{if $point_flg != 2 && $reg_get != 1 && !$use_code_coupon}-->
			<!--{if $tpl_login == 1}-->
				<div class="pointarea">
					<h2>ポイント使用の指定</h2>
					<p class="mini2">
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
							<li class="underline">今回のお買い物で、<input type="text" name="<!--{$key}-->" value="0" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="6" class="box60" />&nbsp;ポイントを使用する。<br /><span class="attention"><!--{$arrErr[$key]}--></span></li>
							<li><input type="radio" id="point_off" name="point_check" value="2" <!--{$arrForm.point_check.value|sfGetChecked:2}--> onclick="fnCheckInputPoint();" /><label for="point_off">ポイントを使用しない</label></li>
						</ul>
					</div>
				</div>
			<!--{/if}-->
			<!--{/if}-->
			<!-- ▲ポイント使用 ここまで -->
		</div>
		<!-- ▲お支払い方法 -->
		<ul class="btn_area">
			<li class="prv_btn">
				<a href="<!--{$tpl_back_url|escape}-->">戻る</a>
			</li>
			<li class="nx_btn">
				<a href="javascript:void(0);" onclick="document.form1.submit();">次へ</a>
			</li>
		</ul>
	</div>
</form>

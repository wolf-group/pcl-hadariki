<div id="shoppingcolumn">
	<!--{$add_html}-->
	<div class="shopping_inner">
		<h2>お客様情報入力</h2>
		<p>
			下記項目にご入力ください。<br />
			「<span class="attention">※</span>」印は入力必須項目です。<br />
			入力後、一番下の「確認ページへ」ボタンをクリックしてください。
		</p>
		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="nonmember_confirm" />
			<input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
			<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
			
			<div class="info_change">
				<ul>
					<li class="info_head">お名前<span class="attention">※</span></li>
					<li class="info_inner02">
						<!--{assign var=key1 value="order_name01"}-->
						<!--{assign var=key2 value="order_name02"}-->
						<span class="attention" style="color:red;"><!--{$arrErr.order_name01}--><!--{$arrErr.order_name02}--></span>
						姓&nbsp;<input class="input_tx" type="text" name="<!--{$key1}-->" size="10" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.order_name01|sfGetErrorColor}-->;"  />&nbsp;
						名&nbsp;<input class="input_tx" type="text" name="<!--{$key2}-->" size="10" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.order_name02|sfGetErrorColor}-->;"  />
					<li class="info_head">お名前(ﾌﾘｶﾞﾅ)<span class="attention">※</span></li>
					<li class="info_inner02">
						<!--{assign var=key1 value="order_kana01"}-->
						<!--{assign var=key2 value="order_kana02"}-->
						<span class="attention" style="color:red;"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
						ｾｲ&nbsp;<input class="input_tx" type="text" name="<!--{$key1}-->" size="8" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.order_kana01|sfGetErrorColor}-->;" />&nbsp;
						ﾒｲ&nbsp;<input class="input_tx" type="text" name="<!--{$key2}-->" size="8" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.order_kana02|sfGetErrorColor}-->;" />
					</li>
					<li class="info_head">郵便番号<span class="attention">※</span></li>
					<li class="info_inner02">
						<!--{assign var=key1 value="order_zip01"}-->
						<!--{assign var=key2 value="order_zip02"}-->
						<span class="attention" style="color:red;"><!--{$message}--></span><br />
						<span class="attention" style="color:red;"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
						〒&nbsp;<input class="input_tx" type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$smarty.const.order_zip01_LEN}-->" style="<!--{$arrErr.order_zip01|sfGetErrorColor}-->;" size="6" inputmode="numeric"/>&nbsp;-&nbsp;<input class="input_tx" type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$smarty.const.order_zip02_LEN}-->" style="<!--{$arrErr.order_zip02|sfGetErrorColor}-->;" size="6" inputmode="numeric"/>&nbsp;
						<p class="zipimg">
							<input type="image" src="<!--{$TPL_DIR}-->img/common/address.gif" alt="住所自動入力" name = "mode" value = "address" onclick="document.form1.mode.value='address';" /><br />
							郵便番号を入力後、クリックしてください。
						</p>
					</li>
					<li class="info_head">住所<span class="attention">※</span></li>
					<li class="info_inner02">
						<!--{assign var=key value="order_pref"}-->
						<span class="attention" style="color:red;"><!--{$arrErr.order_pref}--><!--{$arrErr.order_addr01}--><!--{$arrErr.order_addr02}--></span>
						<select name="order_pref" style="<!--{$arrErr.order_pref|sfGetErrorColor}-->">
							<option value="" selected="selected">都道府県を選択</option>
							<!--{html_options options=$arrPref selected=$arrForm[$key].value}-->
						</select>
						<p style="margin:5px 0;">
							<!--{assign var=key value="order_addr01"}-->
							<input class="input_tx" type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|escape}-->" style="<!--{$arrErr.order_addr01|sfGetErrorColor}-->;" /><br />
							<!--{$smarty.const.SAMPLE_ADDRESS1}-->
						</p>
						<p style="margin:5px 0;">
							<!--{assign var=key value="order_addr02"}-->
							<input class="input_tx" type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|escape}-->" style="<!--{$arrErr.order_addr02|sfGetErrorColor}-->;"/><br />
							<!--{$smarty.const.SAMPLE_ADDRESS2}-->
						</p>
						<p style="margin:5px 0;"><em>住所は2つに分けてご記入いただけます。マンション名は必ず記入してください。</em></p>
					</li>
					<li class="info_head">電話番号<span class="attention">※</span></li>
					<li class="info_inner02">
						<!--{assign var=key1 value="order_tel01"}-->
						<!--{assign var=key2 value="order_tel02"}-->
						<!--{assign var=key3 value="order_tel03"}-->
						<span class="attention" style="color:red;"><!--{$arrErr.order_tel01}--><!--{$arrErr.order_tel02}--><!--{$arrErr.order_tel03}--></span>
						<input class="input_tx" type="text" name="<!--{$arrForm[$key1].keyname}-->" size="6" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.order_tel01|sfGetErrorColor}-->;" inputmode="numeric"/>&nbsp;-
						<input class="input_tx" type="text" name="<!--{$arrForm[$key2].keyname}-->" size="6" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.order_tel02|sfGetErrorColor}-->;" inputmode="numeric"/>&nbsp;-
						<input class="input_tx" type="text" name="<!--{$arrForm[$key3].keyname}-->" size="6" value="<!--{$arrForm[$key3].value|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.order_tel03|sfGetErrorColor}-->;" inputmode="numeric"/>
					</li>
					<li class="info_head">FAX</li>
					<li class="info_inner02">
						<span class="attention" style="color:red;"><!--{$arrErr.order_fax01}--><!--{$arrErr.order_fax02}--><!--{$arrErr.order_fax03}--></span>
						<input class="input_tx" type="text" name="order_fax01" size="6" value="<!--{$order_fax01|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->"  style="<!--{$arrErr.order_fax01|sfGetErrorColor}-->;" inputmode="numeric"/>&nbsp;-&nbsp;
						<input class="input_tx" type="text" name="order_fax02" size="6" value="<!--{$order_fax02|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.order_fax02|sfGetErrorColor}-->;" inputmode="numeric"/>&nbsp;-&nbsp;
						<input class="input_tx" type="text" name="order_fax03" size="6" value="<!--{$order_fax03|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.order_fax03|sfGetErrorColor}-->;" inputmode="numeric"/>
					</li>
					<li class="info_head">メールアドレス<span class="attention">※</span></li>
					<li class="info_inner02">
						<!--{assign var=key value="order_email"}-->
						<span class="attention" style="color:red;"><!--{$arrErr[$key]}--></span>
						<input class="inout_tx" type="text" name="<!--{$arrForm[$key].keyname}-->" value="<!--{$arrForm[$key].value|escape}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="40" inputmode="email"/><br />
						<br />
						<!--{assign var=key value="order_email_check"}-->
						<span class="attention" style="color:red;"><!--{$arrErr[$key]}--></span>
						<input class="inout_tx" type="text" name="<!--{$arrForm[$key].keyname}-->" value="<!--{$arrForm[$key].value|escape}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="40" inputmode="email"/><br />
						<p class="mini"><em>確認のため2度入力してください。</em></p>
					</li>
					<li class="info_head">性別</li>
					<li class="info_inner02">
						<!--{assign var=key value="order_sex"}-->
						<span class="attention" style="color:red;"><!--{$arrErr[$key]}--></span>
						<!--{if $arrErr[$key]}-->
							<!--{assign var=err value="background-color: `$smarty.const.ERR_COLOR`"}-->
						<!--{/if}-->
						<!--{html_radios name="$key" options=$arrSex selected=$arrForm[$key].value style="$err" label_ids=true}-->
					</li>
					<li class="info_head">職業</li>
					<li class="info_inner02">
						<!--{assign var=key value="order_job"}-->
						<!--{if $arrErr[$key]}-->
							<!--{assign var=err value="background-color: `$smarty.const.ERR_COLOR`"}-->
						<!--{/if}-->
						<select name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
							<option value="">選択して下さい</option>
							<!--{html_options options=$arrJob selected=$arrForm[$key].value}-->
						</select>
					</li>
					<li class="info_head">生年月日</li>
					<li class="info_inner02">
						<span class="attention" style="color:red;"><!--{$arrErr.year}--><!--{$arrErr.month}--><!--{$arrErr.day}--></span>
						<select name="year" style="<!--{$arrErr.year|sfGetErrorColor}-->">
							<!--{html_options options=$arrYear selected=$arrForm.year.value}-->
						</select>年
						<select name="month" style="<!--{$arrErr.year|sfGetErrorColor}-->">
							<option value="">--</option>
							<!--{html_options options=$arrMonth selected=$arrForm.month.value}-->
						</select>月
						<select name="day" style="<!--{$arrErr.year|sfGetErrorColor}-->">
							<option value="">--</option>
							<!--{html_options options=$arrDay selected=$arrForm.day.value}-->
						</select>日
					</li>
				</ul>
			</div>
			
			<div class="info_change" style="margin-top:20px;">
				<ul>
					<li class="info_head">
						<!--{assign var=key value="deliv_check"}-->
						<input type="checkbox" name="<!--{$key}-->" value="1" onclick="fnCheckInputDeliv();" <!--{$arrForm[$key].value|sfGetChecked:1}--> id="deliv_label" />
						<label for="deliv_label"><em>配送先を指定</em></label>
					</li>
					<li class="info_inner02">
						<label for="deliv_label">※上記に入力されたご住所と同一の場合は省略可能です。</label>
					</li>
				</ul>
				<ul>
					<li class="info_head">お名前<span class="attention">※</span></li>
					<li class="info_inner02">
						<!--{assign var=key1 value="deliv_name01"}-->
						<!--{assign var=key2 value="deliv_name02"}-->
						<span class="attention" style="color:red;"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
						姓&nbsp;<input class="input_tx" type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="10"/>&nbsp;
						名&nbsp;<input class="input_tx" type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" size="10"/>
					</li>
				</ul>
				<ul>
					<li class="info_head">お名前（ﾌﾘｶﾞﾅ）<span class="attention">※</span></li>
					<li class="info_inner02">
						<!--{assign var=key1 value="deliv_kana01"}-->
						<!--{assign var=key2 value="deliv_kana02"}-->
						<span class="attention" style="color:red;"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
						ｾｲ&nbsp;<input class="input_tx" type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="10" />&nbsp;
						ﾒｲ&nbsp;<input class="input_tx" type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" size="10" />
					</li>
				</ul>
				<ul>
					<li class="info_head">郵便番号<span class="attention">※</span></li>
					<li class="info_inner02">
						<!--{assign var=key1 value="deliv_zip01"}-->
						<!--{assign var=key2 value="deliv_zip02"}-->
						<span class="attention" style="color:red;"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
						<p>
							〒&nbsp;<input class="input_tx" type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="6"/>&nbsp;-&nbsp;<input class="input_tx" type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" size="6"/>&nbsp;
						</p>
						<p class="zipimg">
							<input type="image" src="<!--{$TPL_DIR}-->img/common/address.gif" alt="住所自動入力" name = "mode" value = "address2" onclick="document.form1.mode.value='address2';" /><br />
							郵便番号を入力後、クリックしてください。
						</p>
					</li>
				</ul>
				<ul>
					<li class="info_head">住所<span class="attention">※</span></li>
					<li class="info_inner02">
						<!--{assign var=key value="deliv_pref"}-->
						<span class="attention" style="color:red;"><!--{$arrErr.deliv_pref}--><!--{$arrErr.deliv_addr01}--><!--{$arrErr.deliv_addr02}--></span>
						<select name="deliv_pref" style="<!--{$arrErr.deliv_pref|sfGetErrorColor}-->">
							<option value="" selected="selected">都道府県を選択</option>
							<!--{html_options options=$arrPref selected=$arrForm[$key].value}-->
						</select>
						<p style="margin:5px 0;">
							<!--{assign var=key value="deliv_addr01"}-->
							<input class="input_tx" type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|escape}-->" style="<!--{$arrErr.deliv_addr01|sfGetErrorColor}-->;" /><br />
							<!--{$smarty.const.SAMPLE_ADDRESS1}-->
						</p>
						<p style="margin:5px 0;">
							<!--{assign var=key value="deliv_addr02"}-->
							<input class="input_tx" type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|escape}-->" style="<!--{$arrErr.deliv_addr02|sfGetErrorColor}-->;"/><br />
							<!--{$smarty.const.SAMPLE_ADDRESS2}-->
						</p>
						<p style="margin:5px 0;"><em>住所は2つに分けてご記入いただけます。マンション名は必ず記入してください。</em></p>
					</li>
				</ul>
				<ul>
					<li class="info_head">電話番号<span class="attention">※</span></li>
					<li class="info_inner02">
						<!--{assign var=key1 value="deliv_tel01"}-->
						<!--{assign var=key2 value="deliv_tel02"}-->
						<!--{assign var=key3 value="deliv_tel03"}-->
						<span class="attention" style="color:red;"><!--{$arrErr[$key1]}--></span>
						<span class="attention" style="color:red;"><!--{$arrErr[$key2]}--></span>
						<span class="attention" style="color:red;"><!--{$arrErr[$key3]}--></span>
						<input class="inout_tx" type="text" name="<!--{$arrForm[$key1].keyname}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="6"/> -
						<input class="inout_tx" type="text" name="<!--{$arrForm[$key2].keyname}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->"	size="6"/> -
						<input class="inout_tx" type="text" name="<!--{$arrForm[$key3].keyname}-->" value="<!--{$arrForm[$key3].value|escape}-->" maxlength="<!--{$arrForm[$key3].length}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->" size="6"/>
					</li>
				</ul>
			</div>
			
		</form>
	</div>
	<ul class="btn_area">
		<li class="nx_btn">
			<a href="javascript:void(0);" onclick="document.form1.submit();">次へ<input type="hidden" name="next" id="next" /></a>
		</li>
	</ul>
</div>
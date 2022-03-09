<div id="shoppingcolumn">
	<div class="shopping_inner">
		<h2>お届け先の指定</h2>
		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="customer_addr" />
			<input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
			<input type="hidden" name="other_deliv_id" value="" />
			<!--{$add_html}-->
			<div class="info_change">
				<ul>
					<li class="info_head">メールアドレス<span class="attention">※</span></li>
					<li class="info_inner02">
						<span class="attention"><!--{$arrErr.order_email}--><!--{$arrErr.order_email02}--></span>
						<!--{*<div><input type="text" name="order_email" size="40" class="box380" value="<!--{$order_email|escape}-->" style="<!--{$arrErr.order_email|sfGetErrorColor}-->;" /></div>*}-->
						<!--{if $tpl_use_smp_kara_mail}-->
							<input type="hidden" name="order_email" value="<!--{$order_email|escape}-->" />
							<div><!--{$order_email|escape}--></div>
						<!--{else}-->
							<input type="text" name="order_email" value="<!--{$order_email|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="width:95%;<!--{$arrErr.order_email|sfGetErrorColor}-->;"   autocomplete="off" inputmode="email"/>&nbsp;
						<!--{/if}-->
					</li>
					<li class="info_head">お名前<span class="attention">※</span></li>
					<li class="info_inner02">
						<span class="attention"><!--{$arrErr.order_name01}--><!--{$arrErr.order_name02}--></span>
						姓&nbsp;<input class="input_tx" type="text" name="order_name01" size="10" value="<!--{$order_name01|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.order_name01|sfGetErrorColor}-->;"   autocomplete="off"/>&nbsp;
						名&nbsp;<input class="input_tx" type="text" name="order_name02" size="10" value="<!--{$order_name02|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.order_name02|sfGetErrorColor}-->;"   autocomplete="off"/>
					</li>
					<li class="info_head">お名前(ﾌﾘｶﾞﾅ)<span class="attention">※</span></li>
					<li class="info_inner02">
						<span class="attention"><!--{$arrErr.order_kana01}--><!--{$arrErr.order_kana02}--></span>
						ｾｲ&nbsp;<input class="input_tx" type="text" name="order_kana01" size="8" value="<!--{$order_kana01|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.order_kana01|sfGetErrorColor}-->;"  autocomplete="off"/>&nbsp;
						ﾒｲ&nbsp;<input class="input_tx" type="text" name="order_kana02" size="8" value="<!--{$order_kana02|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.order_kana02|sfGetErrorColor}-->;"  autocomplete="off"/>
					</li>
					<li class="info_head">郵便番号<span class="attention">※</span></li>
					<li class="info_inner02">
						<!--{assign var=key1 value="order_zip01"}-->
						<!--{assign var=key2 value="order_zip02"}-->
						<span class="attention"><!--{$message}--></span><br />
						<span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
						〒&nbsp;<input class="input_tx" type="text" name="order_zip01" value="<!--{if $order_zip01 == ""}--><!--{$arrOtherDeliv.order_zip01|escape}--><!--{else}--><!--{$order_zip01|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.order_zip01_LEN}-->" style="<!--{$arrErr.order_zip01|sfGetErrorColor}-->;" size="6"  autocomplete="off" inputmode="numeric"/>&nbsp;-&nbsp;<input class="input_tx" type="text" name="order_zip02" value="<!--{if $order_zip02 == ""}--><!--{$arrOtherDeliv.order_zip02|escape}--><!--{else}--><!--{$order_zip02|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.order_zip02_LEN}-->" style="<!--{$arrErr.order_zip02|sfGetErrorColor}-->;" size="6"  autocomplete="off" inputmode="numeric"/>&nbsp;
						<p class="zipimg">
							<input type="image" src="<!--{$TPL_DIR}-->img/common/address.gif" alt="住所自動入力" name = "mode" value = "address" onclick="document.form1.mode.value='address';" /><br />
							郵便番号を入力後、クリックしてください。
						</p>
					</li>
					<li class="info_head">住所<span class="attention">※</span></li>
					<li class="info_inner02">
						<span class="attention"><!--{$arrErr.order_pref}--><!--{$arrErr.order_addr01}--><!--{$arrErr.order_addr02}--></span>
						<select name="order_pref" style="<!--{$arrErr.order_pref|sfGetErrorColor}-->">
							<option value="" selected="selected">都道府県を選択</option>
							<!--{html_options options=$arrPref selected=$order_pref}-->
						</select>
						<p style="margin:5px 0;">
							<input class="input_tx" type="text" name="order_addr01" value="<!--{$order_addr01|escape}-->" style="<!--{$arrErr.order_addr01|sfGetErrorColor}-->;"  autocomplete="off"/><br />
							<!--{$smarty.const.SAMPLE_ADDRESS1}-->
						</p>
						<p style="margin:5px 0;">
							<input class="input_tx" type="text" name="order_addr02" value="<!--{$order_addr02|escape}-->" style="<!--{$arrErr.order_addr02|sfGetErrorColor}-->;" autocomplete="off"/><br />
							<!--{$smarty.const.SAMPLE_ADDRESS2}-->
						</p>
						<p style="margin:5px 0;"><em>住所は2つに分けてご記入いただけます。マンション名は必ず記入してください。</em></p>
					</li>
					<li class="info_head">電話番号<span class="attention">※</span></li>
					<li class="info_inner02">
							<span class="attention"><!--{$arrErr.order_tel01}--><!--{$arrErr.order_tel02}--><!--{$arrErr.order_tel03}--></span>
							<input class="input_tx" type="text" name="order_tel01" size="6" value="<!--{$order_tel01|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.order_tel01|sfGetErrorColor}-->;" autocomplete="off" inputmode="numeric"/>&nbsp;-&nbsp;<input class="input_tx" type="text" name="order_tel02" size="6" value="<!--{$order_tel02|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.order_tel02|sfGetErrorColor}-->;" autocomplete="off" inputmode="numeric"/>&nbsp;-&nbsp;<input class="input_tx" type="text" name="order_tel03" size="6" value="<!--{$order_tel03|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.order_tel03|sfGetErrorColor}-->;"  autocomplete="off" inputmode="numeric"/>

					</li>
					<li class="info_head">FAX</li>
					<li class="info_inner02">
						<span class="attention"><!--{$arrErr.order_fax01}--><!--{$arrErr.order_fax02}--><!--{$arrErr.order_fax03}--></span>
						<input class="input_tx" type="text" name="order_fax01" size="6" value="<!--{$order_fax01|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->"  style="<!--{$arrErr.order_fax01|sfGetErrorColor}-->;" autocomplete="off" inputmode="numeric"/>&nbsp;-&nbsp;<input class="input_tx" type="text" name="order_fax02" size="6" value="<!--{$order_fax02|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.order_fax02|sfGetErrorColor}-->;"  autocomplete="off" inputmode="numeric"/>&nbsp;-&nbsp;<input class="input_tx" type="text" name="order_fax03" size="6" value="<!--{$order_fax03|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.order_fax03|sfGetErrorColor}-->;" autocomplete="off" inputmode="numeric"/>
					</li>
					<!--{if !$login}-->
					<li class="info_head">性別<!--{if $req_setting.pc_sex == 'REQUIRED'}--><span class="attention">※</span><!--{/if}--></li>
					<li class="info_inner02">
						<span class="attention"><!--{$arrErr.order_sex}--></span>
						<input type="radio" name="order_sex" id="man" value="1" style="<!--{$arrErr.order_sex|sfGetErrorColor}-->" <!--{if $sex eq 1}--> checked="checked"<!--{/if}--> /><label for="man">男性</label>
						&nbsp;<input type="radio" name="order_sex" id="woman" value="2" style="<!--{$arrErr.order_sex|sfGetErrorColor}-->" <!--{if $sex eq 2}--> checked="checked"<!--{/if}--> /><label for="woman">女性</label>
						<!--{if $req_setting.pc_sex == 'OPTIONAL'}-->
							&nbsp;<input type="radio" name="order_sex" id="no_sex" value="0" style="<!--{$arrErr.order_sex|sfGetErrorColor}-->" <!--{if $sex eq 0}--> checked="checked"<!--{/if}--> /><label for="no_sex">未回答</label>
						<!--{/if}-->
					</li>
					<!--{/if}-->
					<li class="info_head">職業</li>
					<li class="info_inner02">
						<span class="attention"><!--{$arrErr.order_job}--></span>
						<select name="order_job" style="<!--{$arrErr.order_job|sfGetErrorColor}-->">
							<option value="" selected="selected">選択してください</option>
							<!--{html_options options=$arrJob selected=$job}-->
						</select>
					</li>
					<!--{if !$login}-->
					<li class="info_head">生年月日<!--{if $req_setting.pc_birth == 'REQUIRED'}--><span class="attention">※</span><!--{/if}--></li>
					<li class="info_inner02">
						<span class="attention"><!--{$arrErr.year}--><!--{$arrErr.month}--><!--{$arrErr.day}--></span>
						<select name="year" style="<!--{$arrErr.year|sfGetErrorColor}-->">
							<!--{html_options options=$arrYear selected=$year}-->
						</select>年
						<select name="month" style="<!--{$arrErr.year|sfGetErrorColor}-->">
							<option value="">--</option>
							<!--{html_options options=$arrMonth selected=$month}-->
						</select>月
						<select name="day" style="<!--{$arrErr.year|sfGetErrorColor}-->">
							<option value="">--</option>
							<!--{html_options options=$arrDay selected=$day}-->
						</select>日
					</li>
					<li class="info_head">希望するパスワード<span class="attention">※</span></li>
					<li class="info_inner02">
						<span class="mini">パスワードは購入時に必要です</span>
						<span class="attention"><!--{$arrErr.password}--><!--{$arrErr.password02}--></span>
						<div>
							<input type="password" autocorrect="off" autocapitalize="off" name="password" value="<!--{$password|escape}-->" size="15" class="box380" style="<!--{$arrErr.password|sfGetErrorColor}-->"/>
						</div>
						<p class="mini attention"><!--{$password_rule.message|escape}--></p>
						<div>
							<input type="password" autocorrect="off" autocapitalize="off" name="password02" value="<!--{$password02|escape}-->" size="15" class="box380"  style="<!--{$arrErr.password02|sfGetErrorColor}-->"/>
						</div>
						<p class="mini attention">確認のため2度入力してください。</p>
					</li>
					<!--{/if}-->
					<!--{if $arrMailCompulsionView eq "ON"}-->
						<input type="hidden" name="mailmaga_flg" id="html" value="1">
					<!--{else}-->
					<li class="info_head">メールマガジン送付について<span class="attention">※</span></li>
					<li class="info_inner02">
						<span class="attention"><!--{$arrErr.mailmaga_flg}--></span>
						<div>
							<input type="radio" name="mailmaga_flg" id="html" value="1" style="<!--{$arrErr.mailmaga_flg|sfGetErrorColor}-->" <!--{if $mailmaga_flg eq 1 || $mailmaga_flg eq 2 || $mailmaga_flg eq ""}--> checked="checked"<!--{/if}--> />
							<label for="html">受け取る</label>
						</div>
						<div>
							<input type="radio" name="mailmaga_flg" id="no" value="3" style="<!--{$arrErr.mailmaga_flg|sfGetErrorColor}-->" <!--{if $mailmaga_flg eq 3}--> checked="checked"<!--{/if}--> />
							<label for="no">受け取らない</label>
						</div>
					</li>
					<!--{/if}-->
					<li class="info_head">お届け先</li>
					<li class="info_inner02">
						<select name = "deliv">
							<!--{foreach from=$deliv_arr_select key="key" item="item" name="loop"}-->
								<option value = "<!--{$key}-->"><!--{$item}--></option>
							<!--{/foreach}-->
						</select>
					</li>
				</ul>
			</div>
		</form>
	</div>
	<ul class="btn_area">
		<li class="prv_btn">
			<a href="/smp/cart/index.php">戻る</a>
		</li>
		<li class="nx_btn">
			<a href="javascript:void(0);" onclick="document.form1.submit();">次へ</a>
		</li>
	</ul>
</div>

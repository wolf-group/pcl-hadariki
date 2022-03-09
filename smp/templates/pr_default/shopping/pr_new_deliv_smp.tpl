<style>
input,select {
	padding:8px;
	font-size: 1.2em;
}
input[type=radio]{
  display: none;
}
div,input[type=radio] + label{
	margin-bottom: 8px;
}
input[type=radio] + label{
  padding-left: 20px;
  position:relative;
  margin-right: 20px;
  padding-top: 3px;
}
input[type=radio] + label::before{
  content: "";
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  width: 15px;
  height: 15px;
  border: 1px solid #999;
  border-radius: 50%;
}
input[type=radio]:checked + label{
  font-weight: bold;
}
input[type=radio]:checked + label::after{
  content: "";
  display: block;
  position: absolute;
  top: 3px;
  left: 3px;
  width: 11px;
  height: 11px;
  background: #d01137;
  border-radius: 50%;
}
</style>
<!--{* 新購入フロー *}-->
<div id="shoppingcolumn">
	<h2>お届け先の指定</h2>
	<p>お届け先情報をご記入ください。</p>
	<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
		<input type="hidden" name="mode" value="customer_addr" />
		<input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
		<input type="hidden" name="other_deliv_id" value="" />
		<!--{$add_html}-->
		<table summary="会員登録フォーム">
			<tr>
				<th>メールアドレス<span class="attention">※</span></th>
			</tr>
			<tr>
				<td>
					<span class="attention"><!--{$arrErr.order_email}--><!--{$arrErr.order_email02}--></span>
					<!--{*<div><input type="text" name="order_email" size="40" class="box380" value="<!--{$order_email|escape}-->" style="<!--{$arrErr.order_email|sfGetErrorColor}-->;" /></div>*}-->
					<!--{if $tpl_use_smp_kara_mail}-->
						<input type="hidden" name="order_email" value="<!--{$order_email|escape}-->" />
						<div><!--{$order_email|escape}--></div>
					<!--{else}-->
						<input type="text" name="order_email" value="<!--{$order_email|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="width:95%;<!--{$arrErr.order_email|sfGetErrorColor}-->;"   autocomplete="off" inputmode="email"/>
					<!--{/if}-->
				</td>
			</tr>
			<tr>
				<th>お名前<span class="attention">※</span></th>
			</tr>
			<tr>
				<td>
					<span class="attention"><!--{$arrErr.order_name01}--><!--{$arrErr.order_name02}--></span>
					姓&nbsp;<input type="text" name="order_name01" value="<!--{$order_name01|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="width:100px;<!--{$arrErr.order_name01|sfGetErrorColor}-->;"  autocomplete="off"/>&nbsp;
					名&nbsp;<input type="text" name="order_name02" value="<!--{$order_name02|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="width:100px;<!--{$arrErr.order_name02|sfGetErrorColor}-->;"  autocomplete="off"/>
				</td>
			</tr>
			<tr>
				<th>お名前(ﾌﾘｶﾞﾅ)<span class="attention">※</span></th>
			</tr>
			<tr>
				<td>
					<span class="attention"><!--{$arrErr.order_kana01}--><!--{$arrErr.order_kana02}--></span>
					ｾｲ&nbsp;<input type="text" name="order_kana01" value="<!--{$order_kana01|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="width:100px;<!--{$arrErr.order_kana01|sfGetErrorColor}-->;" autocomplete="off"/>&nbsp;
					ﾒｲ&nbsp;<input type="text" name="order_kana02" value="<!--{$order_kana02|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="width:100px;<!--{$arrErr.order_kana02|sfGetErrorColor}-->;" autocomplete="off"/>
				</td>
			</tr>
			<tr>
				<th>郵便番号<span class="attention">※</span></th>
			</tr>
			<tr>
				<td>
					<!--{assign var=key1 value="order_zip01"}-->
					<!--{assign var=key2 value="order_zip02"}-->
					<span class="attention"><!--{$message}--></span><br />
					<span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
					〒&nbsp;<input type="text" name="order_zip01" value="<!--{if $order_zip01 == ""}--><!--{$arrOtherDeliv.order_zip01|escape}--><!--{else}--><!--{$order_zip01|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.order_zip01_LEN}-->" style="width:70px;<!--{$arrErr.order_zip01|sfGetErrorColor}-->;" class="box60"  autocomplete="off" inputmode="numeric"/>
					&nbsp;-&nbsp;
					<input type="text" name="order_zip02" value="<!--{if $order_zip02 == ""}--><!--{$arrOtherDeliv.order_zip02|escape}--><!--{else}--><!--{$order_zip02|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.order_zip02_LEN}-->" style="width:70px;<!--{$arrErr.order_zip02|sfGetErrorColor}-->;" class="box60"  autocomplete="off" inputmode="numeric"/>&nbsp;
					<p class="zipimg">
						<input type="image" src="<!--{$TPL_DIR}-->img/common/address.gif" alt="住所自動入力" name = "mode" value = "address" onclick="document.form1.mode.value='address';" /><br />
						<span class="mini">郵便番号を入力後、クリックしてください。</span>
					</p>
				</td>
			</tr>
			<tr>
				<th>住所<span class="attention">※</span></th>
			</tr>
			<tr>
				<td>
					<span class="attention"><!--{$arrErr.order_pref}--><!--{$arrErr.order_addr01}--><!--{$arrErr.order_addr02}--></span>
					<select name="order_pref" style="<!--{$arrErr.order_pref|sfGetErrorColor}-->">
						<option value="" selected="selected">都道府県を選択</option>
						<!--{html_options options=$arrPref selected=$order_pref}-->
					</select>
					<p>
						<input type="text" name="order_addr01" value="<!--{$order_addr01|escape}-->" style="width:95%;<!--{$arrErr.order_addr01|sfGetErrorColor}-->;" autocomplete="off"/><br />
						<!--{$smarty.const.SAMPLE_ADDRESS1}-->
					</p>
					<p>
						<input type="text" name="order_addr02" value="<!--{$order_addr02|escape}-->" style="width:95%;<!--{$arrErr.order_addr02|sfGetErrorColor}-->;" class="box380" autocomplete="off"/><br />
						<!--{$smarty.const.SAMPLE_ADDRESS2}-->
					</p>
					<p><em>住所は2つに分けてご記入いただけます。マンション名は必ず記入してください。</em></p>
				</td>
			</tr>
			<tr>
				<th>電話番号<span class="attention">※</span></th>
			</tr>
			<tr>
				<td>
					<span class="attention"><!--{$arrErr.order_tel01}--><!--{$arrErr.order_tel02}--><!--{$arrErr.order_tel03}--></span>
					<input type="text" name="order_tel01" value="<!--{$order_tel01|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" class="box60" style="width:50px;<!--{$arrErr.order_tel01|sfGetErrorColor}-->;"  autocomplete="off" inputmode="numeric"/>
					&nbsp;-&nbsp;
					<input type="text" name="order_tel02" value="<!--{$order_tel02|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="width:50px;<!--{$arrErr.order_tel02|sfGetErrorColor}-->;" class="box60"  autocomplete="off" inputmode="numeric"/>
					&nbsp;-&nbsp;
					<input type="text" name="order_tel03" value="<!--{$order_tel03|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="width:50px;<!--{$arrErr.order_tel03|sfGetErrorColor}-->;" class="box60"  autocomplete="off" inputmode="numeric"/>
				</td>
			</tr>
			<tr>
				<th>FAX</th>
			</tr>
			<tr>
				<td>
					<span class="attention"><!--{$arrErr.order_fax01}--><!--{$arrErr.order_fax02}--><!--{$arrErr.order_fax03}--></span>
					<input type="text" name="order_fax01" value="<!--{$order_fax01|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->"  style="width:50px;<!--{$arrErr.order_fax01|sfGetErrorColor}-->;" class="box60"  autocomplete="off" inputmode="numeric" />
					&nbsp;-&nbsp;
					<input type="text" name="order_fax02" value="<!--{$order_fax02|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="width:50px;<!--{$arrErr.order_fax02|sfGetErrorColor}-->;" class="box60"  autocomplete="off" inputmode="numeric"/>
					&nbsp&nbsp;-&nbsp;
					<input type="text" name="order_fax03" value="<!--{$order_fax03|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="width:50px;<!--{$arrErr.order_fax03|sfGetErrorColor}-->;" class="box60"  autocomplete="off" inputmode="numeric"/>
				</td>
			</tr>
			<!--{if !$login}-->
				<tr>
					<th>性別<!--{if $req_setting.pc_sex == 'REQUIRED'}--><span class="attention">※</span><!--{/if}--></th>
				</tr>
				<tr>
					<td>
						<span class="attention"><!--{$arrErr.order_sex}--></span>
						<input type="radio" name="order_sex" id="man" value="1" style="<!--{$arrErr.order_sex|sfGetErrorColor}-->" <!--{if $sex eq 1}--> checked="checked"<!--{/if}--> />
						<label for="man">男性</label>
						&nbsp;<input type="radio" name="order_sex" id="woman" value="2" style="<!--{$arrErr.order_sex|sfGetErrorColor}-->" <!--{if $sex eq 2}--> checked="checked"<!--{/if}--> />
						<label for="woman">女性</label>
						<!--{if $req_setting.pc_sex == 'OPTIONAL'}-->
							&nbsp;<input type="radio" name="order_sex" id="no_sex" value="0" style="<!--{$arrErr.order_sex|sfGetErrorColor}-->" <!--{if $sex eq 0}--> checked="checked"<!--{/if}--> />
							<label for="no_sex">未回答</label>
						<!--{/if}-->
					</td>
				</tr>
			<!--{/if}-->
			<tr>
				<th>職業</th>
			</tr>
			<tr>
				<td>
					<span class="attention"><!--{$arrErr.order_job}--></span>
					<select name="order_job" style="<!--{$arrErr.order_job|sfGetErrorColor}-->">
						<option value="" selected="selected">選択してください</option>
						<!--{html_options options=$arrJob selected=$job}-->
					</select>
				</td>
			</tr>
			<!--{if !$login}-->
				<tr>
					<th>生年月日<!--{if $req_setting.pc_birth == 'REQUIRED'}--><span class="attention">※</span><!--{/if}--></th>
				</tr>
				<tr>
					<td>
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
					</td>
				</tr>
				<!--{if 'basis-lp_only'|get_option_use_flg == true}-->
					<input type="hidden" name="password" value="<!--{$def_pas}-->"/>
					<input type="hidden" name="password02" value="<!--{$def_pas}-->"/>
				<!--{else}-->
				<tr>
					<th>希望する<br />パスワード<span class="attention">※</span></th>
				</tr>
				<tr>
					<td>
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
					</td>
				</tr>
				<!--{/if}-->
			<!--{/if}-->
<!--{captcha_form_signup_shopping_smp}-->
			<!--{if $arrMailCompulsionView eq "ON"}-->
				<input type="hidden" name="mailmaga_flg" id="html" value="1">
			<!--{else}-->
				<tr>
					<th>メールマガジン送付について<span class="attention">※</span></th>
				</tr>
				<tr>
					<td>
						<span class="attention"><!--{$arrErr.mailmaga_flg}--></span>
						<div>
							<input type="radio" name="mailmaga_flg" id="html" value="1" style="<!--{$arrErr.mailmaga_flg|sfGetErrorColor}-->" <!--{if $mailmaga_flg eq 1 || $mailmaga_flg eq 2 || $mailmaga_flg eq ""}--> checked="checked"<!--{/if}--> />
							<label for="html">受け取る</label>
						</div>
						<div>
							<input type="radio" name="mailmaga_flg" id="no" value="3" style="<!--{$arrErr.mailmaga_flg|sfGetErrorColor}-->" <!--{if $mailmaga_flg eq 3}--> checked="checked"<!--{/if}--> />
							<label for="no">受け取らない</label>
						</div>
					</td>
				</tr>
			<!--{/if}-->
			<tr>
				<th>お届け先</th>
			</tr>
			<tr>
				<td>
					<select name = "deliv">
						<!--{foreach from=$deliv_arr_select key="key" item="item" name="loop"}-->
							<option value = "<!--{$key}-->"><!--{$item}--></option>
						<!--{/foreach}-->
					</select>
				</td>
			</tr>
		</table>
	</form>
	<ul class="btn_area2">
		<li class="prv_btn2">
			<a href="/smp/cart/index.php">戻る</a>
		</li>
		<li class="nx_btn2">
			<input type="submit" onclick="document.form1.submit();" value="次へ" id="to_confirm_btn" name="send_button"/>
		</li>
	</ul>
</div>

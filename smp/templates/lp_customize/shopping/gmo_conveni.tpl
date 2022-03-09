<style type="text/css">
<!--
div#shoppingcolumn_shopping .box60 {
	width: 60px;
	padding: 2px;
	border: 1px solid #ccc;
}

div#shoppingcolumn_shopping .box120 {
	width: 120px;
	padding: 2px;
	border: 1px solid #ccc;
}
-->
</style>

<script type="text/javascript">//<![CDATA[
var send = true;
function fnCheckSubmit(mode, key, val) {
	if(send) {
		send = false;
		fnModeSubmit(mode, key, val);
		return true;
	} else {
		alert("只今、処理中です。しばらくお待ち下さい。");
		return false;
	}
}
//]]>
</script>
<div id="shoppingcolumn">
	<div class="shopping_inner">
		<h2>お支払い方法：コンビニ決済</h2>
		<!--{if $arrErr.gmo_request}-->
		<table summary="お支払い方法">
			<tr>
				<td class="lefttd">
					<p class="attention">エラーが発生しました：<!--{$arrErr.gmo_request|escape}--></p>
				</td>
			</tr>
		</table>
		<!--{/if}-->
		<table>
			<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="register" />
			<input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
			<tr>
				<th>支払先コンビニ<span class="attention">※</span></th>
			</tr>
			<tr>
				<td>
					<span class="attention"><!--{$arrErr.store_no}--></span>
					<select name="store_no" value="<!--{$arrForm.store_no.value|escape}-->" style="<!--{$arrErr.store_no|sfGetErrorColor}-->" >
						<option value="">選択して下さい</option>
						<!--{html_options options=$arrStore selected=$arrForm.store_no.value|escape}-->
					</select>
					<!--{if $ban_seven_flg}-->
						<br /><span class="attention">※ 決済金額が200円未満の場合、支払先にセブンイレブンを指定することは出来ません。</span>
					<!--{/if}-->
				</td>
			</tr>
			<tr>
				<th>お名前<span class="attention">※</span></th>
			</tr>
			<tr>
				<td>
					<span class="attention"><!--{$arrErr.conveni_name01}--></span>
					<span class="attention"><!--{$arrErr.conveni_name02}--></span>
					姓&nbsp;<input class="input_tx" type="text" name="conveni_name01" value="<!--{$arrForm.conveni_name01.value|escape}-->" maxlength="<!--{$arrForm.conveni_name01.length}-->" style="<!--{$arrErr.conveni_name01|sfGetErrorColor}-->" size="10">
						&nbsp;&nbsp;
					名&nbsp;<input class="input_tx" type="text" name="conveni_name02" value="<!--{$arrForm.conveni_name02.value|escape}-->" maxlength="<!--{$arrForm.conveni_name02.length}-->" style="<!--{$arrErr.conveni_name02|sfGetErrorColor}-->" size="10">
				</td>
			</tr>
			<tr>
				<th>お名前(ﾌﾘｶﾞﾅ)<span class="attention">※</span></th>
			</tr>
			<tr>
				<td>
					<span class="attention"><!--{$arrErr.conveni_kana01}--></span>
					<span class="attention"><!--{$arrErr.conveni_kana02}--></span>
					ｾｲ&nbsp;<input class="input_tx" type="text" name="conveni_kana01" value="<!--{$arrForm.conveni_kana01.value|escape}-->" maxlength="<!--{$arrForm.conveni_kana01.length}-->" style="<!--{$arrErr.conveni_kana01|sfGetErrorColor}-->" size="10">
					ﾒｲ&nbsp;<input class="input_tx" type="text" name="conveni_kana02" value="<!--{$arrForm.conveni_kana02.value|escape}-->" maxlength="<!--{$arrForm.conveni_kana02.length}-->" style="<!--{$arrErr.conveni_kana02|sfGetErrorColor}-->" size="10">
				</td>
			</tr>
			<tr>
				<th>電話番号<span class="attention">※</span></th>
			</tr>
			<tr>
				<td>
					<span class="attention"><!--{$arrErr.conveni_tel01}--><!--{$arrErr.conveni_tel02}--><!--{$arrErr.conveni_tel03}--></span>
					<input class="input_tx" type="text" name="conveni_tel01" value="<!--{$arrForm.conveni_tel01.value|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.conveni_tel01|sfGetErrorColor}-->" size="4" >
						&nbsp;-&nbsp;
					<input class="input_tx" type="text" name="conveni_tel02" value="<!--{$arrForm.conveni_tel02.value|escape}-->" maxlength="<!--{$arrForm.conveni_tel02.length}-->" style="<!--{$arrErr.conveni_tel02|sfGetErrorColor}-->" size="4" >
						&nbsp;-&nbsp;
						<input class="input_tx" type="text" name="conveni_tel03" value="<!--{$arrForm.conveni_tel03.value|escape}-->" maxlength="<!--{$arrForm.conveni_tel03.length}-->" style="<!--{$arrErr.conveni_tel03|sfGetErrorColor}-->" size="4" >
				</td>
			</tr>
		</table>
				<div style="margin:10px 0 0 0">
					<table>
						<tr>
							<td class="lefttd">以上の内容で間違いなければ、下記「注文を確定する」ボタンをクリックしてください。<br />
								<span class="attention">※画面が切り替るまで少々時間がかかる場合がございますが、そのままお待ちください。</span>
							</td>
						</tr>
					</table>
				</div>
			</form>
	</div>
	<ul class="btn_area">
		<li class="prv_btn">
			<a href="javascript:void(0);"  onclick="fnModeSubmit('return','',''); return false;">前のページへ戻る<input type="hidden" name="back03" id="back03" /></a>
		</li>
		<li class="nx_btn">
			<a href="javascript:void(0);" onclick="fnCheckSubmit('register', '', '');return false;" >注文を確定する<input type="hidden" name="last" id="last" /></a>
		</li>
	</ul>
</div>

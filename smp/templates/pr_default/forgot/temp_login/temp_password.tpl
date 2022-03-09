<div id="windowcolumn">
	<div class="fg_ttl">仮ログイン</div>
	<form action="<!--{$smarty.server.PHP_SELF|escape}-->?<!--{$user_token|escape}-->" method="post" name="form1">
		<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
		<input type="hidden" name="mode" value="mail_check" />
		<div id="fg_box">
			<div class="pass"><span>仮ログイン用一時パスワードを入力してください。</span>
				<p><!--★仮ログイン用一時パスワード★--><input type="password" autocorrect="off" autocapitalize="off" name="temp_password" value="" size="40" class="box310" style="<!--{$errmsg|sfGetErrorColor}-->;"></p>
<!--{if $errmsg.temp_password}-->
				<span class="attention"><!--{$errmsg.temp_password}--></span>
<!--{/if}-->
			</div>
		</div>
	</form>
	<ul class="btn_area">
		<li class="sp_btn">
			<a href="javascript:void(0);" onclick="document.form1.submit();">送信<input type="hidden" name="next" id="next" /></a>
		</li>
	</ul>
</div>

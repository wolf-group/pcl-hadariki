<div id="windowcolumn">
	<div class="fg_ttl">パスワードを忘れた方</div>
	<div class="fg_msg">
		<p><span class="ft_red">仮ログインURLを記載したメール</span>&nbsp;を「送信」致します。</p>
		<p class="attention_box">
			<span class="attention">一時パスワードを入力し、仮ログイン後に<br>パスワードを変更してください。</span>
		</p>
	</div>
	<form action="<!--{$smarty.server.PHP_SELF|escape}-->" method="post" name="form1">
		<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
		<input type="hidden" name="mode" value="mail_check" />
		<div id="fg_box">
			<div class="mail"><span>メールアドレス</span>
				<p><!--★メールアドレス入力★--><input type="text" autocorrect="off" autocapitalize="off" name="email" value="<!--{$tpl_login_email|escape}-->" size="40" class="box310" style="<!--{$errmsg|sfGetErrorColor}-->;" inputmode="email"/></p>
<!--{if $errmsg.email}-->
				<span class="attention"><!--{$errmsg.email}--></span>
<!--{/if}-->
			</div>
			<div class="pass"><span>仮ログイン用一時パスワード</span>
				<p><!--★仮ログイン用一時パスワード★--><input autocorrect="off" autocapitalize="off" type="password" name="temp_password" value="" size="40" class="box310" style="<!--{$errmsg|sfGetErrorColor}-->;"></p>
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

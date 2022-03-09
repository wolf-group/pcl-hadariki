<div id="windowcolumn">
	<h2>パスワードを忘れた方</h2>
	<p>ご登録時のメールアドレスを入力して<br />「送信」ボタンをクリックして下さい。</p>
	<p class="attention">※ 新しくパスワードを発行後、確認メールを送信致します。なお、お忘れになったパスワードはご利用できなくなりますのでご注意下さい。</p>
	<form action="<!--{$smarty.server.PHP_SELF|escape}-->" method="post" name="form1">
		<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
		<input type="hidden" name="mode" value="mail_check" />
		<p>
			<img src="<!--{$TPL_DIR}-->img/side/icon_mail.gif" width="40" height="21" alt="メールアドレス" align="middle" />&nbsp;<!--★メールアドレス入力★--><input type="text" autocorrect="off" autocapitalize="off" name="email" value="<!--{$tpl_login_email|escape}-->" size="40" class="box310" style="<!--{$errmsg|sfGetErrorColor}-->;" inputmode="email"/>
		</p>
        <!--{foreach from=$errmsg key=errKey item=errMessage}-->
            <span class="attention"><!--{$errMessage}--></span>
        <!--{/foreach}-->
	</form>
	<ul class="btn_area">
		<li class="sp_btn">
			<a href="javascript:void(0);" onclick="document.form1.submit();">送信<input type="hidden" name="next" id="next" /></a>
		</li>
	</ul>
</div>

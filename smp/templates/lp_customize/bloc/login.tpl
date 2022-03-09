<!--▼ログインここから-->
<div id="loginarea">
	<h2>ログイン</h2>
	<form name="login_form" id="login_form" method="post" action="<!--{$smarty.const.SSL_URL}-->smp/frontparts/login_check.php" onsubmit="return fnCheckLogin('login_form')">
		<input type="hidden" name="mode" value="login" />
		<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
		<input type="hidden" name="__PHPSESID" value="<!--{php}-->echo session_id();<!--{/php}-->" />
		<input type="hidden" name="url" value="<!--{$smarty.server.PHP_SELF|escape}-->" />
		<div id="login">
			<!--{if $tpl_login}-->
				<p>ようこそ<br />
				<!--{$tpl_name1|escape}--> <!--{$tpl_name2|escape}--> 様<br />
				<!--{if $point_flg != 2}-->
					所持ポイント：<span class="price"> <!--{$tpl_user_point|number_format|default:0}--> pt</span>
				<!--{/if}-->
				</p>
				<!--{if !$tpl_disable_logout}-->
					<ul>
						<li class="sp_btn">
							<a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnFormModeSubmit('login_form', 'logout', '', ''); return false;">ログアウト</a>
						</li>
					</ul>
				<!--{/if}-->
		</div>
			<!--{else}-->
				<p><img src="<!--{$TPL_DIR}-->img/icon/icon_mail.gif" width="40" height="21" alt="メールアドレス" /><input type="text" autocorrect="off" autocapitalize="off" name="login_email" class="box96" value="<!--{$tpl_login_email|escape}-->" /></p>
				<p><img src="<!--{$TPL_DIR}-->img/icon/icon_pw.gif" width="40" height="22" alt="パスワード" /><input type="password" autocorrect="off" autocapitalize="off" name="login_pass" class="box96" /></p>
<!--{captcha_form_login_bloc}-->
		</div>
				<p style="text-align:center"> <input type="checkbox" name="login_memory" value="1" align="middle" <!--{$tpl_login_memory|sfGetChecked:1}--> /> メールアドレスを記憶する</p>
				<ul>
					<li class="sp_btn">
						<a href="javascript:void(0);" onclick="document.login_form.submit();">ログイン<input type="hidden" name="subm" /></a>
					</li>
					<li class="nm_btn">
						<a href="/smp/forgot/index.php">パスワードを忘れた方はこちら</a>
					</li>
				</ul>
			<!--{/if}-->
	</form>
</div>
<!--▲ログインここまで-->

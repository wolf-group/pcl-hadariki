<!--▼ログインここから-->
<div id="bloc_head">
	<h2 class="t_login">
		ログイン
	</h2>
</div>

  <div id="loginarea">
    <form name="login_form" id="login_form" method="post" action="<!--{$smarty.const.SSL_URL}-->frontparts/login_check.php" onsubmit="return fnCheckLogin('login_form')">
      <input type="hidden" name="mode" value="login" />
      <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
      <input type="hidden" name="__PHPSESID" value="<!--{php}-->echo session_id();<!--{/php}-->" />
      <input type="hidden" name="url" value="<!--{$smarty.server.PHP_SELF|escape}-->" />
      <div id="login">
        <!--{if $tpl_login}-->
        <div class="welcome">ようこそ
          <span><!--{$tpl_name1|escape}--> <!--{$tpl_name2|escape}--></span>様<br />
          <!--{if $point_flg != 2}-->
          	現在の所持ポイントは、<div class="w_point"> <!--{$tpl_user_point|number_format|default:0}--> pt</div>
          <!--{/if}-->
        </div>
          <!--{if !$tpl_disable_logout}-->
        <p class="btn_logout">
          <a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnFormModeSubmit('login_form', 'logout', '', ''); return false;">
            ログアウト
          </a>
        </p>
       </div>
          <!--{/if}-->
        <!--{else}-->
        <p><img src="<!--{$TPL_DIR}-->img/top/icon_id.png" alt="メールアドレス" title="メールアドレス" /><input type="text" name="login_email" class="box96" value="<!--{$tpl_login_email|escape}-->" /></p>
        <p><img src="<!--{$TPL_DIR}-->img/top/icon_pass.png" alt="パスワード" title="パスワード" /><input type="password" name="login_pass" class="box96" /></p>
      </div>
        <p class="mini">
          <a href="/forgot/index.php" onclick="win01('/forgot/index.php','forget','720','640'); return false;" target="_blank"><img src="<!--{$TPL_DIR}-->img/icon/icon_sh.png" alt="" title="" />パスワードを忘れた方はこちら</a>
		  <br>
			<img src="<!--{$TPL_DIR}-->img/icon/icon_sh.png" alt="" title="" /><input type="checkbox" name="login_memory" value="1" <!--{$tpl_login_memory|sfGetChecked:1}--> /><span>PCに記憶する</span>
		</p>
        <p class="btn_login">
          <a href="#" onclick="document.login_form.submit();">ログイン<input type="hidden" name="subm" /></a>
        </p>
        <!--{/if}-->
        <!--ログインフォーム-->
    </form>
  </div>
<!--▲ログインここまで-->

<div id="shoppingcolumn">
	<div class="shopping_inner">
		<h2>購入手続きへ</h2>
		<!--{if 'basis-lp_only'|get_option_use_flg == true}-->
			<p><em>【重要】購入される前に、下記ご利用規約をよくお読みください。</em></p>
		<!--{else}-->
			<h3>◆まだ会員登録されていないお客様</h3>

			<p><em>【重要】会員登録をされる前に、下記ご利用規約をよくお読みください。</em></p>
		<!--{/if}-->
		<ul>
			<li>
				<!--{if 'basis-lp_only'|get_option_use_flg == true}-->
					<a href="../entry/kiyaku_smp.php">規約を読む</a>
				<!--{else}-->
					<a href="../entry/kiyaku_smp.php">会員登録規約</a>
				<!--{/if}-->
			</li>
		</ul>
		<p style="font-size:11px;">
			※規約には、本サービスを使用するに当たってのあなたの権利と義務が規定されております。
		</p>
		<!--{if $tpl_use_smp_kara_mail}-->
			<div style="margin:5px;">
				<p>以下の<span style="color:#0000ff;font-weight:bold;">「空メール送信」</span>ボタンをクリックして<em>空メールを送信</em>していただきますと､こちらから返信メールが届きます。<br />
					<em>返信メール本文中のURLをクリック</em>して次の手続きへとお進み下さい。<br />
					<br />
					空メール送信後<em><!--{$smarty.const.EXTEND_COOKIE_EXPIRE_HOUR}-->時間以内</em>に返信メール本文中のURLをクリックしていただきますようお願い致します。
					<br />
					返信メールが届かない場合、<em>迷惑メール</em>として振り分けられている可能性もございます。<br />
					<br />
					システム側からのメールが届かない場合は<span style="color:#0000ff;font-weight:bold;"><a href="../entry/mail_help.php">こちら</a></span>をご参照下さい。
				</p>
			</div>
		<!--{/if}-->
		<ul>
			<li class="sp_btn">
				<!--{if 'basis-lp_only'|get_option_use_flg == true}-->
					<a href="/smp/shopping/deliv_smp.php?sp=<!--{$session}-->">購入手続きへ</a>
				<!--{else}-->
					<!--{if $tpl_use_smp_kara_mail}-->
						<a href="mailto:smp_reg@<!--{$smarty.const.MOBILE_KARA_MAIL_ADDRESS_DOMAIN}-->?subject=<!--{'そのまま送信してください。'|urlencode}-->&body=<!--{$session}-->%0D%0A%0D%0A<!--{$test|urlencode}-->">
						空メール送信<input type="hidden" name="log" id="log" /></a>
					<!--{else}-->
						<a href="/smp/shopping/deliv_smp.php">会員登録</a>
					<!--{/if}-->
				<!--{/if}-->
			</li>
		</ul>
		<!--{if 'basis-lp_only'|get_option_use_flg == false}-->
		<div style="padding-top:10px;">
			<!--{if $reg_get != 1}-->
			<form name="member_form2" id="member_form2" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="nonmember" />
			<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
			<ul>
				<li class="sp_btn">
					<span class="btn_next">
						<a href="javascript:void(0);" onclick="document.member_form2.submit();">購入手続きへ<input type="hidden" name="buystep" id="buystep" /></a>
					</span>
				</li>
			</ul>
			</form>
			<!--{/if}-->

		</div>
		<!--{/if}-->
	</div>
	<!--{if 'basis-lp_only'|get_option_use_flg == false}-->
	<div class="shopping_inner">
		<h2>ログイン</h2>
		<!--{if $reg_get != 1}-->
			<form name="member_form" id="member_form" method="post" action="<!--{$smarty.const.SSL_URL}-->smp/shopping/deliv_smp.php" onsubmit="return fnCheckLogin('member_form')">
		<!--{else}-->
			<form name="member_form" id="member_form" method="post" action="<!--{$smarty.const.SSL_URL}-->smp/shopping/input_day.php" onsubmit="return fnCheckLogin('member_form')">
		<!--{/if}-->
			<div class="in_loginarea">
				<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
				<h3>◆会員登録がお済みのお客様</h3>
				<p>会員の方は、登録時に入力されたメールアドレスとパスワードでログインしてください。</p>
				<input type="hidden" name="mode" value="login" />
				<div class="inputbox">
					<!--{assign var=key value="login_email"}--><span class="attention"><!--{$arrErr[$key]}--></span>
					<p>
						<img src="<!--{$TPL_DIR}-->img/side/icon_mail.gif" width="40" height="21" alt="メールアドレス"  align="middle" /><input class="input_tx" type="text" name="<!--{$key}-->" value="<!--{$tpl_login_email|escape}-->" maxlength="<!--{$arrForm[$key].length}-->" style="width:220px;<!--{$arrErr[$key]|sfGetErrorColor}-->;" inputmode="email"/>
					</p>
					<p class="passwd">
						<!--{assign var=key value="login_pass"}--><span class="attention"><!--{$arrErr[$key]}--></span>
						<img src="<!--{$TPL_DIR}-->img/side/icon_pw.gif" width="40" height="22" alt="パスワード" align="middle" /><input class="input_tx" type="password" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" style="width:220px;<!--{$arrErr[$key]|sfGetErrorColor}-->" />
					</p>
<!--{captcha_form_login}-->
					<p class="mini01" style="text-align:center;padding:5px 0px 0px 0px;font-size:12px">
						<input type="checkbox" name="login_memory" value="1" <!--{$tpl_login_memory|sfGetChecked:1}--> id="login_memory" />
						<label for="login_memory">メールアドレスを記憶する</label>
					</p>
				</div>
			</div>
		</form>
	</div>
	<ul>
		<li class="sp_btn">
			<a href="javascript:void(0);" onclick="document.member_form.submit();">ログイン<input type="hidden" name="log" id="log"/></a>
		</li>
	</ul>
    <!--{* LINE連携ボタンを表示したい場合はコメントアウトを外してください *}-->
    <!--
    <!--{if 'basis-line_app'|get_option_use_flg}-->
    <div>
        <a href="<!--{get_line_url|escape}-->"><img src="/img/line/line_button081_m.png" alt="LINEでログイン"/></a><br />
        <span>※ 会員登録済みのお客様で、既にLINEと連携済みのお客様は『LINEでログイン』リンクからログインして下さい。</span><br />
        <span>※ LINEログインすることにより、LINEアカウントが友だち追加されてお知らせがLINEで受け取れます。</span><br />
    </div>
    <!--{/if}-->
    -->
	<ul>
		<li class="nm_btn">
			<a href="/smp/forgot/index.php">パスワードを忘れた方はこちら</a>
		</li>
		<li class="nm_btn">
			<a href="/smp/contact/index.php">お問い合わせページ</a>
		</li>
	</ul>
	<p style="padding:5px;font-size:12px">※メールアドレスを忘れた方は、お手数ですが、お問い合わせページからお問い合わせください。</p>
	<!--{/if}-->
</div>
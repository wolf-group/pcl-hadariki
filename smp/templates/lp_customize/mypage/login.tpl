<!--▼CONTENTS-->
<div id="mypagecolumn">
	<div class="mypage_inner">
		<h2>ログイン</h2>
		<form name="login_mypage" id="login_mypage" method="post" action="./login_check.php" onsubmit="return fnCheckLogin('login_mypage')">
			<input type="hidden" name="mode" value="login" />
			<div class="mem_area">
				<h3>▶ 会員登録がお済みのお客様</h3>
				<div class="inputbox">
					<p>
						<!--{assign var=key value="mypage_login_email"}-->
						<span class="attention"><!--{$arrErr[$key]}--></span>
						<img src="<!--{$TPL_DIR}-->img/side/icon_mail.gif" width="40" height="21" alt="メールアドレス" align="middle" /><input type="text" name="<!--{$key}-->"
						value="<!--{$tpl_login_email|escape}-->"
						maxlength="<!--{$arrForm[$key].length}-->"
						style="<!--{$arrErr[$key]|sfGetErrorColor}-->;"
						size="40" class="box300"
						inputmode="email"/>
					</p>
					<p class="passwd">
						<!--{assign var=key value="mypage_login_pass"}-->
						<span class="attention"><!--{$arrErr[$key]}--></span>
						<img src="<!--{$TPL_DIR}-->img/side/icon_pw.gif" width="40" height="22" alt="パスワード" align="middle" /><input type="password" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="40" class="box300" />
					</p>
<!--{captcha_form_login}-->
					<p class="mail01" style="text-align:center">
						<!--{assign var=key value="mypage_login_memory"}-->
						<input type="checkbox" name="<!--{$key}-->" value="1" align="middle" <!--{$tpl_login_memory|sfGetChecked:1}--> id="login_memory" />
						<label for="login_memory">メールアドレスを記憶する</label>
					</p>
				</div>
				<ul>
					<li class="sp_btn">
						<a href="javascript:void(0);" onclick="document.login_mypage.submit();">ログイン<input type="hidden" name="log" id="log" /></a>
					</li>
				</ul>
				<!--{* LINE連携ボタンを表示したい場合はコメントアウトを外してください *}-->
				<!--
				<!--{if 'basis-line_app'|get_option_use_flg}-->
				※ 会員登録がお済みでLINEアカウントと連携済みのお客様は下の『LINEでログイン』ボタンからログインすることができます。<br />
				<div style="text-align:center;">
					<a href="<!--{get_line_url|escape}-->">
						<img src="/img/line/line_button081_m.png" alt="LINEでログイン" />
					</a>
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
				<p class="atention">※メールアドレスを忘れた方は、お手数ですが、お問い合わせページからお問い合わせください。</p>
			</div>

			<div class="no_mem_area">
				<h3>▶ まだ会員登録されていないお客様</h3>
			</div>
		</form>
	</div>
	<ul>
		<li class="sp_btn">
			<a href="/smp/entry/kiyaku.php">会員登録をする<input type="hidden" name="b_gotoentry" /></a>
		</li>
	</ul>
    <!--{if $amazon_pay_v1_enabled}-->
        <div id="amazon_button_area" style="padding-bottom: : 1em;">
            <p style=" margin: 12px 0 3px; padding: 4px 0 2px; background: #232f3e; text-align: center;">
                <span id="amazon_h">Amazonアカウントでログインできます</span>
            </p>
                <div id="amazon_txt">
                   Amazon.co.jp に登録している情報を使用して<br />
                    簡単に会員登録、ログインが可能です。
                </div>
            <div style="text-align:center;margin-top:8px">
                <!--{amazon_pay_button type="LwA" color="Gold" size="medium" parallel="yes"}-->
            </div>
        </div>
    <!--{/if}-->
    <!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable}-->
        <div id="amazon_button_area" style="padding-bottom: : 1em;">
            <p style=" margin: 12px 0 3px; padding: 4px 0 2px; background: #232f3e; text-align: center;">
                <span id="amazon_h">Amazonアカウントでログインできます</span>
            </p>
                <div id="amazon_txt">
                    Amazon.co.jp に登録している情報を使用して<br>
                    簡単に会員登録、ログインが可能です。<br><br>
                    <input type="checkbox" id="amazon_v2_agree" style="display:inline-block;">
                    <span>
                        <label for="amazon_v2_agree">利用する場合は<a href="/smp/entry/kiyaku_smp.php">利用規約</a>に同意して会員登録する(必須)</label>
                    </span>
                </div>
                <!--{if $precs_login_required_flg}-->
                    <br><br>
                    <em>
                        ※ 既に当サイトにて会員登録されております。<br>AmazonPay決済をご利用いただく場合は、ログインを行なった後、お手続きにお進みください。
                    </em>
                <!--{/if}-->
            <div id="amazon_pay_button_v2" style="text-align:center;margin-top:8px">
                <div id="amazon_pay_button_v2_click_area">
                    <!--{amazon_pay_button_v2 color='Gold' my=1}-->
                </div>
            </div>
        </div>
    <!--{/if}-->
</div>
<!--▲CONTENTS-->

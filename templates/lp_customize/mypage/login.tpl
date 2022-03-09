<!--{*
/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2007 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
*}-->
<!--▼CONTENTS-->
<div id="mypagecolumn">
	<div class="head">
		<h2 class="t_login">ログイン</h2>
	</div>
<!--▼Area_Cont-->
	<form name="login_mypage" id="login_mypage" method="post" action="./login_check.php" onsubmit="return fnCheckLogin('login_mypage')">
    <input type="hidden" name="mode" value="login" />
		<div class="loginarea">
			<h3 class="have">会員登録がお済みのお客様</h3>
			<p class="inputtext">会員の方は、登録時に入力されたメールアドレスとパスワードでログインしてください。</p>
			<div class="inputbox">
			<!--{assign var=key value="mypage_login_email"}-->
		   <span class="attention"><!--{$arrErr[$key]}--></span>
		   <p>メールアドレス:
				<input type="text" name="<!--{$key}-->"
                value="<!--{$tpl_login_email|escape}-->"
                maxlength="<!--{$arrForm[$key].length}-->"
                style="<!--{$arrErr[$key]|sfGetErrorColor}-->; ime-mode: disabled;"
                size="40" class="box250" />
			</p>
			<p class="passwd">
				<!--{assign var=key value="mypage_login_pass"}-->
				<span class="attention"><!--{$arrErr[$key]}--></span>
				パスワード:
				<input type="password" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="40" class="box275" />
			</p>
			<p class="mini">
				<!--{assign var=key value="mypage_login_memory"}-->
				<input type="checkbox" name="<!--{$key}-->" value="1" <!--{$tpl_login_memory|sfGetChecked:1}--> id="login_memory" />
				<label for="login_memory">会員メールアドレスをコンピューターに記憶させる</label>
			</p>
<!--{captcha_form_login}-->
		</div>

		<!--▼Button Start-->
		<ul class="btn_area_l2">
			<li class="btn">
				<span class="btn_next">
					<a href="#" onclick="document.login_mypage.submit();">ログイン<input type="hidden" name="log" id="log"/></a>
				</span>
			</li>
		</ul>
		<!--▲Button End-->
        <!--{* LINE連携ボタンを表示したい場合はコメントアウトを外してください *}-->
        <!--
        <!--{if 'basis-line_app'|get_option_use_flg}-->
        ※ 会員登録がお済みでLINEアカウントと連携済みのお客様は下の『LINEでログイン』ボタンからログインすることができます。<br />
        <div style="text-align:center;">
            <a href="<!--{get_line_url|escape}-->">
                <img src="/img/line/line_button081_m.png" alt="LINEでログイン"/>
            </a>
        </div>
        <!--{/if}-->
        -->
		<p class="inputtext02">
			パスワードを忘れた方は<a href="/forgot/index.php" onclick="win01('/forgot/index.php','forget','600','400'); return false;" target="_blank">こちら</a>からパスワードの再発行を行ってください。<br />
			メールアドレスを忘れた方は、お手数ですが、<a href="/contact/index.php">お問い合わせページ</a>からお問い合わせください。
		</p>
	</div>
	<div class="loginarea">
		<h3 class="d_have">まだ会員登録されていないお客様</h3>
		</p>
		<p class="inputtext">会員登録をすると便利なMyページをご利用いただけます。<br />
      また、ログインするだけで、毎回お名前や住所などを入力することなくスムーズにお買い物をお楽しみいただけます。
		</p>
		<!--▼Button Start-->
		<ul class="btn_area_l2">
			<li class="btn">
				<span class="btn_next">
					<a href="/entry/kiyaku.php">会員登録をする<input type="hidden" name="b_gotoentry" /></a>
				</span>
			</li>
		</ul>
		<!--▲Button End-->
	</div>

    <!--{if $amazon_pay_v1_enabled}-->
    <div style="clear:both;"></div>
    <div id="amazon_button_area" style="width:650px">
        <div style="float:left;padding-top:5px;">
            <p style="padding-bottom:3px"><span id="amazon_h">Amazonアカウントでログインできます</span></p>
            Amazon.co.jp に登録している情報を使用して<br>簡単に会員登録、ログインが可能です。<br>
        </div>
        <div style="float:right"><!--{amazon_pay_button type="LwA" color="Gold" size="large" parallel="yes"}--></div>
        <div style="clear:both;"></div>
    </div>
    <div style="clear:both;"></div>
    <!--{/if}-->
    <!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable}-->
    <div style="clear:both;"></div>
    <div id="amazon_button_area" style="width:836px;">
        <div style="float:left;padding-top:5px;">
            <p style="padding-bottom:3px"><span id="amazon_h">Amazonアカウントでログインできます</span></p>
            Amazon.co.jp に登録している情報を使って簡単にお支払いができるサービスです。<br>
            ※Amazonギフト券はご使用いただけません。<br>
            <input type="checkbox" id="amazon_v2_agree" style="display:inline-block;">
            <span>
                <label for="amazon_v2_agree">利用する場合は、<a href="javascript:void(0)" onclick="window.open('/entry/kiyaku_popup.php','', 'width=600, height=740, menubar=no, toolbar=no, scrollbars=yes');" style="color:#F60;">利用規約</a>に同意して会員登録する(必須)</label>
            </span>
            <!--{if $precs_login_required_flg}-->
                <div class="red02">
                <br><br>
                    ※ 既に当サイトにて会員登録されております。<br>AmazonPay決済をご利用いただく場合は、ログインを行なった後、お手続きにお進みください。
                </div>
            <!--{/if}-->
        </div>
        <div id="amazon_pay_button_v2" style="float:right">
            <div id="amazon_pay_button_v2_click_area">
                <!--{amazon_pay_button_v2 color='Gold' my=1}-->
            </div>
        </div>
        <div style="clear:both;"></div>
    </div>
    <!--{/if}-->
	</form>
<!--▲Area_Cont-->
</div>
<!--▲CONTENTS-->

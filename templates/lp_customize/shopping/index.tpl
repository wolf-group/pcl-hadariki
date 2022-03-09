<!--{*
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
 *}-->
<!--▼CONTENTS-->
<div id="shoppingcolumn">
	<div class="head2">
		<h2 class="t_login">
			ログイン
		</h2>
	</div>
	<!--{if $reg_get != 1}-->
	<form name="member_form" id="member_form" method="post" action="<!--{$smarty.const.SSL_URL}-->shopping/deliv.php" onsubmit="return fnCheckLogin('member_form')">
	<!--{else}-->
	<form name="member_form" id="member_form" method="post" action="<!--{$smarty.const.SSL_URL}-->shopping/input_day.php" onsubmit="return fnCheckLogin('member_form')">
	<!--{/if}-->

	<!--Have Account-->
		<div class="loginarea">
			<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
			<p class="have">会員登録がお済みのお客様</p>
			<p class="inputtext">会員の方は、登録時に入力されたメールアドレスとパスワードでログインしてください。</p>
			<input type="hidden" name="mode" value="login" />
			<div class="inputbox">
				<!--{assign var=key value="login_email"}--><span class="attention"><!--{$arrErr[$key]}--></span>
				<p>メールアドレス&nbsp;
					<input type="text" name="<!--{$key}-->"	value="<!--{$tpl_login_email|escape}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->; ime-mode: disabled;" size="40" class="box250" />
				</p>

				<p class="passwd">
						<!--{assign var=key value="login_pass"}--><span class="attention"><!--{$arrErr[$key]}--></span>
						パスワード &nbsp;<input type="password" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="40" class="box275" />
				</p>
                <p class="mini">
					<input type="checkbox" name="login_memory" value="1" <!--{$tpl_login_memory|sfGetChecked:1}--> id="login_memory" />
					<label for="login_memory">会員メールアドレスをコンピューターに記憶させる</label>
				</p>
<!--{captcha_form_login}-->
			</div>

			<ul class="btn_area_l">
				<li class="btn">
					<span class="btn_next">
						<a href="javascript:void(0);" onclick="document.member_form.submit();">ログイン<input type="hidden" name="log" id="log"/></a>
					</span>
				</li>
			</ul>
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
	</form>
	<!--Have Account-->

	<!--Dont have Account-->
	<form name="member_form2" id="member_form2" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
		<input type="hidden" name="mode" value="nonmember" />
		<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
		<div class="loginarea">
			<p class="d_have">まだ会員登録されていないお客様</p>
			<p class="inputtext">会員登録をすると便利なMyページをご利用いただけます。<br />
				また、ログインするだけで、毎回お名前や住所などを入力することなくスムーズにお買い物をお楽しみいただけます。
			</p>

			<!--Start Button Page Movie-->
			<ul class="btn_area_l">
				<li class="btn">
					<span class="btn_next">
						<a href="/entry/kiyaku.php" name="b_gotoentry">会員登録をする</a>
					</span>
				</li>
			</ul>
			<ul class="btn_area_l">
				<!--{if $reg_get != 1}-->
				<li class="btn">
					<span class="btn_next">
						<a href="javascript:void(0);" onclick="document.member_form2.submit();">購入手続きへ<input type="hidden" name="buystep" id="buystep" /></a>
					</span>
				</li>
				<!--{/if}-->
			</ul>
			<!--End Button Page Movie-->
		</div>
	</form>
	<!--Dont have Account-->

</div>
<!--▲CONTENTS-->


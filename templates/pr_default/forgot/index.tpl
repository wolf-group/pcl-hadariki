<!--{printXMLDeclaration}--><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<html xmlns="http://www.w3.org/1999/xhtml" lang="ja" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$smarty.const.CHAR_CODE}-->" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Pragma" content="no-cache">
<link rel="stylesheet" href="<!--{$TPL_DIR}-->css/common.css?<!--{$smarty.const.FRONT_CSS_VERSION}-->" type="text/css" media="all" />
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/css.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/navi.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/win_op.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/site.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<meta name="author" content="<!--{$arrPageLayout.author|escape}-->" />
<meta name="description" content="<!--{$arrPageLayout.description|escape}-->" />
<meta name="keywords" content="<!--{$arrPageLayout.keyword|escape}-->" />
<title><!--{$arrSiteInfo.shop_name}-->/パスワードを忘れた方(入力ページ)</title>
</head>

<body onload="preLoadImg('<!--{$TPL_DIR}-->')">
<a name="top" id="top"></a>

<noscript>
	<p>JavaScriptを有効にしてご利用下さい</p>
</noscript>
<div id="windowcolumn">
	<div id="windowarea">
		<div class="head">
			<h2 class="t_mypage">パスワードを忘れた方</h2>
		</div>
		<p>ご登録時のメールアドレスを入力して「送信」ボタンをクリックして下さい。<br />
		<span class="attention">※ 新しくパスワードを発行後、確認メールを送信致します。<br />なお、お忘れになったパスワードはご利用できなくなりますのでご注意下さい。</span></p>
		<form action="<!--{$smarty.server.PHP_SELF|escape}-->" method="post" name="form1">
			<input type="hidden" name="mode" value="mail_check" />
			<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
			<div id="completebox">
				<p>メールアドレス：&nbsp;<!--★メールアドレス入力★--><input type="text" name="email" value="<!--{$tpl_login_email|escape}-->" size="40" class="box300" style="<!--{$errmsg|sfGetErrorColor}-->; ime-mode: disabled;" /></p>
                <!--{foreach from=$errmsg key=errKey item=errMessage}-->
                    <span class="attention"><!--{$errMessage}--></span>
                <!--{/foreach}-->
			</div>

			<ul class="btn_area_l2">
				<li class="btn">
					<span class="btn_next"><a href="javascript:void(0);" onclick="document.form1.submit();">送信<input type="hidden" name="next" id="next" /></a></span>
				</li>
			</ul>

		</form>
	</div>
</div>
</body>
</html>


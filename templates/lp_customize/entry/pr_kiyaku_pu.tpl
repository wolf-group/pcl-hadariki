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
		<!--{$pc_front_head|smarty:nodefaults}-->
		<script type="text/javascript" src="<!--{$TPL_DIR}-->js/css.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
		<script type="text/javascript" src="<!--{$TPL_DIR}-->js/navi.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
		<script type="text/javascript" src="<!--{$TPL_DIR}-->js/win_op.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
		<script type="text/javascript" src="<!--{$TPL_DIR}-->js/site.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
		<meta name="author" content="<!--{$arrPageLayout.author|escape}-->" />
		<meta name="description" content="<!--{$arrPageLayout.description|escape}-->" />
		<meta name="keywords" content="<!--{$arrPageLayout.keyword|escape}-->" />
		<title><!--{$arrSiteInfo.shop_name}-->/ご利用規約</title>
	</head>
	<body onload="preLoadImg('<!--{$TPL_DIR}-->')">
		<a name="top" id="top"></a>
		<div id="windowcolumn">
			<div id="windowarea">
				<div class="head">
					<h2 class="t_entry">ご利用規約</h2>
				</div>
				<p>
					<em>【重要】 会員登録をされる前に、下記ご利用規約をよくお読みください。</em>
					<br />
					規約には、本サービスを使用するに当たってのあなたの権利と義務が規定されております。<br />
					「規約に同意して会員登録をする」ボタン をクリックすると、あなたが本規約の全ての条件に同意したことになります。
				</p>
				<textarea name="textfield" class="area500" cols="80" rows="30" readonly="readonly"><!--{$tpl_kiyaku_text}--></textarea>

				<ul class="btn_area_l2">
					<li class="btn">
						<span class="btn_next"><a onclick="window.close();" href="<!--{$smarty.const.URL_ENTRY_TOP}-->"> 閉じる </a></span>
					</li>
				</ul>

			</div>
		</div>
	</body>
</html>

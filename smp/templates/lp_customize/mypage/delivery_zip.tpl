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
<meta name="viewport" content="width=device-width,user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$smarty.const.CHAR_CODE}-->" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<link rel="stylesheet" href="<!--{$smarty.const.URL_DIR}--><!--{$smarty.const.USER_DIR}-->css/common.css" type="text/css" media="all" />
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/css.js"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/navi.js"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/win_op.js"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/site.js"></script>
<title><!--{$arrSiteInfo.shop_name}-->/<!--{$tpl_title|escape}--></title>
</head>

<body onload="<!--{$tpl_onload}-->">
<noscript>
  <p><em>JavaScriptを有効にしてご利用下さい.</em></p>
</noscript>

<a name="top" id="top"></a>

<!--▼CONTENTS-->
<div id="windowcolumn">
	<div id="window_inner">
		<h2>新しいお届け先の追加・変更</h2>
		<p class="windowtext">※新しいお届け先の追加・変更ができます。</p>
		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<!--{*<input type="hidden" name="mode" value="edit" />*}-->
			<input type="hidden" name="mode" value="zip" />
			<input type="hidden" name="other_deliv_id" value="<!--{$smarty.session.other_deliv_id}-->" />
			<input type="hidden" name="ParentPage" value="<!--{$ParentPage}-->" />
			<table summary="お届け先登録">
				<tr>
					<td class="tdgray">郵便番号<span class="attention">【必須】</span></td>
				</tr>
				<tr>
					<td>
						<!--{assign var=key1 value="zip01"}-->
						<!--{assign var=key2 value="zip02"}-->
						<span class="attention"><!--{$message}--></span><br />
						<span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
						<p>〒&nbsp;<input type="text" name="zip01" value="<!--{if $zip01 == ""}--><!--{$arrOtherDeliv.zip01|escape}--><!--{else}--><!--{$zip01|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.ZIP01_LEN}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->;" size="6" class="box60" inputmode="numeric"/>&nbsp;-&nbsp;<input type="text" name="zip02" value="<!--{if $zip02 == ""}--><!--{$arrOtherDeliv.zip02|escape}--><!--{else}--><!--{$zip02|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.ZIP02_LEN}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->;" size="6" class="box60" inputmode="numeric"/>&nbsp;
						<a href="http://www.post.japanpost.jp/zipcode/" target="_blank"><span class="fs10">郵便番号検索</span></a></p>
						<!--{*<p class="zipimg"><a href="<!--{$smarty.const.URL_INPUT_ZIP}-->" onclick="fnCallAddress('<!--{$smarty.const.URL_INPUT_ZIP}-->', 'zip01', 'zip02', 'pref', 'addr01'); return false;" target="_blank"><img src="<!--{$TPL_DIR}-->img/common/address.gif" width="86" height="20" alt="住所自動入力" border="0" /></a>*}-->
						<!--{*<p class="zipimg"><a href="<!--{$smarty.const.URL_INPUT_ZIP}-->" ><img src="<!--{$TPL_DIR}-->img/common/address.gif" width="86" height="20" alt="住所自動入力" border="0" /></a>*}-->
						<!--{*<input type = "submit" name = "mode" value = "住所検索"><br />*}-->
						<!--{* ▼---------------------------------------------------------------------------------------▼ *}-->
							<input type="image" onmouseover="chgImgImageSubmit('<!--{$TPL_DIR}-->img/common/address.gif',this);" onmouseout="chgImgImageSubmit('<!--{$TPL_DIR}-->img/common/address.gif',this);" src="<!--{$TPL_DIR}-->img/common/address.gif" width="86" height="20" alt="登録する" name="register" id="register" />
						<!--{* ▲---------------------------------------------------------------------------------------▲ *}-->
						<span class="mini"><br />&nbsp;郵便番号を入力後、クリックしてください。</span></p>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<ul>
		<li class="sp_btn">
			<a href="javascript:void(0);" onclick="document.form1.submit();">登録する<input type="hidden" name="register" id="register" /></a>
		</li>
	</ul>
</div>
</body>
</html>

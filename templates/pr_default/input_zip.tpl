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
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$smarty.const.CHAR_CODE|escape}-->" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Pragma" content="no-cache">
<link rel="stylesheet" href="<!--{$TPL_DIR|escape}-->css/common.css?<!--{$smarty.const.FRONT_CSS_VERSION|escape}-->" type="text/css" media="all" />
<!--{$pc_front_head|smarty:nodefaults}-->
<script type="text/javascript" src="<!--{$TPL_DIR|escape}-->js/css.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR|escape}-->js/navi.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR|escape}-->js/win_op.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR|escape}-->js/site.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->"></script>
<meta name="author" content="<!--{$arrPageLayout.author|escape}-->" />
<meta name="description" content="<!--{$arrPageLayout.description|escape}-->" />
<meta name="keywords" content="<!--{$arrPageLayout.keyword|escape}-->" />
<title><!--{$arrSiteInfo.shop_name}-->/住所検索</title>
</head>
<body onload="preLoadImg('<!--{$TPL_DIR|escape:'javascript'}-->');<!--{if $tpl_fput_addr_args != null}--> fnPutAddress('<!--{$tpl_fput_addr_args[0]|escape:'javascript'}-->', '<!--{$tpl_fput_addr_args[1]|escape:'javascript'}-->');<!--{/if}--><!--{if $tpl_restart_flag}--> window.close();<!--{/if}-->">
<noscript>
  <p>JavaScript を有効にしてご利用下さい.</p>
</noscript>
<!--▼CONTENTS-->
<div id="windowcolumn">
    <div id="windowarea">
      <div class="head">
        <h2 class="t_mypage">住所検索</h2>
      </div>
      <form name="form1" id="form1" method="post" action="">
        <input type="hidden" name="state" value="<!--{$tpl_state|escape}-->" />
        <input type="hidden" name="city" value="<!--{$tpl_city|escape}-->" />
        <input type="hidden" name="town" value="<!--{$tpl_town|escape}-->" />
        <div id="completebox">
          <p><!--{$tpl_message|escape}--></p>
        </div>
      </form>
    <ul class="btn_area_l2">
      <li class="btn">
        <span class="btn_next">
          <a href="javascript:window.close()">閉じる<input type="hidden" name="b_close" /></a>
        </span>
      </li>
    </ul>
<!--▲CONTENTS-->
  </div>
</div>
</body>
</html>

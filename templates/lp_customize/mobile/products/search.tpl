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
<center>商品検索</center>

<hr>

お探しの商品名を入力してください。<br>

<form method="get" action="<!--{$smarty.const.MOBILE_URL_DIR}-->products/list.php">
<center>
<input type="hidden" name="mode" value="search">
<input type="hidden" name="PHPSESSID" value="<!--{$smarty.get.PHPSESSID}-->">
<input type="hidden" name="transactionid" value="<!--{$smarty.get.transactionid}-->">
<input type="text" name="name" size="18" maxlength="50" value="<!--{$smarty.get.name|escape}-->"><br>
<input type="submit" name="search" value="検索">
</center>
</form>

<br>
<hr>

<a href="<!--{$smarty.const.MOBILE_URL_CART_TOP}-->?transactionid=<!--{$smarty.get.transactionid}-->&PHPSESSID=<!--{$smarty.get.PHPSESSID}-->" accesskey="9"><!--{9|numeric_emoji}-->かごを見る</a><br>
<a href="<!--{$smarty.const.MOBILE_URL_SITE_TOP}-->?transactionid=<!--{$smarty.get.transactionid}-->&PHPSESSID=<!--{$smarty.get.PHPSESSID}-->" accesskey="0"><!--{0|numeric_emoji}-->TOPページへ</a><br>

<br>

<!-- ▼フッター ここから -->
<!--{include file='footer.tpl'}-->
<!-- ▲フッター ここまで -->

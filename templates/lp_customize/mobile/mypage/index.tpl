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
<div align="center">MYページTOP</div>
<hr>

<!--{$CustomerName1|escape}--> <!--{$CustomerName2|escape}-->様<br>
いつもご利用いただきありがとうございます。<br>
<br>
<a href="history.php?transactionid=<!--{$smarty.request.transactionid}-->" accesskey="1"><!--{1|numeric_emoji}-->購入履歴</a><br>
<a href="change.php?transactionid=<!--{$smarty.request.transactionid}-->" accesskey="2"><!--{2|numeric_emoji}-->登録内容変更</a><br>
<a href="refusal.php?transactionid=<!--{$smarty.request.transactionid}-->" accesskey="3"><!--{3|numeric_emoji}-->退会</a><br>

<hr>

<a href="<!--{$smarty.const.MOBILE_URL_CART_TOP}-->?transactionid=<!--{$smarty.request.transactionid}-->&PHPSESSID=<!--{$smarty.request.PHPSESSID}-->" accesskey="9"><!--{9|numeric_emoji}-->かごを見る</a><br>
<a href="<!--{$smarty.const.MOBILE_URL_SITE_TOP}-->?transactionid=<!--{$smarty.request.transactionid}-->&PHPSESSID=<!--{$smarty.request.PHPSESSID}-->" accesskey="0"><!--{0|numeric_emoji}-->TOPページへ</a><br>

<br>

<!-- ▼フッター ここから -->
<!--{include file='footer.tpl'}-->
<!-- ▲フッター ここまで -->

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
<center>ご利用ガイド</center>

<hr>

<!-- ▼メニュー ここから -->
<!--<a href="usage.php" accesskey="1"><!--{1|numeric_emoji}-->ご利用方法</a><br>-->
<a href="privacy.php?transactionid=<!--{$smarty.get.transactionid}-->" accesskey="1"><!--{1|numeric_emoji}-->プライバシーポリシー</a><br>
<a href="charge.php?transactionid=<!--{$smarty.get.transactionid}-->" accesskey="2"><!--{2|numeric_emoji}-->通信料について</a><br>
<a href="kiyaku.php?transactionid=<!--{$smarty.get.transactionid}-->" accesskey="3"><!--{3|numeric_emoji}-->ご利用規約</a><br>
<a href="about.php?transactionid=<!--{$smarty.get.transactionid}-->" accesskey="4"><!--{4|numeric_emoji}-->運営会社紹介</a><br>
<!-- ▲メニュー ここまで -->

<br>
<hr>

<a href="<!--{$smarty.const.MOBILE_URL_CART_TOP}-->?transactionid=<!--{$smarty.get.transactionid}-->&PHPSESSID=<!--{$smarty.get.PHPSESSID}-->" accesskey="9"><!--{9|numeric_emoji}-->かごを見る</a><br>
<a href="<!--{$smarty.const.MOBILE_URL_SITE_TOP}-->?transactionid=<!--{$smarty.get.transactionid}-->&PHPSESSID=<!--{$smarty.get.PHPSESSID}-->" accesskey="0"><!--{0|numeric_emoji}-->TOPページへ</a><br>

<br>

<!-- ▼フッター ここから -->
<!--{include file='footer.tpl'}-->
<!-- ▲フッター ここまで -->

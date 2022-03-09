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
<div id="mynavarea">

	<h3 class="titleCommon sideColumn">お買い物履歴</h3>
	<ul class="mynav">
		<!--{if $tpl_mypageno == 'index'}-->
			<li><a href="./index.php">購入履歴</a></li>
		<!--{else}-->
			<li><a href="./index.php">購入履歴</a></li>
		<!--{/if}-->

        <!--{if $tpl_mypageno == 'index'}-->
        <li><a href="./regular.php">定期申込履歴</a></li>
        <!--{else}-->
        <li><a href="./regular.php">定期申込履歴</a></li>
        <!--{/if}-->

    </ul>
   <h3 class="titleCommon sideColumn">会員情報<span class="sidememo">(変更・登録・確認)</span></h3>
      <ul class="mynav">
		<!--{if $tpl_mypageno == 'change'}-->
			<li><a href="./change.php">基本会員情報</a></li>
		<!--{else}-->
			<li><a href="./change.php">基本会員情報</a></li>
		<!--{/if}-->
		<!--{if $tpl_mypageno == 'delivery'}-->
			<li><a href="./delivery.php">お届け先</a></li>
		<!--{else}-->
			<li><a href="./delivery.php">お届け先</a></li>
		<!--{/if}-->

		<!--{if $amazon_pay_v1_enabled}-->
			<li><a href="./amazon_pay_info.php">AmazonPay お支払情報</a></li>
		<!--{/if}-->

		<!--{if $paygent_credit_flg && $useable_register_card_info_flg}-->
			<!--{if $tpl_mypageno == 'card_info'}-->
				<li><a href="./card_info.php">ご利用カード情報</a></li>
			<!--{else}-->
				<li><a href="./card_info.php">ご利用カード情報</a></li>
			<!--{/if}-->
			<!--{if $tpl_mypageno == 'change_card_info'}-->
				<!--<li><a href="./change_card_info.php">カード情報登録・変更</a></li>-->
			<!--{else}-->
				<!--<li><a href="./change_card_info.php">カード情報登録・変更</a></li>-->
			<!--{/if}-->
		<!--{/if}-->

		<!--{if $zeusAvailableFlg}-->
		<li><a href="./zeus_card_info.php">ご利用カード情報</a></li>
		<!--{/if}-->

		<!--{if $gmopgAvailableFlg}-->
		<li><a href="./gmopg_card_info.php">ご利用カード情報</a></li>
		<!--{/if}-->

       <!--{if $tpl_mypageno == 'change_regular_payment'}-->
			<li><a href="./change_regular_payment.php">定期コース支払い方法</a></li>
		<!--{else}-->
			<li><a href="./change_regular_payment.php">定期コース支払い方法</a></li>
		<!--{/if}-->

        <!--{if $point_flg != 2}-->
		<!--{if $tpl_mypageno == 'point_history'}-->
			<li><a href="./point_history.php">ポイント履歴</a></li>
		<!--{else}-->
			<li><a href="./point_history.php">ポイント履歴</a></li>
		<!--{/if}-->
		<!--{if $tpl_mypageno == 'point_expire'}-->
			<!--<li><a href="./point_expire.php">ポイント有効期限</a></li>-->
		<!--{else}-->
			<!--<li><a href="./point_expire.php">ポイント有効期限</a></li>-->
		<!--{/if}-->
		<!--{/if}-->
		<!--{if !$tpl_disable_logout}-->
		<li>
			<form name="mypage_logout" id="mypage_logout" method="post" action="<!--{$smarty.const.SSL_URL|escape}-->frontparts/login_check.php">
				<input type="hidden" name="mode" value="login" />
				<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$transactionid|escape}-->" />
				<input type="hidden" name="__PHPSESID" value="<!--{php}-->echo session_id();<!--{/php}-->" />
				<input type="hidden" name="url" value="<!--{$smarty.server.PHP_SELF|escape}-->" />
				<a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnFormModeSubmit('mypage_logout', 'logout', '', ''); return false;">
					ログアウト
				</a>
			</form>
		</li>
		<!--{/if}-->
        <!--{if $tpl_mypageno == 'refusal'}-->
			<li><a href="./refusal.php">退会手続き</a></li>
		<!--{else}-->
			<li><a href="./refusal.php">退会手続き</a></li>
		<!--{/if}-->
      </ul>

    <h3 class="titleCommon sideColumn">お買い物便利機能</h3>
    	<ul class="mynav">
		<!--{if 'basis-friend_coupon'|get_option_use_flg == true}-->
			<!--{if $tpl_mypageno == 'coupon_list'}-->
				<li><a href="./coupon_list.php">マイクーポン</a></li>
			<!--{else}-->
				<li><a href="./coupon_list.php">マイクーポン</a></li>
			<!--{/if}-->
		<!--{/if}-->

		<!--{if 'products-add_favorite'|get_option_use_flg == true}-->
	        <!--{if $tpl_mypageno == 'favorite'}-->
	            <li><a href="./favorite.php">お気に入り</a></li>
	        <!--{else}-->
	            <li><a href="./favorite.php">お気に入り</a></li>
	        <!--{/if}-->
		<!--{/if}-->

		<!--{if 'basis-friend_coupon'|get_option_use_flg == true and $friend_coupon_flg == true}-->
	        <!--{if $tpl_mypageno == 'friend'}-->
	            <li><a href="./friend.php">お友達紹介</a></li>
	        <!--{else}-->
	            <li><a href="./friend.php">お友達紹介</a></li>
	        <!--{/if}-->
		<!--{/if}-->

	</ul>
</div>
<!--▲NAVI-->

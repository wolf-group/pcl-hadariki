<!--▼NAVI-->
<div id="mynavarea">
	<ul>
	<!--{if $tpl_mypageno == 'index'}-->
		<li>
			<a href="./history_list.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_history_list.png" /><span class="pst10">購入履歴</span></a>
		</li>
	<!--{else}-->
		<li>
			<a href="./history_list.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_history_list.png" /><span class="pst10">購入履歴</span></a>
		</li>
	<!--{/if}-->

   <!--{if $tpl_mypageno == 'regular'}-->
		<li>
			<a href="./regular.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_regular.png" /><span class="pst10">定期申込履歴</span></a>
		</li>
	<!--{else}-->
		<li>
			<a href="./regular.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_regular.png" /><span class="pst10">定期申込履歴</span></a>
		</li>
	<!--{/if}-->


	<!--{if $tpl_mypageno == 'change'}-->
		<li>
			<a href="./change.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_menber.png" /><span class="pst10">基本会員情報</span></a>
		</li>
	<!--{else}-->
		<li>
			<a href="./change.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_menber.png" /><span class="pst10">基本会員情報</span></a>
		</li>
	<!--{/if}-->

	<!--{if $tpl_mypageno == 'delivery'}-->
		<li>
			<a href="./delivery.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_delivery.png" /><span class="pst10">お届け先</span></a>
		</li>
	<!--{else}-->
		<li>
			<a href="./delivery.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_delivery.png" /><span class="pst10">お届け先</span></a>
		</li>
	<!--{/if}-->
	<!--{if $amazon_pay_v1_enabled}--><!--{* Amazon Pay V1専用処理 *}-->
		<li>
			<a href="./amazon_pay_info.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_amazonpay_info.png" /><span class="pst10">AmazonPay お支払情報</span></a>
		</li>
	<!--{/if}-->

    <!--{if $paygent_credit_flg && $useable_register_card_info_flg}-->
		<!--{if $tpl_mypageno == 'card_info'}-->
			<li>
				<a href="./card_info.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_card_info.png" /><span class="pst10">ご利用カード情報</span></a>
			</li>
		<!--{else}-->
			<li>
				<a href="./card_info.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_card_info.png" /><span class="pst10">ご利用カード情報</span></a>
			</li>
		<!--{/if}-->
		<!--{if $tpl_mypageno == 'change_card_info'}-->
			<!--<li>
				<a href="./change_card_info.php">カード情報登録・変更</a>
			</li>-->
		<!--{else}-->
			<!--<li>
				<a href="./change_card_info.php">カード情報登録・変更</a>
			</li>-->
		<!--{/if}-->
	<!--{/if}-->

	<!--{if $zeusAvailableFlg}-->
		<li>
			<a href="./zeus_card_info.php"><img src="<!--{$TPL_DIR|escape}-->img/mypage/nav_card_info.png" /><span class="pst10">ご利用カード情報</span></a>
		</li>
	<!--{/if}-->

	<!--{if $gmopgAvailableFlg}-->
		<li>
			<a href="./gmopg_card_info.php"><img src="<!--{$TPL_DIR|escape}-->img/mypage/nav_card_info.png" /><span class="pst10">ご利用カード情報</span></a>
		</li>
	<!--{/if}-->

	<!--{if $tpl_mypageno == 'change_regular_payment'}-->
		<li style="display:none;"><a href="./change_regular_payment.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_change_regular.png" /><span class="pst5">定期コース<br />支払い方法</span></a></li>
	<!--{else}-->
		<li style="display:none;"><a href="./change_regular_payment.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_change_regular.png" /><span class="pst5">定期コース<br />支払い方法</span></a></li>
	<!--{/if}-->

	<!--{if $point_flg != 2}-->
		<!--{if $tpl_mypageno == 'point_history'}-->
			<li>
				<a href="./point_history.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_point.png" /><span class="pst10">ポイント履歴</span></a>
			</li>
		<!--{else}-->
			<li>
				<a href="./point_history.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_point.png" /><span class="pst10">ポイント履歴</span></a>
			</li>
		<!--{/if}-->
		<!--{if $tpl_mypageno == 'point_expire'}-->
			<!--<li>
				<a href="./point_expire.php">ポイント有効期限</a>
			</li>-->
		<!--{else}-->
			<!--<li>
				<a href="./point_expire.php">ポイント有効期限</a>
			</li>-->
		<!--{/if}-->
	<!--{/if}-->

	<!--{if 'basis-friend_coupon'|get_option_use_flg == true}-->
		<!--{if $tpl_mypageno == 'friend'}-->
			<li>
				<a href="./coupon_list.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_qupon.png" /><span class="pst10">マイクーポン</span></a>
			</li>
		<!--{else}-->
			<li>
				<a href="./coupon_list.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_qupon.png" /><span class="pst10">マイクーポン</span></a>
			</li>
		<!--{/if}-->
	<!--{/if}-->

	<!--{if 'products-add_favorite'|get_option_use_flg == true}-->
	    <!--{if $tpl_mypageno == 'favorite'}-->
	            <li><a href="./favorite.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_favorite.png" /><span class="pst5">お気に入り</span></a></li>
	    <!--{else}-->
	            <li><a href="./favorite.php"><img src="<!--{$TPL_DIR}-->img/mypage/nav_favorite.png" /><span class="pst5">お気に入り</span></a></li>
	    <!--{/if}-->
	<!--{/if}-->

	<!--{if $tpl_mypageno == 'refusal'}-->
		<!--<li>
			<a href="./refusal.php">退会手続き</a>
		</li>-->
	<!--{else}-->
		<!--<li>
			<a href="./refusal.php">退会手続き</a>
		</li>-->
	<!--{/if}-->
	</ul>
</div>
	<!--▼お友達紹介ここから-->
    <!--{if 'basis-friend_coupon'|get_option_use_flg == true and $friend_coupon_flg == true}-->
        <div class="friend_nav">
        <!--{if $tpl_mypageno == 'friend'}-->
            <a href="./friend.php"><span class="pst10">☆お友達紹介はこちら☆</span></a>
        <!--{else}-->
            <a href="./friend.php"><span class="pst10">☆お友達紹介はこちら☆</span></a>
        <!--{/if}-->
        </div>
	<!--{/if}-->
    <!--▲お友達紹介ここまで-->



 <div class="contact_area">
        <h3>お問い合わせ</h3>
        <ul>
            <li><a href="/smp/cart/index.php">カートの中を見る</a></li>
            <li><a href="/smp/contact/index.php">お問い合わせ</a></li>
            <li>
                <form name="login_form3" id="login_form3" method="post" action="<!--{$smarty.const.SSL_URL}-->smp/frontparts/login_check.php" onsubmit="return fnCheckLogin('login_form3')">
                    <input type="hidden" name="mode" value="login" />
                    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                    <input type="hidden" name="__PHPSESID" value="<!--{php}-->echo session_id();<!--{/php}-->" />
                    <input type="hidden" name="url" value="<!--{$smarty.server.PHP_SELF|replace:'/smp/':'/'|escape}-->" />
                    <!--{if !$tpl_disable_logout}--><a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnFormModeSubmit('login_form3', 'logout', '', ''); return false;">ログアウト</a><!--{/if}-->
                </form>
            </li>
            <li><a href="./refusal.php">退会手続き</a></li>

        </ul>
    </li>
<!--▲NAVI-->

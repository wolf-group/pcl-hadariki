<!--▼CONTENTS-->
<div id="mypagecolumn">
    <div class="head">
        <h2 class="t_mypage">マイページ
        <!--{* ポイント表示 *}-->
        <!--{if $tpl_point}--><!--{include file=$tpl_point}--><!--{/if}-->
        </h2>
    </div>
    <!--{include file=$tpl_navi}-->
    <div id="mycontentsarea">
        <!--{if $error_message}-->
        <div class="attention">
            <!--{$error_message}-->
        </div>
        <!--{/if}-->
        <div class="mycont_head">
            <h3>定期購入お届け先情報変更(AmazonPay[カード/お届け先]変更)</h3>
        </div>
        <p class="mgb20">
            AmazonPayお支払いのカード、お届け先を変更いたします。<br>
            下記ボタンよりAmazonPayへログインし、変更してください。<br>
        </p>
        <button id="AmazonPayV2ButtonForChangeDeliv">変更する</button>
        <!--{amazon_pay_button_v2_for_change_deliv button_id='AmazonPayV2ButtonForChangeDeliv'}-->
    </div>
</div>
<!--▲CONTENTS-->

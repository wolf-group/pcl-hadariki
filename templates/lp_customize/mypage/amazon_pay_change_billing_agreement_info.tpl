<!--▼CONTENTS-->
<script type="text/javascript">
//<![CDATA[
function returnAmazonPayInfo()
{
    var $form = $('<form/>', {method: 'post', action: './amazon_pay_info.php'});

    $('body').append($form);
    $form.submit();
}
function registAmazonPayInfo()
{
    var $form = $('<form/>', {method: 'post', action: './change_amazon_pay_info.php'});

    $form.append($('<input/>', {type: 'hidden', name: 'mode', value: 'regist'}));

    $('body').append($form);
    $form.submit();
}
function updateAmazonPayInfo()
{
    var $form = $('<form/>', {method: 'post', action: './change_amazon_pay_info.php'});

    $form.append($('<input/>', {type: 'hidden', name: 'mode', value: 'update'}));
    $form.append($('<input/>', {type: 'hidden', name: 'detail_id', value: '<!--{$detail_id}-->'}));

    $('body').append($form);
    $form.submit();
}
//]]>
</script>
<div id="mypagecolumn">
  <div class="head">
        <h2 class="t_mypage">マイページ
        <!--{* ポイント表示 *}-->
        <!--{if $tpl_point}--><!--{include file=$tpl_point}--><!--{/if}-->
        </h2>
    </div>
    <!--{include file=`$smarty.const.TEMPLATE_DIR`mypage/navi.tpl}-->
  <div id="mycontentsarea">
    <div class="mycont_head">
        <h3>AmazonPay お支払い情報の変更</h3>
    </div>
    <p class="mgb20">アドレス帳の住所情報、お支払い方法を変更後、「変更する」ボタンを押してください。</p>
        <div class="info_change">

<!--{* ログインボタン *}-->
            <div class="text-center" style="margin-top:40px;" id="AmazonPayButton"></div>

<!--{* 住所widget *}-->
            <style type="text/css">
            #addressBookWidgetDiv{width: 400px; height: 228px; display: table-cell;}
            </style>
            <div id="addressBookWidgetDiv"></div>

            <script type='text/javascript'>
            </script>
<!--{* /住所widget *}-->

<!--{* 支払widget *}-->
            <style type="text/css">
            #walletWidgetDiv{width: 400px; height: 228px; display: table-cell;}
            </style>
            <div id="walletWidgetDiv"></div>
        </div>

        <ul class="btn_area_l2" id="regist_btn" style="display:none;">
            <li class="btn">
                <span class="btn_next"><a href="javascript:void(0);" onclick="updateAmazonPayInfo();">変更する</a></span>
            </li>
        </ul>

        <div class="btn_rpst3_2">
                <span class="btn_mgprev"><a href="javascript:void(0);" onclick="returnAmazonPayInfo();">一覧へ戻る</a></span>
        </div>
  </div>
</div>

<script type="text/javascript">
window.onAmazonPaymentsReady = function() {
    AddressWidgets();
};

function AddressWidgets(){
    new OffAmazonPayments.Widgets.AddressBook({
    sellerId: '<!--{$seller_id|escape:javascript}-->',
    //    agreementType: 'BillingAgreement',
    amazonBillingAgreementId: '<!--{$billing_agreement_id|escape:javascript}-->',
    // displayMode: "Read",
    onReady: function(billingAgreement) {
    // billingAgreementId = billingAgreement.getAmazonBillingAgreementId();
    },
    onAddressSelect: function(billingAgreement) {
        $('#regist_btn').hide();
        PaymentsWidgets();
    },
    design: {
    designMode: 'responsive'
    },
    onError: function(error) {
        if(error.getErrorCode() === 'BuyerSessionExpired'){
            // ログインボタン表示
            showAmazonPayLoginBtn(
                                    "<!--{$seller_id|escape:javascript}-->",
                                    "AmazonPayButton",
                                    "<!--{$login_redirect_url|escape:javascript}-->?auth=1&detail_id=<!--{$detail_id|escape:javascript}-->",
                                    "LwA", "Gold", "large");
        }
    }
    }).bind("addressBookWidgetDiv");
}

function PaymentsWidgets(){
    new OffAmazonPayments.Widgets.Wallet({
    sellerId: '<!--{$seller_id|escape:javascript}-->',
    // amazonBillingAgreementId obtained from the AddressBook widget
    amazonBillingAgreementId: '<!--{$billing_agreement_id|escape:javascript}-->',
    onPaymentSelect: function(billingAgreement) {
    // Replace this code with the action that you want to perform
    // after the payment method is selected.
    $('#regist_btn').show();
    },
    design: {
    designMode: 'responsive'
    },
    onError: function(error) {
    // your error handling code
    }
    }).bind("walletWidgetDiv");
}

$(function()
{
<!--{if $modify_orderdeliv_flg}-->
    function popMes()
    {
        var modify_master_ids = <!--{$json_modify_master_ids}-->;

        mes = "AmazonPayお支払い情報を変更しました。";
        if(modify_master_ids.length > 0){
            mes = mes + "\n\nAmazonPayお届け先情報の変更に伴い、\n下記定期コースのお届け先が変更されました。\n\n";
            mes = mes + "定期コースID： " + modify_master_ids.join(', ');
        }
        alert(mes);
    }
    popMes();
<!--{/if}-->

<!--{if $err_flg}-->
    function popErrMes()
    {
        alert('<!--{$err_msg|escape:javascript}-->');
    }
    popErrMes();
<!--{/if}-->

});
</script>
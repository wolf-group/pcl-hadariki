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
    $form.append($('<input/>', {type: 'hidden', name: 'detail_id', value: '<!--{$detail_id|escape:javascript}-->'}));

    $('body').append($form);
    $form.submit();
}
function LogoutAmazonPay()
{
    amazon.Login.logout();
    document.cookie = "amazon_Login_accessToken=; expires=Thu, 01 Jan 1970 00:00:00 GMT";
    location.reload();
}
//]]> 
</script>
<div id="mypagecolumn">
    <div class="pankuzuarea">
        <p style="letter-spacing:0.01em;font-size:80%;"><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./amazon_pay_info.php">AmazonPayお支払い情報</a></p>
    </div>
    
    <div class="mypage_inner">
            <h3>AmazonPay お支払い情報の変更</h3>
            <p class="pd10">
                アドレス帳の住所情報、お支払い方法を変更後、「変更する」ボタンを押してください。
            </p>
            <div class="info_change">

<!--{* ログインボタン *}-->
                <div class="text-center" style="margin-top:40px;" id="AmazonPayButton"></div>

<!--{* 住所widget *}-->
                <style type="text/css">
                #addressBookWidgetDiv{width: 400px; height: 228px;}
                </style>
                <div id="addressBookWidgetDiv"></div>
<!--{* /住所widget *}-->

<!--{* 支払widget *}-->
                <style type="text/css">
                #walletWidgetDiv{width: 400px; height: 228px;}
                </style>
                <div id="walletWidgetDiv"></div>

                <script type='text/javascript'>
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
                </script>
            </div>
        </div>

        <ul>
            <li class="mg_newbtn">
                <a href="javascript:void(0);" onclick="updateAmazonPayInfo();">変更する</a>
            </li>
        </ul>

        <div class="mypage_back">
            <a href="javascript:void(0);" onclick="returnAmazonPayInfo();">
                <div class="mg_back">一覧へ戻る</div>
            </a>
        </div>

    </div>
</div>

<style type="text/css">
input, select, textarea{background-color: #ddd;}
</style>

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
                                    '<!--{$seller_id|escape:javascript}-->',
                                    "AmazonPayButton",
                                    "<!--{$login_redirect_url|escape:javascript}-->?auth=1",
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

$(function(){
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


<div id="mypagecolumn">
	<div class="pankuzuarea">
    	<p style="letter-spacing:0.01em;font-size:80%;"><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./change_regular_payment.php">お支払い方法変更</a></p>
    </div>
	<div class="mypage_inner">

	<form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
	<input type="hidden" name="mode" value="confirm" />
	<input type="hidden" name="credit" value="1" />
	<input type="hidden" name="order_id" value="<!--{$arrForm.order_id.value|escape}-->" />

	<h3>お支払い方法変更（定期購入／頒布会）</h3>

<!--{if $arrRegularHistory}-->
	<!--{if !$arrPayment}-->
	<p class="pd10">定期購入リストからタップでお選びください</p>
	<!--{/if}-->
	<div class="order_info">
        <table>
            <tr>
                <th class="centertd" width="21%">注文番号</th>
                <th class="centertd" width="24%">注文日時</th>
                <th class="centertd" width="20%">購入金額</th>
                <th class="centertd" width="20%">お支払方法</th>
                <!--{if $arrPayment}--><th class="centertd" width="20%">詳細</th><!--{/if}-->
            </tr>
            <!--{foreach from=$arrRegularHistory item=item key=key}-->
            <tr class="order_list" data-order-id="<!--{$item.order_id}-->">
                <td class="centertd" width="20%"><!--{$item.order_id}--></td>
                <td width="24%"><!--{$item.create_date}--></td>
                <td class="centertd" width="20%"><!--{$item.payment_total}-->円</td>
                <td class="centertd" width="20%"><!--{$item.payment_method|escape}--></td>
                <!--{if $arrPayment}-->
                <td class="centertd" width="20%">
                	<a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnChangeAction('./history.php'); fnKeySubmit('order_id','<!--{$item.order_id}-->'); return false">
                      <div class="mg_dtbtn"><span class="pst15">詳細</span></div>
                    </a>
                </td>
                <!--{/if}-->
            </tr>
            <!--{/foreach}-->
        </table>
    </div>
<!--{else}-->
	<div class="mgt10">
		<p class="no_data3">現在変更可能な受注はありません。</p>
    </div>
<!--{/if}-->

<!--{if $arrPayment}-->
<div class="payment_info">
	<h4>▼お支払い方法</h4>
    <div class="custom-selectbox w100">
    <select name="payment_id" id="payment_select" onchange="selectPaymentMethod();">
        <!--{foreach from=$arrPayment item=item key=key}-->
        <option value="<!--{$item.payment_id}-->"<!--{if $item.rpst_payment_flg}--> class="credit_rpst_payment"<!--{/if}--> <!--{if $item.payment_id == $arrForm.payment_id.value}-->selected="selected"<!--{/if}-->><!--{$item.payment_method}--></option>
        <!--{/foreach}-->
    </select>
    </div>

    <table>
        <tr>
            <td>
                <p><em id="payment_info" class="fts_03"></em></p>
            </td>
        </tr>
    </table>

	<!--{assign var=key value="payment_id"}-->
	<span class="attention"><!--{$arrErr[$key]}--></span>
	<p class="blue_bx"><em class="fts_03">※支払い方法を変更されると、お支払金額（小計＋送料＋手数料）が再計算されます。</em></p>

<!--{if $credit_flg && ($credit_gmo || $credit_paygent)}-->
	<div class="credit_info">
      <h3>カード情報入力</h3>
      <dl summary="カード情報入力">
          <dt>カード番号<span class="required">必須</span></dt>
          <dd>
              <!--{assign var=key1 value="card_no1"}-->
              <!--{assign var=key2 value="card_no2"}-->
              <!--{assign var=key3 value="card_no3"}-->
              <!--{assign var=key4 value="card_no4"}-->
              <span class="attention"><!--{$arrErr[$key1]}--></span>
              <span class="attention"><!--{$arrErr[$key2]}--></span>
              <span class="attention"><!--{$arrErr[$key3]}--></span>
              <span class="attention"><!--{$arrErr[$key4]}--></span>
              <input type="text" class="boxLong top text h30" name="card_no" value="<!--{$arrForm[$key1].value|escape}--><!--{$arrForm[$key2].value|escape}--><!--{$arrForm[$key3].value|escape}--><!--{$arrForm[$key4].value|escape}-->" maxlength="16" size="24" />
          </dd>
          <dt>有効期限<span class="required">必須</span></dt>
          <dd>
              <!--{assign var=key1 value="card_expiration_month"}-->
              <!--{assign var=key2 value="card_expiration_year"}-->
              <span class="attention"><!--{$arrErr[$key1]}--></span>
              <span class="attention"><!--{$arrErr[$key2]}--></span>
              <div class="custom-selectbox w20">
                  <select name="<!--{$key1}-->" id="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="float: none">
                      <option value="">--</option>
                      <!--{html_options options=$arrMonth selected=$arrForm[$key1].value|escape}-->
                  </select>
              </div>
              <label for="<!--{$key1}-->" class="pdlr5">月 / </label>
              <div class="custom-selectbox w30">
                  <select name="<!--{$key2}-->" id="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="float: none" >
                      <option value="">--</option>
                      <!--{html_options options=$arrYear selected=$arrForm[$key2].value|escape}-->
                  </select>
              </div>
              <label for="<!--{$key2}-->" class="pdlr5">年</label>
          </dd>
          <dt>カード名義(ローマ字氏名)<span class="required">必須</span></dt>
          <dd>
              <!--{assign var=key1 value="card_holder_name1"}-->
              <!--{assign var=key2 value="card_holder_name2"}-->
              <span class="attention"><!--{$arrErr[$key1]}--></span>
              <span class="attention"><!--{$arrErr[$key2]}--></span>
              <label>名</label> <input type="text" class="boxMedium2 text h30" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" size="20">
              <label>姓</label> <input type="text" class="boxMedium2 text h30" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" size="20">
              <p class="bg_red">半角入力(例：TAROU YAMADA)</p>
          </dd>
          <dt>お支払い方法<span class="required">必須</span></dt>
          <dd>
          <!--{assign var=key value="paymethod"}-->
          <span class="attention"><!--{$arrErr[$key]}--></span>
          <div class="custom-selectbox w50">
              <select name="<!--{$key}-->" value="<!--{$arrForm[$key]|escape}-->">
              <!--{html_options options=$arrPayMethod selected=$arrForm[$key]|escape}-->
              </select>
          </div>
          </dd>
<!--{captcha_form_cc_mypage}-->
      </dl>
	</div>
	<!--{if $arrSavedCardInfo.regular}-->
	<div class="credit_info credit_paygent">
    <h3>登録済みのカード（定期／頒布会用）</h3>

		<!--{foreach from=$arrSavedCardInfo.regular item=card_info key=idx}-->
	<table summary="カード情報照会">
        <tr>
		<th colspan="2"><input type="radio" name="card_info" id="card_info_<!--{$card_info.card_info_id}-->" value="<!--{$card_info.card_info_id}-->" /><label for="card_info_<!--{$card_info.card_info_id}-->"> このカードを使用する</label> （<!--{$idx+1}-->枚目）</th>
		</tr>
		<tr>
		<th style="width:30%;">カード番号</th>
		<td><!--{$card_info.card_number}--></td>
		</tr>
		<tr>
		<th>有効期限</th>
		<td><!--{$card_info.expiration_month}-->月&nbsp;/&nbsp;<!--{$card_info.expiration_year}-->年</td>
		</tr>
		<tr>
		<th>カード名義</th>
		<td><!--{$card_info.cardholder_name}--></td>
		</tr>
		<tr>
		<th>カード会社</th>
		<td><!--{$card_info.company_name}--></td>
		</tr>
		<tr>
		<th>有効性チェック</th>
		<td><!--{$card_info.card_status}--></td>
		</tr>
	</table>
    	<!--{/foreach}-->

    </div>
	<!--{/if}-->
<!--{/if}-->

<!--{if $arrPaymentWallets}-->
<!--{foreach from=$arrPaymentWallets item=payment_wallet key=payment_id}-->
<div class="credit_info rpst_payment_wallet credit_paymentid_<!--{$payment_id}-->">
    <!--{if $payment_wallet}-->
    <h3>登録済みのカード（定期／頒布会用）</h3>
    <div class="attention"><!--{$arrErr.payment_wallet_id}--></div>
	<!--{foreach from=$payment_wallet item=card_info key=payment_wallet_id name=wallet}-->
	<table summary="カード情報照会">
        <tr>
		<th colspan="2"><input type="radio" name="payment_wallet_id" id="payment_wallet_<!--{$payment_wallet_id|escape}-->" value="<!--{$payment_wallet_id|escape}-->" /><label for="payment_wallet_<!--{$payment_wallet_id|escape}-->"> このカードを使用する</label> （<!--{$smarty.foreach.wallet.iteration|escape}-->枚目）</th>
		</tr>
		<tr>
		    <th style="width:30%;">カード番号</th>
		    <td><!--{$card_info.card_num|escape}--></td>
		</tr>
		<tr>
		    <th>有効期限</th>
		    <td><!--{$card_info.expires_month|escape}-->月&nbsp;/&nbsp;<!--{$card_info.expires_year|escape}-->年</td>
        </tr>
        <tr>
            <th>カード名義</th>
            <td><!--{$card_info.holder_name|escape}--></td>
        </tr>
		<tr>
		    <th>カード会社</th>
		    <td><!--{$card_info.card_company|escape}--></td>
		</tr>
	</table>
    <!--{/foreach}-->
	<!--{else}-->
    <h2 class="mycont_headttl mgtb10"><strong>登録済みのカードがありません</strong></h2>
    <a href="/smp<!--{$arrPaymentWalletsMaypagePath[$payment_id]|escape}-->">こちら</a>よりカード情報を登録してください。
    <!--{/if}-->
    </div>
<!--{/foreach}-->
<!--{/if}-->

	<ul>
		<li class="mg_cardbtn3">
			<span class="btn_next"><a href="javascript:void(0);" onclick="paygent_token_send();">支払方法を変更</a></span>
		</li>
	</ul>

</div>

 <div class="mypage_back">
        <a href="./regular.php#<!--{$arrForm.order_id.value|escape}-->">
        	<div class="mg_back">定期リストに戻る<input type="hidden" name="back" id="back" /> </div>
        </a>
	</div>
<!--{else}-->
	<p class="pd10">
		<em>※「配送回数が0回」または「初回最短お届け日」が指定されている場合、お支払い方法を変更できません。</em>
	</p>
<!--{/if}-->





</div>



	</form>
	</div>
</div>

<script type="text/javascript">
var done = {};
done.card_no1 = false;
done.card_no2 = false;
done.card_no3 = false;

//ajax
var Ajax = {
    payment: function(data) {
        var defer = $.Deferred();
        $.ajax({
            type: "POST",
            url: "./change_regular_payment.php",
            data: data,
            success: function(res_data) {
               checkResponse(res_data);//レスポンスチェック
               defer.resolve(res_data);
            },
            error: defer.reject
        });
        return defer.promise();
    }
};

function checkResponse(data)
{
  if(data['result'] != 'success'){
    if(data['result_detail'] == 'not login'){
      $(location).attr("href", "/mypage/login.php");
    }
  }
}

function selectPaymentMethod()
{
    var order_id = $('input[name=order_id]').val();
    var payment_id = $("#payment_select").val();
    GetPaymentInfo(order_id, payment_id);
}

function showPaymentWallet(payment_id)
{
    $('input[name=credit]').val('1');
    $('.credit_paygent').hide();
    $('.gmo_method').hide();
    $credit_paymentid_class_name = 'credit_paymentid_' + payment_id;
    $('.' + $credit_paymentid_class_name).show();
}

//支払い方法情報取得
function GetPaymentInfo(order_id, payment_id)
{
    // RpstPayment対応クレジット情報
    $('.rpst_payment_wallet').hide();
    if ($('#payment_select option:selected').hasClass('credit_rpst_payment')) {
        showPaymentWallet(payment_id);
        return;
    }
    parm = {
            "action": 'GetPaymentInfo',
            "order_id": order_id,
            "payment_id": payment_id
    };

    Ajax.payment(parm).done(function(data){
        if(data['result'] == 'success'){
            $("#payment_info").html(data['payment_info']['payment_affairs_regular'] + data['payment_info']['payment_affairs']);

            if (data['payment_info']['regular_credit_flg']){
                $('input[name=credit]').val('1');
                $('.credit_info').show();
                if (data['payment_info']['gmo_flg']) {
                    $('.gmo_method').show();
                    $('.credit_paygent').hide();
                } else {
                    if(data['saved_card_info']['regular'].length > 0){
                        $('.credit_info').hide();
                    }
                    $('.gmo_method').hide();
                    $('.credit_paygent').show();
                }
            } else {
                $('input[name=credit]').val('0');
                $('.credit_info').hide();
            }

        }else{
            window.alert('支払い方法情報の取得に失敗しました。');
        }
    });
}

function next(now, next) {
	if (now.value.length >= now.getAttribute('maxlength') && !done[now.name]) {
		next.focus();
		done[now.name] = true;
	} else if (now.value.length < now.getAttribute('maxlength')) {
		done[now.name] = false;
	}
}

$(function(){
	$('.order_list').click(function() {
		$('input[name=order_id]').val($(this).attr('data-order-id'));
		fnSetFormSubmit('form1', 'mode', 'select');
	});

  <!--{if $arrPayment}-->
  selectPaymentMethod();
  <!--{/if}-->
});

</script>
<style>
.order_info tr:hover td {
	background: rgb(235,246,255);
	cursor: pointer;
}
.selected {
	background: rgb(255,200,200) !important;
}
.credit_info {
	display: none;
}
</style>
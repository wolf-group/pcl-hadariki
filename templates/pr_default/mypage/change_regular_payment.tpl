<div id="mypagecolumn">
	<div class="head">
		<h2 class="t_mypage">マイページ
        <!--{* ポイント表示 *}-->
        <!--{if $tpl_point}--><!--{include file=$tpl_point}--><!--{/if}-->
        </h2>
	</div>
	<!--{include file=$tpl_navi}-->
	<div id="mycontentsarea">
		<div class="mycont_head">
			<h3>定期コース支払い方法の変更・確認 </h3>
		</div>

	<form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
	<input type="hidden" name="mode" value="confirm" />
	<input type="hidden" name="credit" value="1" />
	<input type="hidden" name="order_id" value="<!--{$arrForm.order_id.value|escape}-->" />

<!--{if $arrRegularHistory}-->
	<!--{if !$arrPayment}-->
	<p class="mgb20">定期申込リストからお選びください</p>
	<!--{/if}-->
	<div class="order_info">
    <table>
		<tr>
			<th class="centertd" width="20%">定期申込番号</th>
			<th class="cebtertd" width="20%">注文日時</th>
			<th class="centertd" width="20%">支払金額</th>
			<th  width="20%">お支払い方法</th>
			<!--{if $arrPayment}-->
            <th width="20%" class="centertd">詳細</th>
            <!--{/if}-->
		</tr>
     </table>

		<!--{foreach from=$arrRegularHistory item=item key=key}-->
       <table>
		<tr class="order_list" data-order-id="<!--{$item.order_id}-->">
			<td class="centertd" width="20%"><!--{$item.order_id}--></td>
			<td class="lefttd" width="20%"><!--{$item.create_date}--></td>
			<td class="centertd" width="20%"><!--{$item.payment_total}-->円</td>
			<td class="lefttd" width="20%"><!--{$item.payment_method|escape}--></td>
			<!--{if $arrPayment}-->
            <td width="20%" class="centertd">
            	<div class="btn_fv"><a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnChangeAction('./history.php'); fnKeySubmit('order_id','<!--{$item.order_id}-->'); return false">詳細</a></div>
            </td><!--{/if}-->
    </tr>
		<tr>
        	<td colspan="5">
            	<!--{if $arrPayment}-->
                     <div class="payment_info">
                        <h3>▼お支払い方法をお選び下さい。</h3>
                            <!--{foreach from=$arrPayment item=item key=key}-->
                            <!--{if !$item.gmo_flg}-->
                            <ul>
                                <li>
                                    <input type="radio" name="payment_id" id="payment_<!--{$item.payment_id}-->" value="<!--{$item.payment_id}-->"  data-payment-id="<!--{$item.payment_id}-->"  class="<!--{if $item.regular_credit_flg}-->credit_check<!--{if $item.gmo_flg}--> gmo_credit<!--{elseif $item.paygent_flg}--> credit_paygent<!--{elseif $item.rpst_payment_flg}--> credit_rpst_payment<!--{/if}--><!--{/if}-->" <!--{if $item.payment_id == $arrForm.payment_id.value}-->checked="checked"<!--{/if}--> />
                                    <label for="payment_<!--{$item.payment_id}-->">
                                        <span style="position:relative;left:30px;"><!--{$item.payment_method}--></span>
                                    </label>
                                    <p><em><!--{$item.payment_affairs_regular|escape|nl2br}--><!--{$item.payment_affairs|escape|nl2br}--></em></p>
                                </li>
                            </ul>
                            <!--{/if}-->
                            <!--{/foreach}-->

                        <!--{assign var=key value="payment_id"}-->
                        <span class="attention"><!--{$arrErr[$key]}--></span>
                        <p class="mgt10"><em>※支払い方法を変更されると、お支払金額（小計＋送料＋手数料）が再計算されます。</em></p>

                        <!--{if $credit_flg && ($credit_gmo || $credit_paygent)}-->
                        <div class="credit_info">
                          <div class="dot_line"></div>
                          <h3>カード情報入力</h3>
                            <table summary="カード情報入力">
                                <tr>
                                    <th width="110px">カード番号</th>
                                    <th width="50px"><span class="required">必須</span></th>
                                    <td>
                                        <input type="text"
                                                name="card_no"
                                                value="<!--{$arrForm.card_no.value|escape}-->"
                                                maxlength="16"
                                                style="ime-mode: disabled; <!--{$arrErr.card_no|sfGetErrorColor}-->"
                                                class="box300"
                                                            size="24"
                                                            placeholder="1234567890123456"
                                                            />
                                        <div class="attention"><!--{$arrErr.card_no}--></div>
                                        <div class="mgt10"> 半角入力(例：1234567890123456)</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>有効期限</th>
                                    <th><span class="required">必須</span></th>
                                    <td>
                                        <!--{assign var=key1 value="card_expiration_month"}-->
                                        <!--{assign var=key2 value="card_expiration_year"}-->
                                        <div class="custom-selectbox w15">
                                            <select name="<!--{$key1}-->" id="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="float: none">
                                            <option value="">--</option>
                                            <!--{html_options options=$arrMonth selected=$arrForm[$key1].value|escape}-->
                                            </select>
                                        </div>
                                        <label for="<!--{$key1}-->" class="pdlr10">月</label>
                                        <div class="custom-selectbox w20">
                                            <select name="<!--{$key2}-->" id="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="float: none" >
                                            <option value="">--</option>
                                            <!--{html_options options=$arrYear selected=$arrForm[$key2].value|escape}-->
                                            </select>
                                        </div>
                                        <label for="<!--{$key2}-->" class="pdlr10">年</label>
                                   		 <div class="attention"><!--{$arrErr[$key1]}--></div>
                                         <div class="attention"><!--{$arrErr[$key2]}--></div>

                                    </td>
                                </tr>
                                <tr>
                                    <th>カード名義<br />(ローマ字氏名)</th>
                                    <th><span class="required">必須</span></th>
                                    <td>
                                        <!--{assign var=key1 value="card_holder_name1"}-->
                                        <!--{assign var=key2 value="card_holder_name2"}-->
                                        <label class="pdr5">名</label><input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" class="box120" size="20" placeholder="TAROU">
                                        <label class="pdr5">姓</label><input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" class="box120" size="20" placeholder="YAMADA">
                                        <div class="attention"><!--{$arrErr[$key1]}--></div>
                                        <div class="attention"><!--{$arrErr[$key2]}--></div>
                                       <div class="mini_add"> 半角入力(例：TAROU YAMADA)</div>
                                    </td>
                                </tr>
                                <tr class="gmo_method">
                                    <th>お支払い方法</th>
                                    <th ><span class="required">必須</span></th>
                                    <td>
                                    <!--{assign var=key value="paymethod"}-->
                                    <div class="custom-selectbox w50">
                                        <select name="<!--{$key}-->" value="<!--{$arrForm[$key]|escape}-->">
                                        <!--{html_options options=$arrPayMethod selected=$arrForm[$key]|escape}-->
                                        </select>
                                    </div>
                                    <div class="attention"><!--{$arrErr[$key]}--></div>
                                    </td>
                                <tr>
<!--{captcha_form_cc_mypage}-->
                            </table>
                    	</div>
                        <!--{if $arrSavedCardInfo.regular}-->

                        <div class="credit_info credit_paygent_card_list">
                        <div class="dot_line"></div>
                            <h2 class="mycont_headttl mgtb10">登録済みのカード（定期／頒布会用）</h2>
                            <!--{foreach from=$arrSavedCardInfo.regular item=card_info key=idx}-->
                            <h3 class="mgt10 pdt10"><input type="radio" name="card_info" value="<!--{$card_info.card_info_id}-->" /><strong>このカードを使用する</strong> （<!--{$idx+1}-->枚目）</h3>
                              <dl summary="カード情報照会">
                                  <dt>カード番号</dt>
                                  <dd><!--{$card_info.card_number}--></dd>
                              </dl>
                               <dl>
                                 <dt>有効期限</dt>
                                  <dd><!--{$card_info.expiration_month}-->月&nbsp;/&nbsp;<!--{$card_info.expiration_year}-->年</dd>
                              </dl>
                              <dl>
                                  <dt>カード名義</dt>
                                  <dd><!--{$card_info.cardholder_name}--></dd>
                              </dl>
                              <dl>
                                  <dt>カード会社</dt>
                                  <dd><!--{$card_info.company_name}--></dd>
                                </dl>
                              <dl>
                                  <dt>有効性チェック</dt>
                                  <dd><!--{$card_info.card_status}--></dd>

                              </dl>
                             <!--{/foreach}-->
                        </div>
                        <!--{/if}-->
                    <!--{/if}-->

                        <!--{if $arrPaymentWallets}-->
                        <!--{foreach from=$arrPaymentWallets item=payment_wallet key=payment_id}-->
                        <div class="credit_info rpst_payment_wallet credit_paymentid_<!--{$payment_id}-->">
                            <div class="dot_line"></div>
                            <!--{if $payment_wallet}-->
                                <h2 class="mycont_headttl mgtb10">登録済みのカード（定期／頒布会用）</h2>
                                <div class="attention"><!--{$arrErr.payment_wallet_id}--></div>
                                <!--{foreach from=$payment_wallet item=card_info key=payment_wallet_id name=wallet}-->
                                <h3 class="mgt10 pdt10"><input type="radio" name="payment_wallet_id" value="<!--{$payment_wallet_id|escape}-->" /><strong>このカードを使用する</strong> （<!--{$smarty.foreach.wallet.iteration|escape}-->枚目）</h3>
                                    <dl summary="カード情報照会">
                                        <dt>カード番号</dt>
                                        <dd><!--{$card_info.card_num|escape}--></dd>
                                    </dl>
                                    <dl>
                                        <dt>有効期限</dt>
                                        <dd><!--{$card_info.expires_month|escape}-->月&nbsp;/&nbsp;<!--{$card_info.expires_year|escape}-->年</dd>
                                    </dl>
                                    <dl>
                                        <dt>カード名義</dt>
                                        <dd><!--{$card_info.holder_name|escape}--></dd>
                                    </dl>
                                    <dl>
                                        <dt>カード会社</dt>
                                        <dd><!--{$card_info.card_company|escape}--></dd>
                                    </dl>
                                 <!--{/foreach}-->
                            <!--{else}-->
                                <h2 class="mycont_headttl mgtb10"><strong>登録済みのカードがありません</strong></h2>
                                <a href="<!--{$arrPaymentWalletsMaypagePath[$payment_id]|escape}-->">こちら</a>よりカード情報を登録してください。
                            <!--{/if}-->
                        </div>
                        <!--{/foreach}-->
                        <!--{/if}-->
                    </div>

                <div class="mg_newbtn">
                        <a href="javascript:void(0);" onclick="paygent_token_send();">支払方法を変更</a>
                </div>
            <!--{else}-->
                <p style="display:none;">
                    <em>※「配送回数が0回」または「初回最短お届け日」が指定されている場合、お支払い方法を変更できません。</em>
                </p>
            <!--{/if}-->
            </td>
        </tr>
	</table>

     <hr />
     <!--{/foreach}-->

    </div>

<!--{else}-->
	<p class="p_waku">
    現在変更可能な受注はありません。</p>
<!--{/if}-->
  <em>※「配送回数が0回」または「初回最短お届け日」が指定されている場合、お支払い方法を変更できません。</em>
	<div class="btn_rpst3_2">
        <span class="btn_mgprev"><a href="/mypage/regular.php#<!--{$arrForm.order_id.value|escape}-->" >定期リストに戻る</a></span>
    </div>

	</form>
	</div>
</div>

<script type="text/javascript">
var done = {};
done.card_no1 = false;
done.card_no2 = false;
done.card_no3 = false;

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

	$('input[name=payment_id]').click(function() {
		if ($(this).hasClass('credit_check')) {
			$('input[name=credit]').val('1');
            $('.credit_info').hide();
			if ($(this).hasClass('gmo_credit')) {
                $('.credit_paygent_card_list').hide();
                $('.rpst_payment_wallet').hide();
                $('.gmo_method').show();
			} else if ($(this).hasClass('credit_paygent')) {
                <!--{if !$arrSavedCardInfo.regular}-->
                $('.credit_info').show();
                <!--{/if}-->
                $('.gmo_method').hide();
                $('.rpst_payment_wallet').hide();
				$('.credit_paygent_card_list').show();
			} else if ($(this).hasClass('credit_rpst_payment')) {
                $('.gmo_method').hide();
                $('.credit_paygent_card_list').hide();
                $credit_paymentid_class_name = 'credit_paymentid_' + $(this).data('paymentId');
                $('.' + $credit_paymentid_class_name).show();
            }
		} else {
			$('input[name=credit]').val('0');
			$('.credit_info').hide();
		}
	});
});

$(document).ready(function(){
<!--{if $arrForm.payment_id.value}-->
    $('#payment_' + '<!--{$arrForm.payment_id.value|escape}-->').trigger('click');
<!--{/if}-->
});
</script>

<style>
.order_info tr.order_list:hover{
	background: rgb(235,246,255);
	padding:0;
	margin:0 auto;
	cursor: pointer;
}
.selected {
	background: rgb(255,200,200) !important;
}
.credit_info {
	display: none;
}
</style>


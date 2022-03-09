<script type="text/javascript">
var intervalId = null;
$(document).ready(function() {
	<!--{if $tpl_change_msg}-->
	intervalId = null;
	$('#change_msg').fadeIn('normal' , function() {
		intervalId = setInterval(fadeOutMsg , 2000);
	});
	<!--{/if}-->
});

function fadeOutMsg()
{
	$('#change_msg').fadeOut('slow' , function() {clearInterval(intervalId);});	
}

/**
 * カード情報変更ページへの遷移
 * @param integer card_info_id
 * @param integer regular_flg
 * @return void
 */
function changeAmazonPayInfo(detail_id)
{
    var $form = $('<form/>', {method: 'post', action: './change_amazon_pay_info.php'});

    $form.append($('<input/>', {type: 'hidden', name: 'detail_id', value: detail_id}));
    $('body').append($form);
    $form.submit();
}
</script>
<!--▼CONTENTS-->
<div id="mypagecolumn">
        <div class="head">
            <h2 class="t_mypage">マイページ
            <!--{* ポイント表示 *}-->
            <!--{if $tpl_point}--><!--{include file=$tpl_point}--><!--{/if}-->
            </h2>
        </div>
    <!--{if $tpl_navi != ""}-->
    <!--{include file=$tpl_navi}-->
  <!--{else}-->
    <!--{include file=`$smarty.const.TEMPLATE_DIR`mypage/navi.tpl}-->
  <!--{/if}-->
  <div id="mycontentsarea">
    <div class="mycont_head">
      <h3>AmazonPay お支払い情報の変更・確認</h3>
    </div>
	<div id="change_msg" class="attention" style="display:none">
	<!--{$tpl_change_msg|escape}-->
	</div>
    <p class="mgb20">現在AmazonPayで登録されているお支払い情報(お届け先、お支払い方法)の確認や変更することができます。</p>
        	<div class="card_tb">
            <h3 class="mycont_headttl3">お支払い情報</h3>
                  <!--{if $billing_agreement_arr}-->
                  <!--{foreach from=$billing_agreement_arr item=billing_agreement key=idx}-->
                <table summary="お支払い情報" class="mgb15">
                  <tr>
                    <th colspan="2">
                        <div class="card_ttl">
                            <h3>お届け先情報<!--{$idx+1}--></h3>
                            <span class="fl_r amapaych_bt pst4"><a href="#" onclick="changeAmazonPayInfo(<!--{$billing_agreement.id}-->); return false;"><span class="pst5">このお届け先のお支払い情報を変更する</span></a></span>
                        </div>
                    </th>
                  </tr>
                  <tr>
                    <td style="width:30%;">お名前</td>
                    <td><!--{$billing_agreement.name}-->&nbsp;</td>
                  </tr>
                  <tr>
                    <td>お届け先郵便番号</td>
                    <td><!--{$billing_agreement.postal_code}--></td>
                  </tr>
                  <tr>
                    <td>お届け先住所</td>
                    <td><!--{$billing_agreement.address_line_1}--><!--{$billing_agreement.address_line_2}--></td>
                  </tr>
                  <tr>
                    <td>電話番号</td>
                    <td><!--{$billing_agreement.phone}--></td>
                  </tr>
                </table>
                  <!--{/foreach}-->
                 <!--{else}-->
                 <p class="delivempty">AmazonPayに登録されているお支払い情報はありません。</p>
                 <!--{/if}-->
    	</div>

  </div>
</div>

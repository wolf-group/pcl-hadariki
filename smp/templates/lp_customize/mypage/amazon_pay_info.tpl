<script type="text/javascript">
/**
 * AmazonPay情報変更ページへの遷移
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
<div class="pankuzuarea">
        <p style="letter-spacing:0.01em;font-size:80%;"><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./amazon_pay_info.php">AmazonPayお支払い情報</a></p>
    </div>
    <div class="mypage_inner">
    
        <div class="mypage_point">

                <h3>AmazonPay お支払い情報の変更・確認</h3>
                <p class="pd10">現在AmazonPayで登録されているお支払い情報(お届け先、お支払い方法)の確認や変更することができます。</p>

                <h4 class="mycont_headttl">▼お支払い情報</h4>
                <div class="info_change">

                    <!--{if $billing_agreement_arr}-->
                        <!--{foreach from=$billing_agreement_arr item=billing_agreement key=idx}-->
                    <table>
                        <tr>
                            <th colspan="2">
                                お届け先情報<!--{$idx+1}-->&nbsp;
                            </th>
                        </tr>
                        <tr>
                            <th>お名前</th>
                            <td>
                                <!--{$billing_agreement.name}-->
                            </td
                        ></tr>
                        <tr>
                            <th>お届け先郵便番号</th>
                            <td>
                                <!--{$billing_agreement.postal_code}-->
                            </td>
                        </tr>
                        <tr>
                            <th>お届け先住所</th>
                            <td>
                                <!--{$billing_agreement.address_line_1}--><!--{$billing_agreement.address_line_2}-->
                            </td>
                        </tr>
                        <tr>
                            <th>電話番号</th>
                            <td>
                                <!--{$billing_agreement.phone}-->
                            </td>
                        </tr>
                    </table>
                    <ul>
                        <li class="mg_cardbtn">
                        <a href="#" onclick="changeAmazonPayInfo(<!--{$billing_agreement.id}-->); return false;">このお届け先のお支払い情報を変更する</a>
                        </li>
                    </ul>
                        <!--{/foreach}-->
                    <!--{else}-->
                    <p class="no_data1">AmazonPayに登録されているお支払い情報はありません。</p>
                    <!--{/if}-->
                 </div>

        </div>
    </div>
</div>

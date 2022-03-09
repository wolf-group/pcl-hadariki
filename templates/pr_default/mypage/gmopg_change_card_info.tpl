<script type="text/javascript" src="/js/mask.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->" ></script>
<script type="text/javascript">
var send = true;
var complete_flg = false;

$(document).ready(function() {
    $('#change_card_info_complete').on('click', function() {
        fnCheckGmopgTokenSubmitMypage('form1');
    });

    $('window').bind('unload' , function() {
        if (complete_flg == false) {
            return true;
        }

        alert('現在処理中です');

        return false;
    });

    <!--{if !$is_useable_security_code}-->
        $("[for=<!--{$cvv_for_new_card|escape:"javascript"}-->]").hide();
        $("[name=<!--{$cvv_for_new_card|escape:"javascript"}-->]").hide();
        $("#card_cvv").hide();
    <!--{/if}-->

    $("[name=<!--{$card_number_name|escape:"javascript"}-->]").val('<!--{$card_num|escape}-->');
    $("[name=<!--{$card_month_name|escape:"javascript"}-->]").val('<!--{$expires_month|escape}-->');
    $("[name=<!--{$card_year_name|escape:"javascript"}-->]").val('<!--{$expires_year|escape}-->');
});

</script>
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
    <div class="mycont_head">
        <h3>ご利用カード情報の変更・登録</h3>
    </div>
    <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
        <input type="hidden" name="mode" value="confirm" />
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$token|escape}-->" />
        <input type="hidden" name="gmopg_token_exec" value="" />
        <input type="hidden" name="gmopg_token_savecard" value="" />
        <input type="hidden" name="gmopg_token_3d" value="" />
        <input type="hidden" name="gmopg_token_identification" value="" />
        <input type="hidden" name="gmopg_masked_card_no" value="" />
        <!--{if $payment_wallet_id}-->
        <input type="hidden" name="payment_wallet_id" value="<!--{$payment_wallet_id|escape}-->" />
        <!--{/if}-->

        <div class="info_change">
            <table summary="カード情報照会">
                <tr>
                    <th width="150px">カード番号</th>
                    <th width="50px"><span class="required">必須</span></th>
                    <td>
                        <input type="text"
                            name="gmopg_token_card_number"
                            id="gmopg_token_card_number"
                            value="<!--{$card_num|escape}-->"
                            maxlength="16"
                            style="ime-mode: disabled;"
                            class="box300"
                                      size="24"
                                      placeholder="1234567890123456"
                                      />
                        <div class="mgt10"> 半角入力(例：1234567890123456)</div>
                    </td>
                </tr>
                <tr>
                    <th>有効期限</th>
                    <th><span class="required">必須</span></th>
                    <td>
                 	    <div class="custom-selectbox w15">
                            <select name="gmopg_token_card_expires_month" id="gmopg_token_card_expires_month" value="<!--{$expires_month|escape}-->" maxlength="2" >
                                <option value="">--</option>
                                <!--{html_options options=$disp_months selected=$expires_month|escape}-->
                            </select>
                        </div>
                        <span>月　/　</span>
                        <div class="custom-selectbox w15">
                            <select name="gmopg_token_card_expires_year" id="gmopg_token_card_expires_year" value="<!--{$expires_year|escape}-->" maxlength="2" >
                                <option value="">--</option>
                                <!--{html_options options=$disp_years selected=$expires_year|escape}-->
                            </select>
                        </div>
                        <span>年</span>
                    </td>
                </tr>
                <tr>
                    <th>カード名義<br />(ローマ字氏名)</th>
                    <th><span class="required">必須</span></th>
                    <td>
                        <p>
                            <input type="text"
                                  name="gmopg_token_card_name"
                                  id="gmopg_token_card_name"
                                  value="<!--{$holder_name|escape}-->"
                                  size="20"
                                  placeholder="TAROU YAMADA"
                                  class="box120">
                        </p>
                        <div class="mgt10">半角入力(例：TAROU&nbsp;YAMADA)</div>
                    </td>
                </tr>
<!--{captcha_form_cc_mypage}-->
            </table>
        </div>

        <div class="attention">
        <!--{if $error_message_list.gmopg_token_exec}-->
            <!--{$error_message_list.gmopg_token_exec|escape|nl2br}-->
        <!--{/if}-->
        </div>

        <ul class="btn_area_l2">
            <li class="btn">
                <span class="btn_next"><a href="javascript:void(0);" id="change_card_info_complete">確認ページへ<input type="hidden" name="refusal" id="refusal" /></a></span>
            </li>
        </ul>
    </form>
  </div>
</div>

<style type="text/css">
input, select, textarea{background-color: #ddd;}
</style>
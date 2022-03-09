<script type="text/javascript">
var send = true;
var screenMask   = new ScreenMask($);
var complete_flg = false;

function cardRegisterRadioControl() {
    <!--{if $card_add_space_available}-->
        $("#card_register_flg_1").prop("checked", "checked");
    <!--{else}-->
        <!--{if $is_regular}-->
            $("#<!--{$action_use_saved_card|escape:"javascript"}-->").click();
            $("#<!--{$action_use_new_card|escape:"javascript"}-->").prop("disabled", true);
        <!--{else}-->
            $("#card_register_flg_0").prop("checked", "checked");
            $("#card_register_flg_1").prop("disabled", true);
        <!--{/if}-->
    <!--{/if}-->
}

function hideNewCardArea() {
    $("#gmopg_new_card_area > table").hide();
    $("#gmopg_registerd_card_area > table").show();
    <!--{if !$is_useable_security_code}-->
        $(".cvv").hide();
    <!--{/if}-->
}

function showNewCardArea() {
    $("#gmopg_new_card_area > table").show();
    $("#gmopg_registerd_card_area > table").hide();
}

$(document).ready(function() {
    $('#gmopg_complete').on('click', function() {
        if (typeof gmopg_error_flg === "undefined") {
            gmopg_error_flg = false;
        }

        if (gmopg_error_flg) {
            gmopg_error_flg = false;
            return false;
        }

        complete_flg = true;
        screenMask.append();
        if(send) {
            send = false;
            return true;
        } else {
            alert("只今、処理中です。しばらくお待ち下さい。");
            return false;
        }
    });

    $('window').bind('unload', function() {
        if (complete_flg == false) {
            return true;
        }

        alert('現在処理中です');

        return false;
    });

    $("[name=payment_wallet_id]").prop("disabled", true);

    <!--{if $no_wallet}-->
        $("#card_list").hide();
        $("#<!--{$action_use_new_card|escape:"javascript"}-->").click();
        $('#<!--{$action_use_saved_card|escape:"javascript"}-->').prop("disabled", true);
    <!--{else}-->
        $("#<!--{$action_use_saved_card|escape:"javascript"}-->").click();
    <!--{/if}-->

    cardRegisterRadioControl();

    $("#card_register_flg_1").prop("checked", <!--{if $card_add_space_available}-->"checked"<!--{else}-->false<!--{/if}-->);

    <!--{if !$is_useable_security_code}-->
        $(".cvv").hide();
    <!--{/if}-->
    <!--{if $tpl_login != 1}-->
        $("#gmopg_registerd_card_area").hide();
        $("#gmopg_token_action_type_new").hide();
        $("[for=gmopg_token_action_type_new]").hide();
    <!--{/if}-->
});

$(document).on('click', '#<!--{$action_use_saved_card|escape:"javascript"}-->', function() {
    $("[name=payment_wallet_id]").prop("disabled", false);
    $("[name=card_register_flg]").prop("disabled", true);
    $("[name=<!--{$cvv_for_saved_card|escape:"javascript"}-->]").prop("disabled", false);
    $("[name=<!--{$cvv_for_new_card|escape:"javascript"}-->]").prop("disabled", true);
    $(".gmopg_token_input_error").prop("disabled", true);
    hideNewCardArea();
});

$(document).on('click', '#<!--{$action_use_new_card|escape:"javascript"}-->', function() {
    $("[name=payment_wallet_id]").prop("disabled", true);
    $("[name=card_register_flg]").prop("disabled", false);
    $("[name=<!--{$cvv_for_saved_card|escape:"javascript"}-->]").prop("disabled", true);
    $("[name=<!--{$cvv_for_new_card|escape:"javascript"}-->]").prop("disabled", false);
    $(".gmopg_token_input_error").prop("disabled", false);
    cardRegisterRadioControl();
    showNewCardArea();
});

</script>
<!--▼CONTENTS-->
<div id="shoppingcolumn">
    <div class="flowarea">
    <!--{if $regular_flg == 1 || $tpl_login != 1}-->
        <img src="<!--{$TPL_DIR}-->img/shopping/flow04-1.png" style="margin:0 auto;" />
    <!--{else}-->
        <img src="<!--{$TPL_DIR}-->img/shopping/m_step3-credit.png" style="margin:0 auto;" />
    <!--{/if}-->
    </div>
    <div class="head">
        <h2 class="t_oshiharai">クレジットカード決済情報のご入力</h2>
    </div>
    <table summary="お支払い方法">
        <tr>
            <td class="lefttd">お支払い方法：<!--{$tpl_payment_method|escape}--><br /></td>
        </tr>
    </table>
    <!--{foreach from=$arrErr key=key item=error}-->
        <p class="attention"><!--{$error}--></p>
    <!--{/foreach}-->
    <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
        <input type="hidden" name="mode" value="register" />
        <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid|escape}-->" />
        <input type="hidden" name="gmopg_token_exec" value="" />
        <input type="hidden" name="gmopg_token_savecard" value="" />
        <input type="hidden" name="gmopg_token_3d" value="" />
        <input type="hidden" name="gmopg_token_identification" value="" />
        <!--{get_token_payment_system_form_tag_card_info_area}-->
        <!--{if $use_lp_form_only}-->
            <input type="hidden" name="card_register_flg" value="1">
        <!--{else}-->
        <div style="margin-top: 10px;">
            <!--{if $tpl_login != 1}-->
            <input type="hidden" name="card_register_flg" value="0">
            <!--{elseif $is_regular}-->
            <input type="hidden" name="card_register_flg" value="1">
            <!--{else}-->
            ※ 「新しいカードを使う」を選択した場合、入力したカード情報を<br />
            <input type="radio" name="card_register_flg" value="1" id="card_register_flg_1"> 登録する&nbsp;&nbsp;<input type="radio" name="card_register_flg" value="0" id="card_register_flg_0"> 登録しない
            <!--{/if}-->
            <br />
            <!--{if !$card_add_space_available}-->
                <div class="red02">※ カード登録枚数が上限に達しています。</div>
            <!--{/if}-->
        </div>
        <br />
        <div id="card_list">
            ※ 「登録済みのカードを使う」を選択した場合、以下のカードから選択して下さい。
            <table>
                <tr>
                    <th>選択</th>
                    <th>カード番号</th>
                    <th>カード名義</th>
                    <th>有効期限(月/年)</th>
                </tr>
                <!--{foreach from=$wallet key=key item=item}-->
                    <tr>
                        <td><input type="radio" name="payment_wallet_id" value="<!--{$key|escape}-->" id="payment_wallet_id_<!--{$key|escape}-->"></td>
                        <td><label for="payment_wallet_id_<!--{$key|escape}-->"><!--{$item.card_num|escape}--></label></td>
                        <td><label for="payment_wallet_id_<!--{$key|escape}-->"><!--{$item.holder_name|escape}--></label></td>
                        <td><label for="payment_wallet_id_<!--{$key|escape}-->"><!--{$item.expires_month|escape}-->/<!--{$item.expires_year|escape}--></label></td>
                    </tr>
                <!--{/foreach}-->
            </table>
            <table>
                <tr>
                    <td class="lefttd">
                        以上の内容で間違いなければ、下記「注文を確定する」ボタンをクリックしてください。<br />
                        <span class="attention">※&nbsp;画面が切り替るまで少々時間がかかる場合がございますが、そのままお待ちください。</span>
                    </td>
                </tr>
            </table>
        </div>
        <!--{/if}-->
        <ul class="btn_area_n2">
            <li class="btn2">
                <span class="btn_prev">
                    <a href="javascript:void(0);" onclick="fnModeSubmit('return','',''); return false;">前のページへ戻る</a>
                </span>
            </li>
            <li class="btn">
                <span class="btn_next">
                    <a href="javascript:void(0);" id="gmopg_complete" onclick="fnCheckGmopgTokenSubmit('register', '', ''); return false;">注文を確定する</a>
                </span>
            </li>
        </ul>
    </form>
</div>
<!--▲CONTENTS-->

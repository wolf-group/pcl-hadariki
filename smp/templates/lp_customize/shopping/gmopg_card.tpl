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
    <div class="shopping_inner">
        <h2>お支払い方法：<!--{$tpl_payment_method|escape}--></h2>
        <br />
        <!--{foreach from=$arrErr key=key item=error}-->
            <div style="color:red;"><!--{$error}--></div>
        <!--{/foreach}-->
        <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
            <input type="hidden" id="mode" name="mode" value="register" />
            <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
            <input type="hidden" name="gmopg_token_exec" value="" />
            <input type="hidden" name="gmopg_token_savecard" value="" />
            <input type="hidden" name="gmopg_token_3d" value="" />
            <input type="hidden" name="gmopg_token_identification" value="" />
            <!--{get_token_payment_system_form_tag_card_info_area}-->
            <!--{if $use_lp_form_only}-->
                <input type="hidden" name="card_register_flg" value="1">
            <!--{else}-->
            <div>
                <!--{if $tpl_login != 1}-->
                <input type="hidden" name="card_register_flg" value="0">
                <!--{elseif $is_regular}-->
                <input type="hidden" name="card_register_flg" value="1">
                <!--{else}-->
                ※ 「新しいカードを使う」を選択した場合、入力したカード情報を<br />
                <input type="radio" name="card_register_flg" value="1" id="card_register_flg_1"> 登録する&nbsp;&nbsp;<input type="radio" name="card_register_flg" value="0" id="card_register_flg_0"> 登録しない
                <!--{/if}-->
                <!--{if !$card_add_space_available}-->
                    <br /><em>※ カード登録枚数が上限に達しています。</em>
                <!--{/if}-->
            </div>
            <div id="card_list">
                ※ 「登録済みのカードを使う」を選択した場合、以下のカードから選択して下さい。
                <table>
                    <tr>
                        <th>登録済みのカード情報</th>
                    </tr>
                    <!--{foreach from=$wallet key=key item=item}-->
                    <tr>
                        <td>
                            <input type="radio" name="payment_wallet_id" id="payment_wallet_id_<!--{$key|escape}-->" value="<!--{$key|escape}-->">
                            <label for="payment_wallet_id_<!--{$key|escape}-->">
                            カード番号:********<!--{$item.card_num|escape}--><br />
                            カード名義:<!--{$item.holder_name|escape}--><br />
                            有効期限(月/年):<!--{$item.expires_month|escape}-->/<!--{$item.expires_year|escape}--><br />
                            </label>
                        </td>
                    </tr>
                    <!--{/foreach}-->
                </table>
            </div>
            <!--{/if}-->
            <div style="margin:10px 0 0 0">
                <table>
                    <tr>
                        <td class="lefttd">以上の内容で間違いなければ、下記「注文を確定する」ボタンをクリックしてください。<br />
                        <em>※画面が切り替るまで少々時間がかかる場合がございますが、そのままお待ちください。</em></td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
    <ul class="btn_area">
        <li class="prv_btn">
            <a href="javascript:void(0);" onclick="fnModeSubmit('return','',''); return false;">前のページへ戻る</a>
        </li>
        <li class="nx_btn">
            <a href="javascript:void(0);" id="gmopg_complete" onclick="fnCheckGmopgTokenSubmit('register', '', ''); return false;">注文を確定する</a>
       </li>
    </ul>
</div>

<script type="text/javascript" src="/js/mask.js?<!--{$smarty.const.FRONT_JS_VERSION}-->" ></script>
<script type="text/javascript">
var send = true;
var screenMask = new ScreenMask($);
var complete_flg = false;

$(document).ready(function() {
    $('#zeus_complete').on('click', function() {
        if (typeof zeus_error_flg === "undefined") {
            zeus_error_flg = false;
        }

        if (zeus_error_flg) {
            zeus_error_flg = false;
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
  <!--{if $tpl_navi != ""}-->
    <!--{include file=$tpl_navi}-->
  <!--{else}-->
    <!--{include file=`$smarty.const.TEMPLATE_DIR`mypage/navi.tpl}-->
  <!--{/if}-->
  <div id="mycontentsarea">
    <div class="mycont_head">
        <h3>ご利用カード情報の変更・登録</h3>
    </div>
    <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
        <input type="hidden" name="mode" value="confirm" />
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$token|escape}-->" />
        <!--{if $send_id}-->
        <input type="hidden" name="send_id" value="<!--{$send_id|escape}-->" />
        <!--{/if}-->
        <!--{get_token_payment_system_form_tag_card_info_area}-->
        <div class="attention">
        <!--{if $error_message_list.zeus_token_key}-->
        <!--{$error_message_list.zeus_token_key|escape|nl2br}-->
        <!--{/if}-->
        </div>
        <ul class="btn_area_l2">
            <li class="btn">
                <span class="btn_next"><a href="javascript:void(0);" id="zeus_complete">確認ページへ<input type="hidden" name="refusal" id="refusal" /></a></span>
            </li>
        </ul>
    </form>
  </div>
</div>

<style type="text/css">
input, select, textarea{background-color: #ddd;}
</style>
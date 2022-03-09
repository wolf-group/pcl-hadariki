<script type="text/javascript" src="/js/mask.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->" ></script>
<script type="text/javascript">
var send = true;
var complete_flg = false;

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
        if(send) {
            send = !fnCheckGmopgTokenSubmitMypage('form1');
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
    <div class="pankuzuarea">
        <p style="letter-spacing:0.01em;font-size:80%;"><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./gmopg_card_info.php">ご利用カード情報</a></p>
    </div>
    <div class="mypage_inner">
        <form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
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
            <h3>ご利用カード情報の登録・変更</h3>
            <ol class="step_bar box_horizon border_box step1">
                <li class="step_bar_item item1"><p class="step_bar_txt">1.入力</p></li>
                <li class="step_bar_item item2"><p class="step_bar_txt">2.確認</p></li>
                <li class="step_bar_item item3"><p class="step_bar_txt">3.完了</p></li>
            </ol>
            <div class="info_change">
                <h4 class="mycont_headttl">決済情報の入力</h4>
                <dl>
                    <dt>カード番号<span class="required">必須</span></dt>
                    <dd>
                        <input type="text"
                        name="gmopg_token_card_number"
                        id="gmopg_token_card_number"
                        value="<!--{$card_num|escape}-->"
                        maxlength="16"
                        class="boxLong text h30"
                        size="24"
                        placeholder="1234567890123456"
                        inputmode="numeric"
                        />
                        <p class="bg_red">半角入力(例：1234567890123456)</p>
                    </dd>
                    <dt>有効期限<span class="required">必須</span></dt>
                    <dd>
                         <div class="custom-selectbox w30">
                            <select name="gmopg_token_card_expires_month" id="gmopg_token_card_expires_month" value="<!--{$expires_month|escape}-->" >
                            <option value="">--</option>
                            <!--{html_options options=$disp_months selected=$expires_month|escape}-->
                            </select>
                        </div>
                        <span class="pdlr5">月 /</span>
                        <div class="custom-selectbox w30">
                            <select name="gmopg_token_card_expires_year" id="gmopg_token_card_expires_year" value="<!--{$expires_year|escape}-->" >
                            <option value="">--</option>
                            <!--{html_options options=$disp_years selected=$expires_year|escape}-->
                            </select>
                         </div><span class="pdlr5">年</span>
                    </dd>
                    <dt>カード名義(ローマ字氏名)<span class="required">必須</span></dt>
                    <dd>
                        名:&nbsp;<input type="text"
                        name="gmopg_token_card_name"
                        id="gmopg_token_card_name"
                        value="<!--{$holder_name|escape}-->"
                        maxlength="20"
                        size="15"
                        class="boxMedium2 text h30"
                        placeholder="TAROU YAMADA"
                        ><br />
                        <p class="bg_red">半角入力(例：TAROU&nbsp;YAMADA)</p>
                    </dd>
<!--{captcha_form_cc_mypage}-->
                </dl>
            </div>
            <ul>
                <li class="mg_newbtn">
                    <a href="javascript:void(0);" id="gmopg_complete">確認ページへ</a>
                    <input type="hidden" name="refusal" id="refusal" />
                </li>
            </ul>
           <div class="mypage_back">
                <a href="./gmopg_card_info.php" >
                    <div class="mg_back">戻る</div>
                </a>
            </div>
        </form>
    </div>
</div>

<style type="text/css">
input, select, textarea{background-color: #ddd;}
</style>

<script>
$(function(){
  $("input, select, textarea").one("focus",function(){
     $(this).css("background","rgba(255,200,200,0.7)");
  }).blur(function(){ /*フォーカスが外れたとき*/
      if($(this).val()==""){ /*何も入力されていないなら*/
        $(this).css("background","#ddd").one("focus",function(){
               $(this).css("background","#ddd");
          });
       }
      else{
        $(this).css("background","#fff").one("focus",function(){
               $(this).css("background","#fff");
          });
      }
    });
});
</script>
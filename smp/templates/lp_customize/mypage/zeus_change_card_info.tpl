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
    <div class="pankuzuarea">
        <p style="letter-spacing:0.01em;font-size:80%;"><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./zeus_card_info.php">ご利用カード情報</a></p>
    </div>
    <div class="mypage_inner">
        <form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
            <input type="hidden" name="mode" value="confirm" />
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$token|escape}-->" />
            <!--{if $send_id}-->
            <input type="hidden" name="send_id" value="<!--{$send_id|escape}-->" />
            <!--{/if}-->
            <h3>ご利用カード情報の登録・変更</h3>
            <ol class="step_bar box_horizon border_box step1">
                <li class="step_bar_item item1"><p class="step_bar_txt">1.入力</p></li>
                <li class="step_bar_item item2"><p class="step_bar_txt">2.確認</p></li>
                <li class="step_bar_item item3"><p class="step_bar_txt">3.完了</p></li>
            </ol>
            <div class="info_change">
                <!--{get_token_payment_system_form_tag_card_info_area}-->
            </div>
            <ul>
                <li class="mg_newbtn">
                    <a href="javascript:void(0);" id="zeus_complete">確認ページへ</a>
                    <input type="hidden" name="refusal" id="refusal" />
                </li>
            </ul>
           <div class="mypage_back">
                <a href="./zeus_card_info.php" >
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
<script type="text/javascript" src="/js/mask.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->"></script>
<script type="text/javascript">
var sm = null;
$(document).ready(function() {
    sm = new ScreenMask($);
    $('#form1').bind('submit' , function() {
        sm.append();
        return true; 
    });
});
</script>
<!--▼CONTENTS-->
<div id="mypagecolumn">
    <div class="pankuzuarea">
        <p style="letter-spacing:0.01em;font-size:80%;"><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./gmopg_card_info.php">ご利用カード情報</a></p>
    </div>	
    
    <div class="mypage_inner">
        <form id="form1" name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
            <input type="hidden" name="mode" value="complete" />
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$token|escape}-->" />
            <input type="hidden" name="gmopg_token_exec" value="<!--{$gmopg_token_exec|escape}-->" />
            <input type="hidden" name="gmopg_token_savecard" value="" />
            <input type="hidden" name="gmopg_token_3d" value="" />
            <input type="hidden" name="gmopg_token_identification" value="" />
            <input type="hidden" name="gmopg_masked_card_no" value="" />
            <!--{if $payment_wallet_id}-->
            <input type="hidden" name="payment_wallet_id" value="<!--{$payment_wallet_id|escape}-->" />
            <!--{/if}-->
            <h3>ご利用カード情報の登録・変更【確認】</h3>
            <ol class="step_bar box_horizon border_box step1">
                <li class="step_bar_item item2"><p class="step_bar_txt">1.入力</p></li>
                <li class="step_bar_item item1"><p class="step_bar_txt">2.確認</p></li>
                <li class="step_bar_item item3"><p class="step_bar_txt">3.完了</p></li>
            </ol>	
            <div id="gmopg_new_card_area" class="info_change pdt5">
                <h4 class="mycont_headttl">確認ページ</h4>
                <dl>
                    <dt>カード番号</dt>
                    <dd>
                        <!--{$card_num|escape}-->
                    </dd>
                </dl>
            </div>

            <ul>
                <li class="mg_newbtn">
                    <a href="javascript:void(0);" onclick="document.form1.submit();">送&nbsp;信</a>
                    <input type="hidden" name="complete" id="complete" />
                </li>
            </ul>
             <div class="mypage_back">
                <a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('return', '', ''); return false;" >
                    <div class="mg_back">戻る<input type="hidden" name="back" id="back" /></div>
                </a>
            </div>
            
        </form>
    </div>
</div>

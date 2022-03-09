<script type="text/javascript" src="/js/mask.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->"></script>
<script type="text/javascript">
$(document).ready(function() {
    var sm = new ScreenMask($);
    $('#form1').bind('submit' , function() {
        sm.append();
        return true;
    });
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
        <form id="form1" name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
        <input type="hidden" name="mode" value="complete" />
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$token|escape}-->" />
        <input type="hidden" name="gmopg_token_exec" value="<!--{$gmopg_token_exec|escape}-->" />
        <input type="hidden" name="gmopg_token_savecard" value="" />
        <input type="hidden" name="gmopg_token_3d" value="" />
        <input type="hidden" name="gmopg_token_identification" value="" />
        <!--{if $payment_wallet_id}-->
        <input type="hidden" name="payment_wallet_id" value="<!--{$payment_wallet_id|escape}-->" />
        <!--{/if}-->

        <div class="mycont_head">
            <h3>ご利用カード情報の変更・登録</h3>
        </div>
        <div class="info_change">
            <table summary="カード情報照会">
              <tr>
                   <th width="200">カード番号</th>
                <td>
                       <!--{$card_num|escape}-->
                </td>
              </tr>
            </table>
        </div>
        <div class="btn_rpst3_2">
                      <span class="btn_prev"><a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('return', '', ''); return false;">戻&nbsp;る</a></span>
                      <input type="hidden" name="back" id="back" />
        </div>            
        <ul class="btn_area_n2">
            <li class="btn">
                <span class="btn_next"><a href="javascript:void(0);" onclick="document.form1.submit();">送&nbsp;信</a></span>
                <input type="hidden" name="complete" id="complete" />
            </li>
        </ul>
    </form>
  </div>
</div>

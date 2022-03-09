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
    <form name="form1" method="post" action="./zeus_change_card_info.php">
    <input type="hidden" name="mode" value="" />
    <input type="hidden" name="send_id" value="" />
    <div class="mycont_head">
        <h3>ご利用カード情報の変更・確認</h3>
    </div>
    <div id="change_msg" class="attention">
    <!--{$tpl_result_msg|escape|nl2br}-->
    </div>
    <p class="mgb20">現在登録されているクレジットカード情報の確認や変更、<bR />また新規で追加することができます。</p>
    <!--<h3 class="mycont_headttl">▼ 登録済みクレジットカード</h3>-->
            <div class="card_tb">
                  <!--{if !$noSavedCard}-->
                  <!--{foreach from=$arrSavedCardInfo item=card_info key=send_id name=card_info}-->
                <table summary="カード情報照会" class="mgb15">
                  <tr>
                    <th colspan="2">
                        <div class="card_ttl">
                            <h3>クレジットカード情報<!--{$smarty.foreach.card_info.iteration|escape}--></h3>
                            <span class="fl_r cardch_bt pst4"><a href="#" class="edit-card-info" data-send-id="<!--{$send_id|escape}-->"><span class="pst5">カード情報を変更する</span></a></span>
                        </div>
                    </th>
                  </tr>
                  <tr>
                    <td style="width:30%;">カード番号</td>
                    <td><!--{$card_info.card_num|escape}-->&nbsp;</td>
                  </tr>
                  <tr>
                    <td>有効期限</td>
                    <td><!--{$card_info.expires_month|escape}-->月&nbsp;/&nbsp;<!--{$card_info.expires_year|escape}-->年</td>
                  </tr>
                  <tr>
                    <td>カード会社</td>
                    <td><!--{$card_info.card_company|escape}--></td>
                  </tr>
                </table>
                  <!--{/foreach}-->
                 <!--{else}-->
                 <p class="delivempty">登録されているカード情報はありません。</p>
                 <!--{/if}-->
            <!--{if $register_button_flg}-->
            <div class="cardnew_bt"><a href="./zeus_change_card_info.php">カード情報の新規登録はこちらから</a></div>
            <!--{/if}-->
        </div> 
    </form>
  </div>
</div>

<script type="text/javascript">
$(function(){
    /**
     * カード情報変更ページへの遷移
    
     */
    $('.edit-card-info').on('click',function(){
        $('input[name="send_id"]').val($(this).data('sendId'));
        $('input[name="mode"]').val('editCardInfo');
        $('form[name="form1"]').attr('action' , './zeus_change_card_info.php').submit();
    });
});
</script>

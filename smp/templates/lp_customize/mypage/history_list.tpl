<!--▼CONTENTS-->
<div id="mypagecolumn">
  <div class="pankuzuarea">
      <p><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./history_list.php">購入履歴</a></p>
    </div>  

    <h3>購入履歴</h3>
  <div class="mypage_inner">
    <p class="pd10">全ての購入履歴をご確認頂けます。また「詳細」から
        お届け先やお支払い方法などの確認ができます。
       　</p>
        <form name="sort_form" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
        <input type="hidden" name="sort" value="" />
    <div class="pg_num1">
            <span class="fl_l pst7 fts_02">購入履歴<!--{$tpl_linemax_except_regular_master}-->件</span>
            <div class="fl_r custom-selectbox w50" >
                <section>
                  <select id="order_sort" onchange="order_sort_exe();">
                    <option value="all" <!--{if $sort == 'all'}-->selected="selected"<!--{/if}-->>全て表示する</option>
                    <option value="nomal" <!--{if $sort == 'nomal'}-->selected="selected"<!--{/if}-->>通常購入のみ表示</option>
                    <option value="regular" <!--{if $sort == 'regular'}-->selected="selected"<!--{/if}-->>定期購入のみ表示</option>
                  </select>
                </section>
            </div>
        </div>
        </form>
        <form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
      <input type="hidden" name="order_id" value="" />
      <input type="hidden" name="pageno" value="<!--{$tpl_pageno}-->" />
        <!--{if $tpl_linemax > 0}-->
        <div class="history_list">
                  <table summary="購入履歴" width="100%">
          <tr>
            <th style="width:16%;" class="centertd">注文日時</th>
            <th style="width:22%;" class="centertd">注文番号<br />種類</th>
            <th style="width:20%;" class="centertd">購入金額</th>
            <th style="width:36%;" class="centertd">詳細</th>
          <tr>
            <!--{section name=cnt loop=$arrOrder}-->
            <!--{if $arrOrder[cnt].regular_type != 1}-->
            <tr>
              <td style="width:16%;" class="pd5">
                <p><!--{$arrOrder[cnt].create_date|sfDispDBDate|escape}-->
                  <!--{if $arrOrder[cnt].status == $smarty.const.ORDER_DELIV}-->
                    <object type="image/svg+xml" data="/assets/svg/truck.svg" alt = "発送済み"></object>
                  <!--{/if}-->
                </p>
              </td>

              <!--{assign var=payment_id value="`$arrOrder[cnt].payment_id`"}-->
              <!--<li style="width:20%;"><!--{$arrPayment[$payment_id]|escape}--></td>-->
              <td style="width:22%;" class="centertd pd5">
                <!--{$arrOrder[cnt].order_id}-->
                <!--{if $arrOrder[cnt].status == $smarty.const.ORDER_CANCEL}-->
                  <br />キャンセル
                <!--{elseif $arrOrder[cnt].status == $smarty.const.ORDER_COMBINE}-->
                  <br />同梱(同梱先：<a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnChangeAction('./history.php'); fnKeySubmit('order_id','<!--{$arrOrder[cnt].combine_id}-->'); return false"><!--{$arrOrder[cnt].combine_id}--></a>)
                <!--{elseif $arrOrder[cnt].regular_type == 1}-->
                  <br />定期購入(お申込み)
                <!--{elseif $arrOrder[cnt].regular_type == 2}-->
                  <br />定期<!--{$arrOrder[cnt].regular_cron_times}-->回目
                <!--{/if}-->
              </td>
                            <td style="width:20%;" class="centertd"><!--{$arrOrder[cnt].payment_total|number_format}-->円</td>
                            <td style="width:36%;" class="centertd">
                              <div class="listbt_area">
                                      <ul>
                                          <li>
                                            <a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnChangeAction('./history.php'); fnKeySubmit('order_id','<!--{$arrOrder[cnt].order_id}-->'); return false">
                                              <div class="mg_dtbtn"><span class="pst15">詳細</span></div>
                                            </a>
                                          </li>
                                         
                                          <li>
                                           <!--{if $arrOrder[cnt].regular_type == 2}-->
                                              <a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnChangeAction('./change_order_info.php'); fnKeySubmit('order_id','<!--{$arrOrder[cnt].regular_master_order_id}-->'); return false">
                                                <div class="mg_dtbtn2"><span class="pst10">お届先<br />変更</span></div>
                                              </a>
                                             <!--{/if}-->  
                                          </li>
                                      </ul>
                              </div>
                            </td>
            <!--{assign var=payment_id value="`$arrOrder[cnt].payment_id`"}-->
               </tr>
                    <!--{/if}-->
                    <!--{/section}-->
                  </table>
                </div>
                <!--{if $tpl_strnavi}-->
                <div class="bg_pgnav">
                <!--▼ページナビ-->
                <!--{$tpl_strnavi}-->
                <!--▲ページナビ-->
                </div>
                <!--{/if}-->
    <!--{else}-->
      <p class="no_data1">購入履歴はありません。</p>
    <!--{/if}-->
    </form>
    <div class="mypage_back">
        <a href="./index.php">
            <div class="mg_back">戻る<input type="hidden" name="change" id="change" /></div>
        </a>
    </div>
  </div>
</div>

<script type="text/javascript">

function order_sort_exe(){
  document.sort_form['sort'].value = $( "#order_sort" ).val();
  document.sort_form.submit();
  // $('<form/>', {id: 'order_sort_form', method: 'post', action: '<!--{$smarty.server.PHP_SELF|escape}-->'})
  //     .append($('<input/>', {type: 'hidden', name: 'sort', value: $( "#order_sort" ).val()}))
  //     .appendTo($('#mypagecolumn'))
  //     .submit();
}

</script>

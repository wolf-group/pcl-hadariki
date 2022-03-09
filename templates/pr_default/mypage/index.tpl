<!--{*
/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2007 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
*}-->
<!--▼CONTENTS-->
<div id="mypagecolumn">
	<div class="head">
		<h2 class="t_mypage">マイページ
        <!--{* ポイント表示 *}-->
        <!--{if $tpl_point}--><!--{include file=$tpl_point}--><!--{/if}-->
        </h2>
	</div>
    <div style="clear:both;"></div>
    
	<!--{if $tpl_navi != ""}-->
		<!--{include file=$tpl_navi}-->
		<!--{else}-->
		<!--{include file=`$smarty.const.TEMPLATE_DIR`mypage/navi.tpl}-->
	<!--{/if}-->
	<div id="mycontentsarea">
        <!--{* LINE連携ボタンを表示したい場合はコメントアウトを外してください *}-->
        <!--
        <!--{if 'basis-line_app'|get_option_use_flg && !$is_line_customer}-->
            ※ LINEアカウントと連携されるとLINEアカウントが友だち追加されてお知らせがLINEで受け取れます。<br />
            <a href="<!--{get_line_url|escape}-->"><img src="/img/line/line_button081_m_r.png" alt="LINE連携"/></a><br />
        <!--{/if}-->
        -->
		<form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
		<input type="hidden" name="order_id" value="" />
		<input type="hidden" name="pageno" value="<!--{$tpl_pageno|escape}-->" />
    <input type="hidden" name="sort" value="<!--{$sort|escape}-->" />
		<div class="mycont_head">
			<h3>購入履歴</h3>
		</div>
	<div class="pdtb10">全ての購入履歴をご確認頂けます。また「購入詳細」から お届け先やお支払い方法などの確認ができます。<br />
   注文番号の()は定期申込番号です。
    </div>

	<div class="pg_num1">
      <div class="pdtb10 fl_l"><!--{$tpl_linemax_except_regular_master}-->件の購入履歴があります。</div>
      <div class="fl_r custom-selectbox w30" >
          <section onchange="order_sort();">
                <select id="order_sort">
                  <option value="all" <!--{if $sort == 'all'}-->selected="selected"<!--{/if}-->>全て表示する</option>
                  <option value="nomal" <!--{if $sort == 'nomal'}-->selected="selected"<!--{/if}-->>通常購入のみ表示</option>
                  <option value="regular" <!--{if $sort == 'regular'}-->selected="selected"<!--{/if}-->>定期購入のみ表示</option>
                </select>
           </section>
       </div>
   </div>
  <!--{if $tpl_linemax > 0}-->
<div class="history_list">
    <table summary="購入履歴">
      <tr class="bm_boxshadow">
        <th width="18%" class="centertd">購入日時</th>
        <th width="25%" colspan="2" class="centertd">注文番号</th>
        <th width="15%" class="centertd">お支払い方法</th>
        <th width="15%" class="centertd">合計金額</th>
        <th width="25%" class="centertd">詳細</th>
      </tr>
      <!--{section name=cnt loop=$arrOrder}-->
      <!--{if $arrOrder[cnt].regular_type != 1}-->
      <tr>
        <td width="18%">
          <p>
            <!--{$arrOrder[cnt].create_date|sfDispDBDate|escape}-->
            <!--{if $arrOrder[cnt].status == $smarty.const.ORDER_DELIV}-->
              <object type="image/svg+xml" data="/assets/svg/truck.svg" alt = "発送済み"></object>
            <!--{/if}-->
          </p>
        </td>
        <td>

		<!--{$arrOrder[cnt].order_id}--><!--{if $arrOrder[cnt].regular_type == 2}--><br />(<!--{$arrOrder[cnt].regular_master_order_id}-->)<!--{/if}-->
       </td>
       <td>
		<!--{if $arrOrder[cnt].status == $smarty.const.ORDER_CANCEL}-->
			キャンセル
		<!--{elseif $arrOrder[cnt].status == $smarty.const.ORDER_COMBINE}-->
			同梱(同梱先：<a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnChangeAction('./history.php'); fnKeySubmit('order_id','<!--{$arrOrder[cnt].combine_id}-->'); return false"><!--{$arrOrder[cnt].combine_id}--></a>)
		<!--{elseif $arrOrder[cnt].regular_type == 2}-->
			定期コース<br />お届け<!--{$arrOrder[cnt].regular_cron_times}-->回目
		<!--{/if}-->
       </td>
       <!--{assign var=payment_id value="`$arrOrder[cnt].payment_id`"}-->
       <td width="15%" class="centertd"><!--{$arrPayment[$payment_id]|escape}--></td>
       <td width="15%" class="centertd"><!--{$arrOrder[cnt].payment_total|number_format}-->円</td>
       <td width="25%" class="centertd">
           <div class="list_area">
               <ul>
                   <li>
                       <a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnChangeAction('./history.php'); fnKeySubmit('order_id','<!--{$arrOrder[cnt].order_id}-->'); return false">
                             <div class="mg_dtbtn"><span class="pst13">購入詳細</span></div>
                       </a>
                   </li>
                   <li>
                         <!--{if $arrOrder[cnt].regular_type == 2}-->
                            <a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnChangeAction('./change_order_info.php'); fnKeySubmit('order_id','<!--{$arrOrder[cnt].regular_master_order_id}-->'); return false">
                                <div class="mg_dtbtn2"><span class="pst5">お届先<br>変更</span></div>
                            </a>
                          <!--{/if}-->
                   </li>
               </ul>
           </div>
       </td>
     </tr>
     <!--{/if}-->
     <!--{/section}-->
    </table>

    <!--{if $tpl_strnavi}-->
    <div class="bg_pgnav">
      <!--▼ページナビ-->
      <!--{$tpl_strnavi}-->
      <!--▲ページナビ-->
    </div>
    <!--{/if}-->

   </div> 

    <!--{else}-->
    <p class="p_waku">購入履歴はありません。</p>
    <!--{/if}-->
    </form>
  </div>
</div>

<script type="text/javascript">

function order_sort(){
  $('<form/>', {method: 'post', action: '<!--{$smarty.server.PHP_SELF|escape:"javascript"}-->'})
      .append($('<input/>', {type: 'hidden', name: 'sort', value: $( "#order_sort" ).val()}))
      .appendTo(document.body)
      .submit();
}

</script>

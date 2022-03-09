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
		<form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
		<input type="hidden" name="order_id" value="" />
		<input type="hidden" name="pageno" value="<!--{$tpl_pageno}-->" />
		<div class="mycont_head">
			<h3>定期申込履歴（変更・解約など）</h3>
		</div>

        <div class="pdtb10">
        	定期購入・頒布会のお申し込み履歴をご確認頂けます。<br />また「申込詳細」から登録の変更・停止・解約などを行うことができます。
        </div>
	<!--{if $tpl_linemax > 0}-->

	<p class="pdtb10"><!--{$tpl_linemax}-->件の申込履歴があります。</p>

   <div class="reglar_list">
       <table summary="申込履歴" class="regular_order_table">
          <tr>
            <th width="15%" class="centertd">申込日時</th>
            <th width="17%" class="centertd">申込番号</th>
            <th width="20%" class="centertd">お支払い方法</th>
            <th width="10%" class="centertd">合計金額</th>
            <th width="*" class="centertd">詳細</th>
          </tr>

      <!--{section name=cnt loop=$arrOrder}-->
            <tr style = "border-bottom:solid 1px #ccc">
              <td><!--{$arrOrder[cnt].create_date|sfDispDBDate}--></td>
              <td class="centertd">
              <!--{$arrOrder[cnt].order_id}-->
              <!--{if $arrOrder[cnt].regular_type == 1}-->
                  定期コース<br />(お申し込み)
              <!--{/if}-->
              </td>
              <td class="centertd"><!--{$arrOrder[cnt].payment_method|escape}--></td>
              <!--{* 申込時のお支払い合計金額が表示されます。価格変更などを反映させたい場合は↓こちらのコメントアウトを外し、一つ下の行を削除してください  *}-->
              <!--<td width="15%" class="centertd"><!--{$arrOrder[cnt].current_payment_total|number_format|escape}-->円</td>-->
              <td class="centertd"><!--{$arrOrder[cnt].payment_total|number_format}-->円</td>
              <td class="centertd">
              <div class="list_area">
                <ul>
                <li><a href="javascript:void(0)" id="regular_list_<!--{$arrOrder[cnt].order_id}-->" class="syncer-acdn" data-target="regular_detail_<!--{$arrOrder[cnt].order_id}-->" onclick="showRegularDetail('<!--{$arrOrder[cnt].order_id}-->'); return false;">
                  <div class="mg_dtbtn" ><span class="pst13">申込詳細</span></div></a>
                </li>
                <!--{if $arrOrder[cnt].is_amapay_v2}-->
                <li><a onclick="$('#deliv_select_<!--{$arrOrder[cnt].order_id|escape:javascript}-->').val('amapayv2'); change_delivSelect('<!--{$arrOrder[cnt].order_id|escape:javascript}-->'); return false;">
                  <div class="mg_dtbtn" style="margin-left: 4px;"><span class="pst13" style = "top:5px;">AmazonPay<br>申込情報変更</span></div></a>
                </li>
                <!--{/if}-->
                  <li>
                      <a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnChangeAction('./change_order_info.php'); fnKeySubmit('order_id','<!--{$arrOrder[cnt].order_id}-->'); return false">
                          <div class="mg_dtbtn2"><span class="pst5">お届先<br />変更 </span></div>
                      </a>
                  </li>
                </ul>
                </div>
              </td>
            </tr>
            <tr>
              <td colspan="5">
                <div id="regular_detail_<!--{$arrOrder[cnt].order_id}-->" style="display:none;margin:10px 0">
                    <div class="appli_dt">
                        <h3 class="appli_head">定期コース お申し込み詳細&nbsp;&nbsp;<span style="color:#ff0000;" class="regular_stop_status"></span>
                            <span class="course_dt">
                                <span id="button_skip1_<!--{$arrOrder[cnt].order_id}-->" class="gbtn" style="display: none;"><a href="javascript:void(0);" onclick="SkipNextRegular('<!--{$arrOrder[cnt].order_id}-->')">スキップ</a></span>
                                <span id="button_pause_<!--{$arrOrder[cnt].order_id}-->" class="gbtn" style="display: none;"><a href="javascript:void(0);" onclick="PausedRegular('<!--{$arrOrder[cnt].order_id}-->', 'paused_regular')">一時停止</a></span>
                                <span id="button_restart_<!--{$arrOrder[cnt].order_id}-->" class="gbtn" style="display: none;"><a href="javascript:void(0);" onclick="PausedRegular('<!--{$arrOrder[cnt].order_id}-->', 'restart_regular')">お届け再開</a></span>
                                <span id="button_stop_<!--{$arrOrder[cnt].order_id}-->" class="gbtn" style="display: none;"><a href="javascript:void(0);" onclick="cancelReason_toggle('<!--{$arrOrder[cnt].order_id}-->')">解約</a></span>
                                <span class="bbtn" onclick="$('#regular_detail_<!--{$arrOrder[cnt].order_id}-->').slideToggle();"><a href="javascript:void(0);">閉じる</a></span>
                            </span>
                        </h3>
                        <div class="mouosikomi_tb">
                            <table>
                                <tr>
                                    <th colspan="2">コース名&nbsp;:&nbsp;<!--{$arrOrder[cnt].name|mb_truncate:40|mb_strimwidth:0:100:'...':'UTF-8'|escape}--></th>
                                </tr>
                                <tr>
                                    <td width="25%">購入日時&nbsp;</td><td><!--{$arrOrder[cnt].create_date|escape}--></td> </tr>
                                    <tr><td>注文番号&nbsp;</td><td><!--{$arrOrder[cnt].order_id|escape}-->
                                        (<span style="color:#d00000;" id="order_status_<!--{$arrOrder[cnt].order_id}-->"></span>)
                                     </td>
                                </tr>
                                <tr>
                                      <td>お支払い方法&nbsp;</td>
                                      <td><span class="pst5"><!--{$arrOrder[cnt].payment_method|escape}--></span>&nbsp;<input type="button" id="button_changepayment_<!--{$arrOrder[cnt].order_id}-->"  class="flr" onclick="ChangePayment('<!--{$arrOrder[cnt].order_id}-->');" value="支払い変更" style="display: none;" />
                                      <!--クレジット情報表示-->
                                      <input type="button" id="button_card_change_<!--{$arrOrder[cnt].order_id}-->" onclick="dialogChangeRegularCard('<!--{$arrOrder[cnt].order_id}-->');" value="カード変更▼" class="drop_bt" style="display: none;" />
                                      <input type="button" id="button_card_info_<!--{$arrOrder[cnt].order_id}-->" onclick="dialogInfoRegularCard('<!--{$arrOrder[cnt].order_id}-->');" value="カード情報▼" class="drop_bt" style="display: none;" />
                                      <!--/クレジット情報表示-->
                                      </td>
                                </tr>
                                <tr>
                                    <td>希望時間指定&nbsp;</td>
                                    <td>
                                        <span id="deliv_time_<!--{$arrOrder[cnt].order_id|escape}-->"><!--{if $arrOrder[cnt].deliv_time}--><!--{$arrOrder[cnt].deliv_time|escape}--><!--{else}-->指定なし<!--{/if}--></span>
                                        <input type="button" id="button_deliv_time_<!--{$arrOrder[cnt].order_id|escape}-->" class="flr" onclick="changeDelivTimeView_toggle('<!--{$arrOrder[cnt].order_id|escape:javascript}-->');" value="変更する" style="display: none;" />
                                    </td>
                                </tr>
                              </table>
                         </div>
                         <div class="mouosikomi_tb2">
                            <table summary="購入商品詳細">
                                <tbody>
                                    <tr>
                                        <th class="centertd">商品コード</th>
                                        <th class="centertd">商品名</th>
                                        <th class="centertd">単価</th>
                                        <th class="centertd">数量</th>
                                      </tr>
                                      <!--{section name=pr_cont loop=$arrOrder[cnt].products}-->
                                        <tr>
                                          <td width="20%" <!--{if $arrOrder[cnt].products[pr_cont].master_product}-->id="product_code_<!--{$arrOrder[cnt].order_id|escape}-->"<!--{/if}-->><!--{$arrOrder[cnt].products[pr_cont].product_code|mb_truncate:25|escape}--></td>
                                          <td width="40%">
                                            <a href="/product/detail/<!--{$arrOrder[cnt].products[pr_cont].product_id}-->"><!--{$arrOrder[cnt].products[pr_cont].product_name|mb_truncate:25|escape}--></a>
                                            <!--{* 規格がある場合 *}-->
                                            <!--{if $arrOrder[cnt].products[pr_cont].classcategory_id1 > 0}-->
                                            &nbsp;(<span <!--{if $arrOrder[cnt].products[pr_cont].master_product}-->id="classcategory_name1_<!--{$arrOrder[cnt].order_id|escape}-->"<!--{/if}-->><!--{$arrOrder[cnt].products[pr_cont].classcategory_name1|escape}--></span><!--{if $arrOrder[cnt].products[pr_cont].classcategory_id2 > 0}-->・<span <!--{if $arrOrder[cnt].products[pr_cont].master_product}-->id="classcategory_name2_<!--{$arrOrder[cnt].order_id|escape}-->"<!--{/if}-->><!--{$arrOrder[cnt].products[pr_cont].classcategory_name2|escape}--></span><!--{/if}-->)<!--{/if}-->
                                            <!--{* ↑規格表示ここまで *}-->
                                          </td>
                                          <!--{* 申込時の単価が表示されます。価格変更などを反映させたい場合は↓ こちらのコメントアウトを外し、一つ下の行を削除してください *}-->
                                          <!--<td class="centertd"><!--{$arrOrder[cnt].current_price|number_format|escape}-->円</td>-->
                                          <td class="centertd"><!--{$arrOrder[cnt].products[pr_cont].price|number_format}-->円</td>
                                          <td class="centertd"><!--{$arrOrder[cnt].products[pr_cont].quantity|number_format}--></td>
                                          <!--<td class="pricetd"><!--{$arrOrder[cnt].products[pr_cont].price*$arrOrder[cnt].products[pr_cont].quantity|number_format}-->円</td>-->
                                       </tr>
                                      <!--{/section}-->
                                      <tr>
                                          <td colspan="3" class="righttd">お申し込み小計</td>
                                          <!--{* 申込時の小計が表示されます。価格変更などを反映させたい場合は↓こちらのコメントアウトを外し、一つ下の行を削除してください  *}-->
                                          <!--<td class="pricetd" ><!--{$arrOrder[cnt].current_subtotal|number_format|escape}-->円</td>-->
                                          <td class="pricetd" ><!--{$arrOrder[cnt].subtotal-$arrOrder[cnt].tax|number_format}-->円</td>
                                      </tr>
                                      <tr>
                                          <td colspan="3" class="righttd">消費税</td>
                                          <!--{* 申込時の税金が表示されます。価格変更などを反映させたい場合は↓こちらのコメントアウトを外し、一つ下の行を削除してください  *}-->
                                          <!--<td class="pricetd" ><!--{$arrOrder[cnt].current_tax|number_format|escape}-->円</td>-->
                                          <td class="pricetd"><!--{$arrOrder[cnt].tax|number_format}-->円</td>
                                      </tr>
                                      <!--{if $arrOrder[cnt].use_point > 0}-->
                                      <tr>
                                          <td colspan="3" class="righttd">ポイント値引き</td>
                                          <td class="pricetd"><!--{$arrOrder[cnt].use_point|number_format}-->円</td>
                                      </tr>
                                      <!--{/if}-->
                                      <!--{if $arrOrder[cnt].discount > 0}-->
                                      <tr>
                                          <td colspan="3" class="righttd">値引き</td>
                                          <td class="pricetd"><!--{$arrOrder[cnt].discount|number_format}-->円</td>
                                      </tr>
                                      <!--{/if}-->
                                      <tr>
                                          <td colspan="3" class="righttd">送料</td>
                                          <td class="pricetd"><!--{$arrOrder[cnt].deliv_fee|number_format}-->円</td>
                                      </tr>
                                      <!--{if $arrOrder[cnt].charge > 0}-->
                                      <tr>
                                          <td colspan="3" class="righttd">手数料</td>
                                          <td class="pricetd"><!--{$arrOrder[cnt].charge|number_format}-->円</td>
                                      </tr>
                                      <!--{/if}-->
                                      <!--{if $arrOrder[cnt].relay_fee > 0}-->
                                      <tr>
                                          <td colspan="3" class="righttd">離島手数料</td>
                                          <td class="pricetd"><!--{$arrOrder[cnt].relay_fee|number_format}-->円</td>
                                      </tr>
                                      <!--{/if}-->
                                      <tr class="totalbg">
                                          <td colspan="3" class="righttd">お支払い合計金額</td>
                                          <!--{* 申込時のお支払い合計金額が表示されます。価格変更などを反映させたい場合は↓こちらのコメントアウトを外し、一つ下の行を削除してください  *}-->
                                          <!--<td class="pricetd"><span class="price"><!--{$arrOrder[cnt].current_payment_total|number_format|escape}-->円</span></td>-->
                                          <td class="pricetd"><span class="price"><!--{$arrOrder[cnt].payment_total|number_format}-->円</span></td>
                                      </tr>
                                 </tbody>
                            </table>
                            <span><em>※初回購入や回数ごとの割引・無料設定は、ここには表示されません。</em></span>
                            <br />
                            <div class="next_info_btn" data-id="<!--{$arrOrder[cnt].order_id|escape}-->" style="width:200px; display: inline-block; margin-top: 0.25rem;"><a class="next_paytotal">次回お支払い合計金額</a></div>
                            <div class="sku_change">
                                <!--{if $arrOrder[cnt].type == 0 && $change_product_class_enable_flg && $arrOrder[cnt].exist_regular_master_product_class}-->
                                <span onclick="changeProductView_toggle('<!--{$arrOrder[cnt].order_id}-->');" class="change_product_classcategory">次回お届け予定の商品の<!--{$arrOrder[cnt].change_regular_master_product_class_text|escape}-->を変更する</span>
                                <!--{* ↓規格情報を取得中に表示します。任意の画像などに変更できますが、必ずspanタグ内に入れてください。またidの変更はしないでください。 *}-->
                                <span id="change_product_class_loading_<!--{$arrOrder[cnt].order_id|escape}-->" style="display: none;">情報取得中......</span>
                                <br /><span class="sku_change_date">※<b><!--{$arrOrder[cnt].regular_order_master.next_date|date_format:"%Y年%m月%d日"|escape}--></b>お届け分より変更されます</span>
                                <!--{/if}-->
                            </div>
                            <div id="next_info_blk_<!--{$arrOrder[cnt].order_id|escape}-->" style="display:none;">
                                <table summary="購入商品詳細">
                                    <tbody>
                                        <tr>
                                            <td colspan="3" class="righttd">小計(税込)</td>
                                            <td class="pricetd" ><!--{$arrOrder[cnt].next_subtotal|number_format|escape}-->円</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" class="righttd">送料</td>
                                            <td class="pricetd"><!--{$arrOrder[cnt].next_deliv_fee|number_format|escape}-->円</td>
                                        </tr>
                                        <!--{if $arrOrder[cnt].charge > 0}-->
                                        <tr>
                                            <td colspan="3" class="righttd">手数料</td>
                                            <td class="pricetd"><!--{$arrOrder[cnt].charge|number_format|escape}-->円</td>
                                        </tr>
                                        <!--{/if}-->
                                        <!--{if $arrOrder[cnt].relay_fee > 0}-->
                                        <tr>
                                            <td colspan="3" class="righttd">離島手数料</td>
                                            <td class="pricetd"><!--{$arrOrder[cnt].relay_fee|number_format|escape}-->円</td>
                                        </tr>
                                        <!--{/if}-->
                                        <tr class="totalbg">
                                            <td colspan="3" class="righttd">次回お支払い合計金額</td>
                                            <td class="pricetd"><span class="price"><!--{$arrOrder[cnt].next_payment_total|number_format|escape}-->円</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                         </div>

                        <div class="mouosikomi_tb">
                            <table style="margin:0 auto 20px auto;padding:0;">
                                <tbody>
                                	<tr>
                                    	<th colspan="2">
                                             <span class="pst7">▼お届け先</span>
                                             <section class="fl_r" id="change_deliv_section_<!--{$arrOrder[cnt].order_id}-->">
                                                <span>お届け先の変更：</span>
                                                <div class="custom-regselectbox">
                                                  <select name="deliv_select" id="deliv_select_<!--{$arrOrder[cnt].order_id}-->" onchange="change_delivSelect('<!--{$arrOrder[cnt].order_id}-->');">
                                                    <option value="def">以下から選択する</option>
                                                    <!--{if $arrOrder[cnt].is_amapay_v2}-->
                                                    <option value="amapayv2">AmazonPay[カード/お届け先]変更</option>
                                                    <!--{else}-->
                                                    <option value="input">お届け先を入力して変更する</option>
                                                    <option value="list">お届け先リストから選択する</option>
                                                    <!--{/if}-->
                                                  </select>
                                                </div>
                                             </section>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                        <span id="deliv_name_<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].deliv_name01|escape}-->&nbsp;<!--{$arrOrder[cnt].deliv_name02|escape}--></span>
                                        (<span id="deliv_kana_<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].deliv_kana01|escape}-->&nbsp;<!--{$arrOrder[cnt].deliv_kana02|escape}--></span>)<br />
                                        〒<span id="deliv_zip_<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].deliv_zip01|escape}-->-<!--{$arrOrder[cnt].deliv_zip02|escape}--></span>
                                        <span id="deliv_addr_<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].pref_name|escape}--><!--{$arrOrder[cnt].deliv_addr01|escape}--><!--{$arrOrder[cnt].deliv_addr02|escape}--></span>
                                        <p id="deliv_tel_<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].deliv_tel01|escape}-->-<!--{$arrOrder[cnt].deliv_tel02|escape}-->-<!--{$arrOrder[cnt].deliv_tel03|escape}--></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <span class="pst5">サイクル:<span id="cycle_<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].regular_order_master.cycle_jp|escape}--></span></span>
                                            <input type="button" id="button_cycle_<!--{$arrOrder[cnt].order_id}-->"  class="flr" onclick="changeCycleView_toggle('<!--{$arrOrder[cnt].order_id}-->');" value="変更する" style="display: none;" />
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td colspan="2">
                                            <span class="pst5">次回希望日：<span id="next_date_<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].regular_order_master.next_date|escape}--></span></span>
                                            <input type="button" id="button_next_<!--{$arrOrder[cnt].order_id}-->" class="flr" onclick="changeNextDateView_toggle('<!--{$arrOrder[cnt].order_id}-->');" value="変更する" style="display: none;" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="bbtn centertd" onclick="$('#regular_detail_<!--{$arrOrder[cnt].order_id}-->').slideToggle();"><a href="javascript:void(0);">閉じる</a></div>
                        </div>

                	</div><!--appli_dt-->
               </div>
              </td>
            </tr>
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
<!--regular_list-->

    <!--{else}-->
    <p class="p_waku">定期申込はありません。</p>
    <!--{/if}-->
    </form>
  </div>
</div>

<!--サイクル変更-->
<div id="cycle_change_dialog" style="display:none">
  <form id="cycle_change">
  <input type="hidden" name="action" value="ChangeCycle" />
  <input type="hidden" name="order_id" id="cycle_change_order_id" value="" />

  <table summary="サイクルの変更"  style="margin:0 auto;padding:0;">
    <tr><th>ご希望のサイクルを選択してください</th></tr>
    <tr id="cycle_date" style="display: none;">
      <td>
        <div id="set_date1">
          <p><input type="radio" name="cycle_type" id="cycle_type1" value="1" <!--{if $regular_order_master.cycle_type == 1}-->checked="checked"<!--{/if}-->><label for="cycle_type1">日付で指定</label></p>
          <select name="cycle_date_monthly" id="cycle_date_monthly"></select>
          <select name="cycle_date_day" id="cycle_date_day"></select>
        </div>
      </td>
    </tr>
    <tr id="cycle_week" style="display: none;">
      <td>
        <div id="set_date2">
          <p><input type="radio" name="cycle_type" id="cycle_type2" value="2" <!--{if $regular_order_master.cycle_type == 2}-->checked="checked"<!--{/if}-->><label for="cycle_type2">曜日で指定</label></p>
          <select name="cycle_week_monthly" id="cycle_week_monthly"></select>
          <select name="cycle_week_ordinal" id="cycle_week_ordinal"></select>
          <select name="cycle_week_week" id="cycle_week_week"></select>
        </div>
      </td>
    </tr>
    <tr id="cycle_interval" style="display: none;">
      <td>
        <div id="set_date3">
          <p><input type="radio" name="cycle_type" id="cycle_type3" value="3" <!--{if $regular_order_master.cycle_type == 3}-->checked="checked"<!--{/if}-->><label for="cycle_type3">間隔で指定</label></p>
           <p><select name="cycle_interval_start_date" id="cycle_interval_start_date">
          <!--{section name=cnt start=0 loop=$regular_config.interval_range}-->
          <!--{assign var=time_ts value="+`$smarty.section.cnt.index` day"|strtotime:$regular_config.allowed_first_interval_date_ts}-->
          <!--{assign var=time value=$time_ts|date_format:"%Y-%m-%d"}-->
          <option value="<!--{$time}-->" <!--{if $regular_order_master.cycle_interval_start_date == $time}-->selected="selected"<!--{/if}-->><!--{$time_ts|date_format:"%Y年%m月%d日"}--></option>
          <!--{/section}-->
          </select>
          <span class="pdr5">から</span><select name="cycle_interval_interval" id="cycle_interval_interval"></select>間隔
        </div>
      </td>
    </tr>
  </table>
  </form>
</div>

<!--{* 商品規格変更 *}-->
<div id="product_change_dialog" style="display:none" data-size="600">
    <form id="product_change">
        <table summary="商品規格変更">
            <tr>
                <td>ご希望の<span id="classcategory_name1_select_txt"></span>を選択してください</td>
                <td id="class_category_area1">
                    <select name = "class_category1" id="class_category1" style = "float:none;"></select>
                </td>
            </tr>
            <tr id="class_category_area2">
                <td>ご希望の<span id="classcategory_name2_select_txt"></span>を選択してください</td>
                <td>
                    <select name = "class_category2" id="class_category2" style = "float:none;"></select>
                </td>
            </tr>
        </table>
    </form>
</div>

<!--次回希望日変更-->
<div id="nextdate_change_dialog" style="display:none">
  <form id="nextdate_change">
  <input type="hidden" name="action" value="ChangeNextDate" />
  <input type="hidden" name="order_id" id="nextdate_change_order_id" value="" />
  <table summary="次回希望日の変更" style="margin:0 auto;padding:0;">
    <tr><th>次回希望日を選択してください</th></tr>
    <tr>
      <td>
        <select name="regular_next_date" id="regular_next_date" >
        <!--{section name=cnt start=0 loop=90}-->
        <!--{assign var=time_ts value="+`$smarty.section.cnt.index` day"|strtotime:$regular_config.allowed_first_interval_date_ts}-->
        <!--{assign var=time value=$time_ts|date_format:"%Y-%m-%d"}-->
        <option value="<!--{$time}-->"><!--{$time_ts|date_format:"%Y年%m月%d日"}--></option>
        <!--{/section}-->
        </select>
        <!--<div style="margin-top:5px;">-->
      </td>
    </tr>
    <tr>
      <td><span class="red">※<!--{$regular_config.allowed_first_interval_date|date_format:"%Y年%m月%d日"}-->以降のみ指定可能です。</span></td>
    </tr>
  </table>
  </form>
</div>

<!--希望時間指定変更-->
<div id="delivtime_change_dialog" style="display:none">
  <form id="delivtime_change">
  <input type="hidden" name="action" value="ChangeDelivTime" />
  <input type="hidden" name="order_id" id="delivtime_change_order_id" value="" />
  <table summary="希望時間指定の変更" style="margin:0 auto;padding:0;">
    <tr><th>希望時間指定を選択してください</th></tr>
    <tr>
      <td>
        <span class="red"><!--{$arrErr[$key]}--></span>
        <select name="deliv_time_id" id="deliv_time_id"></select>
        <!--<div style="margin-top:5px;">-->
      </td>
    </tr>
  </table>
  </form>
</div>

<!--お届け先の変更-->
<div id="deliv_addr_change_dialog" style="display:none">
  <form id="delivaddr_change">
  <input type="hidden" name="action" value="ChangeDelivAddr" />
  <input type="hidden" name="order_id" id="delivaddr_change_order_id" value="" />
  <table summary="お届け先の変更" id="deliv_list_table">
  </table>
  </form>
</div>

<div id="js_template" style="display:none">
  <!--お届け先変更ダイアログ-->
<div class="deliv_addr_change_dialog_title">
    <span class="other_deliv_radio"></span>
</div>
  <tr id="deliv_addr_change_dialog_template">
    <td>
        <div class="other_deliv_bg"	>
          <span class="other_deliv_radio"></span>
          <input type="radio" name="other_deliv_id" class="other_deliv_id">
          <span class="other_deliv_text"></span>
        </div>
    </td>
  </tr>
  <!--/お届け先変更ダイアログ-->
  <!--クレジット変更ダイアログ-->
<div class="card_change_dialog_title">
    <span class="card_change_radio"></span>
</div>
<table class="card_change_dialog_template">
  <tr>
    <th id="set_date3" class="card_list_title" colspan="4">
      <input type="radio" name="card_info_id" class="card_info_id">
      <label class="card_change_radio_label"></label>
      <div class="cd_use" style="display:none">利用中</div>
    </th>
  </tr>
  <tr>
    <td class="bg1">カード番号</td>
    <td class="bg1">有効期限</td>
    <td class="bg1">カード名義</td>
    <td class="bg1">カード会社</td>
  </tr>
  <tr>
    <td class="card_num"></td>
    <td class="card_expiration"></td>
    <td class="card_holder"></td>
    <td class="card_brand"></td>
  </tr>
</table>
  <!--/クレジット変更ダイアログ-->
</div>

<div id="cancel_reason_dialog" style="display:none">
  <form id="cancel_reason">
  <input type="hidden" name="action" value="CancelRegular" />
  <input type="hidden" name="order_id" id="cancel_reason_dialog_order_id" value="" />
  <table summary="解約事由の選択" id="cancel_reason_table" class="mouosikomi_tb2" style="margin:0 auto;padding:0;">
    <tr>
      <th>よろしければ解約事由を選択してください。</th>
    </tr>
    <tr>
      <td>
          <select name="canceled_reason_id" id="selected_canceled_reason_id">
            <option value="">----</option>
            <!--{foreach from=$arrCanceledReason item=canceled_reason key=idx}-->
              <option value="<!--{$canceled_reason.canceled_reason_id|escape}-->"><!--{$canceled_reason.canceled_reason_text|escape}--></option>
            <!--{/foreach}-->
          </select>
      </td>
    </tr>
  </table>
  </form>
</div>

<!--クレジット変更-->
<div id="card_change_dialog" style="display:none">
  <form id="regular_card_change">
  <input type="hidden" name="action" value="ChangeRegularCard" />
  <input type="hidden" name="order_id" id="card_change_order_id" value="" />
  <div id="card_change_message" class="change_message"></div>
  <p class="cd_ttl" id="cd_ttl"></p>
  <div id="card_change_card_list">
  </div>
  </form>
</div>

<script type="text/javascript">
// DOMを全て読み込んでから処理する
$(function()
{
	// [.syncer-acdn]にクリックイベントを設定する
	$( '.syncer-acdn' ).click( function()
	{
		// [data-target]の属性値を代入する
		var target = $( this ).data( 'target' ) ;

		// [target]と同じ名前のIDを持つ要素に[slideToggle()]を実行する
		$( '#' + target ).slideToggle() ;

		// 終了
		return false ;
	} ) ;

    var url   = location.href;
    var params    = url.split("#");

    if (1 < params.length) {
        var reg_id = params[1];
        var po = $('#regular_list_' + reg_id).offset().top;
        $('html,body').animate({ scrollTop: po }, 'slow', 'swing', $('#regular_list_' + reg_id).trigger("click"));
    }

    $('.next_info_btn').click( function(){
        $('#next_info_blk_' + $(this).data('id')).toggle('slow');
    });

}) ;

</script>



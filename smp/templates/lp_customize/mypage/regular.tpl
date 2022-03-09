
<!--▼CONTENTS-->
<div id="mypagecolumn">
    <div class="pankuzuarea">
        <p style="letter-spacing:0.01em;font-size:80%;"><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./regular.php">定期申込履歴</a></p>
    </div>
    <div class="mypage_inner">
        <form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
            <input type="hidden" name="order_id" value="" />
            <input type="hidden" name="pageno" value="<!--{$tpl_pageno}-->" />
            <h3>定期申込履歴(変更・解約など)</h3>
            <p class="pd10">定期購入・頒布会のお申し込み履歴の確認をはじめ、詳細から変更・解約などができます。</p>
            <!--{if $tpl_linemax > 0}-->
                <div class="pg_num1">
                   <span class="fts_02">お申し込み履歴:<!--{$tpl_linemax}-->件</span>
                </div>
                <div class="regular_list">
                    <table summary="定期申込一覧">
                        <tr>
                            <th style="width:50%;" class="centertd">申込日時</th>
                            <th style="width:20%;" class="centertd">申込番号</th>
                            <th style="width:30%;" class="centertd">申込金額</th>
                        </tr>
                    </table>
                    <!--{section name=cnt loop=$arrOrder}-->
                    <table summary="定期申込詳細">
                        <tr>
                            <td class="pd5"><!--{$arrOrder[cnt].create_date|sfDispDBDate}--></td>
                            <td class="centertd pd5">
                                <!--{$arrOrder[cnt].order_id}-->
                            </td>
                            <!--{assign var=payment_id value="`$arrOrder[cnt].payment_id`"}-->
                            <!--<td rowspan="2" style="text-align:center"><!--{$arrPayment[$payment_id]|escape}--></td>-->
                            <!--{* 申込時のお支払い合計金額が表示されます。価格変更などを反映させたい場合は↓こちらのコメントアウトを外し、一つ下の行を削除してください  *}-->
                            <!--<td style="width:20%;" class="centertd"><!--{$arrOrder[cnt].current_payment_total|number_format|escape}-->円</td>-->
                            <td class="centertd"><!--{$arrOrder[cnt].payment_total|number_format}-->円</td>
                        </tr>
                        <tr>
                            <td class="centertd" colspan="3">
                                <div class="listbt_area">
                                    <ul>
                                        <li id="regular_list_<!--{$arrOrder[cnt].order_id}-->" class="syncer-acdn" data-target="regular_detail_<!--{$arrOrder[cnt].order_id}-->" onclick="showRegularDetail('<!--{$arrOrder[cnt].order_id}-->')">
                                            <div class="mg_dtbtn"><span class="pst10">申込詳細</span></div>
                                        </li>
                                        <li>
                                            <a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnChangeAction('./change_order_info.php'); fnKeySubmit('order_id','<!--{$arrOrder[cnt].order_id}-->'); return false">
                                                <div class="mg_dtbtn2"><span class="pst10">お届先変更</span></div>
                                            </a>
                                        </li>
                                        <!--{if $arrOrder[cnt].is_amapay_v2}-->
                                        <li class="syncer-acdn" style="padding-left:10px;" onclick="$('#deliv_select_<!--{$arrOrder[cnt].order_id|escape:javascript}-->').val('amapayv2'); change_delivSelect('<!--{$arrOrder[cnt].order_id|escape:javascript}-->'); return false;">
                                            <div class="mg_dtbtn"><span class="pst10">AmazonPay申込情報変更</span></div>
                                        </li>
                                        <!--{/if}-->
                                    </ul>
                                </div>
                                <div style="clear:both;"></div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <div class="regular_detail" id="regular_detail_<!--{$arrOrder[cnt].order_id}-->" style="display:none;margin: 10px 0 0 0;">
                                    <div class="rebular_dtbox">
                                        <h3>定期コース申込詳細&nbsp;&nbsp;<span style="color:#cc0000;" class="regular_stop_status"></span></h3>
                                        <div class="mypage_regstatus">
                                            <table>
                                                <tr>
                                                    <th>購入日時&nbsp;</th>
                                                    <td><!--{$arrOrder[cnt].create_date|escape}--></td>
                                                </tr>
                                                <tr>
                                                    <th>注文番号&nbsp;</th>
                                                    <td><!--{$arrOrder[cnt].order_id|escape}-->
                                                        <span style="color:#ff0000;" id="order_status_<!--{$arrOrder[cnt].order_id}-->"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>お支払方法&nbsp;
                                                        <div class="cdbox_bt">
                                                            <!--▼支払い方法の変更-->
                                                            <span class="mg_changebt4" id="button_changepayment_<!--{$arrOrder[cnt].order_id}-->"  onclick="ChangePayment('<!--{$arrOrder[cnt].order_id}-->');" style="display: none;" />支払変更</span>
                                                            <!--▼利用カード確認・変更ダイアログボタン-->
                                                            <span class="mg_changebt3" id="button_card_change_<!--{$arrOrder[cnt].order_id}-->" onclick="dialogChangeRegularCard('<!--{$arrOrder[cnt].order_id}-->');" style="display: none;">カード変更</span>
                                                            <span class="mg_changebt3" id="button_card_info_<!--{$arrOrder[cnt].order_id}-->" onclick="dialogInfoRegularCard('<!--{$arrOrder[cnt].order_id}-->');" style="display: none;">カード情報</span>
                                                        </div>
                                                    </th>
                                                    <td><!--{$arrOrder[cnt].payment_method|escape}--></td>
                                                </tr>
                                                <tr>
                                                    <th>希望時間指定&nbsp;
                                                        <div class="cdbox_bt">
                                                            <span class="mg_changebt" id="button_deliv_time_<!--{$arrOrder[cnt].order_id|escape}-->" onclick="changeDelivTimeView_toggle('<!--{$arrOrder[cnt].order_id|escape:javascript}-->');">変更する</span>
                                                        </div>
                                                    </th>
                                                    <td>
                                                        <span id="deliv_time_<!--{$arrOrder[cnt].order_id|escape}-->"><!--{if $arrOrder[cnt].deliv_time}--><!--{$arrOrder[cnt].deliv_time|escape}--><!--{else}-->指定なし<!--{/if}--></span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <h4 class="subttl4">▼&nbsp;商品詳細</h4>
                                        <div class="mypage_info_all">
                                            <!--{section name=pr_cont loop=$arrOrder[cnt].products}-->
                                            <div class="mypage_info_left">
                                                <a href="/smp/product/detail/<!--{$arrOrder[cnt].products[pr_cont].product_id}-->">
                                                    <img src="<!--{$smarty.const.URL_DIR}-->resize_image.php?image=<!--{$arrOrder[cnt].products[pr_cont].main_list_image}-->&amp;width=100&amp;height=100" alt="<!--{$arrOrder[cnt].products[pr_cont].product_name|escape}-->" />
                                                </a>
                                            </div>
                                            <div class="mypage_info_right">
                                                <p <!--{if $arrOrder[cnt].products[pr_cont].master_product}-->id="product_code_<!--{$arrOrder[cnt].order_id|escape}-->"<!--{/if}-->><!--{$arrOrder[cnt].products[pr_cont].product_code|escape}--></p>
                                                <p><a href="/smp/product/detail/<!--{$arrOrder[cnt].products[pr_cont].product_id}-->"><!--{$arrOrder[cnt].products[pr_cont].product_name|mb_truncate:35|escape}--></a>
                                                <!--{* 規格がある場合 *}-->
                                                <!--{if $arrOrder[cnt].products[pr_cont].classcategory_id1 > 0}-->
                                                &nbsp;(<span <!--{if $arrOrder[cnt].products[pr_cont].master_product}-->id="classcategory_name1_<!--{$arrOrder[cnt].order_id|escape}-->"<!--{/if}-->><!--{$arrOrder[cnt].products[pr_cont].classcategory_name1|escape}--></span><!--{if $arrOrder[cnt].products[pr_cont].classcategory_id2 > 0}-->・<span <!--{if $arrOrder[cnt].products[pr_cont].master_product}-->id="classcategory_name2_<!--{$arrOrder[cnt].order_id|escape}-->"<!--{/if}-->><!--{$arrOrder[cnt].products[pr_cont].classcategory_name2|escape}--></span><!--{/if}-->)<!--{/if}-->
                                                <!--{* ↑規格表示ここまで *}-->
                                                </p>
                                                <p class="mypage_info_num">数量：<!--{$arrOrder[cnt].products[pr_cont].quantity|number_format|escape}-->個 / 単価：
                                                <!--{* 申込時の単価が表示されます。価格変更などを反映させたい場合は↓ こちらのコメントアウトを外し、一つ下の行を削除してください *}-->
                                                <!--<!--{$arrOrder[cnt].current_price|number_format|escape}-->円</p>-->
                                                <!--{$arrOrder[cnt].products[pr_cont].price|number_format|escape}-->円</p>
                                                <p class="mypage_info_price">小計：<!--{$arrOrder[cnt].products[pr_cont].price*$arrOrder[cnt].products[pr_cont].quantity|number_format}-->円</p>
                                            </div>
                                            <!--{/section}-->
                                            <!--{if $arrOrder[cnt].type == 0 && $change_product_class_enable_flg && $arrOrder[cnt].exist_regular_master_product_class}-->
                                                <span class="mg_sku_changebt" onclick="changeProductView_toggle('<!--{$arrOrder[cnt].order_id}-->');"><!--{$arrOrder[cnt].change_regular_master_product_class_text|escape}-->を変更する</span>
                                                <!--{* ↓規格情報を取得中に表示します。任意の画像などに変更できますが、必ずspanタグ内に入れてください。またidの変更はしないでください。 *}-->
                                                <span id="change_product_class_loading_<!--{$arrOrder[cnt].order_id|escape}-->" style="display: none;">情報取得中......</span>
                                                <span class="change_date">※<b><!--{$arrOrder[cnt].regular_order_master.next_date|date_format:"%Y年%m月%d日"|escape}--></b>お届け分より変更されます</span>
                                            <!--{/if}-->
                                        </div>

                                        <h4 class="bg_gray2">ご注文金額
                                            <div id="info" class="fl_r"><abbr rel="tooltip" title="※初回購入や回数ごとの割引・無料設定は、ここには表示されません.">i</abbr></div>
                                        </h4>

                                        <div class="mypage_regtotal">
                                            <table>
                                                <tr>
                                                    <th>消費税</th>
                                                    <!--{* 申込時の税金が表示されます。価格変更などを反映させたい場合は↓こちらのコメントアウトを外し、一つ下の行を削除してください  *}-->
                                                    <!--<td><!--{$arrOrder[cnt].current_tax|number_format|escape}-->円</td>-->
                                                    <td><!--{$arrOrder[cnt].tax|number_format}-->円</td>
                                                </tr>
                                                <!--{if $arrOrder[cnt].use_point > 0}-->
                                                <tr>
                                                    <th>ポイント値引き</th>
                                                    <td><!--{$arrOrder[cnt].use_point|number_format}-->Pt</td>
                                                </tr>
                                                <!--{/if}-->
                                                <!--{if $arrOrder[cnt].discount > 0}-->
                                                <tr>
                                                    <th>値引き</th>
                                                    <td><!--{$arrOrder[cnt].discount|number_format}-->円</td>
                                                </tr>
                                                <!--{/if}-->
                                                <tr>
                                                    <th>送 料</th>
                                                    <td><!--{$arrOrder[cnt].deliv_fee|number_format}-->円</td>
                                                </tr>
                                                <!--{if $arrOrder[cnt].charge > 0}-->
                                                <tr>
                                                    <th>手数料</th>
                                                    <td><!--{$arrOrder[cnt].charge|number_format}-->円</td>
                                                </tr>
                                                <!--{/if}-->
                                                <!--{if $arrOrder[cnt].relay_fee > 0}-->
                                                <tr>
                                                    <th>離島手数料</th>
                                                    <td><!--{$arrOrder[cnt].relay_fee|number_format}-->円</td>
                                                </tr>
                                                <!--{/if}-->
                                                <tr>
                                                    <th>お支払い合計金額</th>
                                                    <!--{* 申込時のお支払い合計金額が表示されます。価格変更などを反映させたい場合は↓こちらのコメントアウトを外し、一つ下の行を削除してください  *}-->
                                                    <!--<td><em><!--{$arrOrder[cnt].current_payment_total|number_format|escape}-->円</em></td>-->
                                                    <td><em><!--{$arrOrder[cnt].payment_total|number_format}-->円</em></td>
                                                </tr>
                                            </table>
                                        </div>

                                        <br />
                                        <span class="mg_changebt next_info_btn" data-id="<!--{$arrOrder[cnt].order_id|escape}-->" style="float:right; width:200px"><a>次回お支払い合計金額</a></div>
                                        <div class="mypage_regtotal" id="next_info_blk_<!--{$arrOrder[cnt].order_id|escape}-->" style="display:none;">
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

                                        <h3 class="subttl4">▼&nbsp;お届け先</h3>
                                        <div class="mypage_reg_deliv">
                                            <table>
                                                <tr>
                                                    <th colspan="2">
                                                        <p><span id="deliv_name_<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].deliv_name01|escape}-->&nbsp;<!--{$arrOrder[cnt].deliv_name02|escape}--></span>
                                                        (<span id="deliv_kana_<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].deliv_kana01|escape}-->&nbsp;<!--{$arrOrder[cnt].deliv_kana02|escape}--></span>)
                                                        </p>
                                                        <p>
                                                            〒<span id="deliv_zip_<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].deliv_zip01|escape}-->-<!--{$arrOrder[cnt].deliv_zip02|escape}--></span>

                                                            <span id="deliv_addr_<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].pref_name|escape}--><!--{$arrOrder[cnt].deliv_addr01|escape}--><!--{$arrOrder[cnt].deliv_addr02|escape}--></span>
                                                        </p>
                                                        <p><span id="deliv_tel_<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].deliv_tel01|escape}-->-<!--{$arrOrder[cnt].deliv_tel02|escape}-->-<!--{$arrOrder[cnt].deliv_tel03|escape}--></span></p>
                                                    </th>
                                                </tr>

                                                <tr>
                                                    <td colspan="2">
                                                        <h3 class="subttl3">サイクル</h3>
                                                        <div class="pd10" style="overflow:hidden;">
                                                            <span class="pst7" id="cycle_<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].regular_order_master.cycle_jp|escape}--></span>
                                                            <span class="mg_changebt" id="button_cycle_<!--{$arrOrder[cnt].order_id}-->" onclick="changeCycleView_toggle('<!--{$arrOrder[cnt].order_id}-->');">変更する</span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <h3 class="subttl3">次回希望日</h3>
                                                        <div class="pd10" style="overflow:hidden;">
                                                            <span class="pst7" id="next_date_<!--{$arrOrder[cnt].order_id}-->"><!--{$arrOrder[cnt].regular_order_master.next_date|escape}--></span>
                                                            <span class="mg_changebt" id="button_next_<!--{$arrOrder[cnt].order_id}-->" onclick="changeNextDateView_toggle('<!--{$arrOrder[cnt].order_id}-->');">変更する</span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <h3 class="subttl3">お届け先の変更</h3>
                                                        <div class="pd10">
                                                            <div class="custom-selectbox w100">
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
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <div class="pd10">
                                                            <div class="course_dt">
                                                                <ul>
                                                                    <li id="button_skip1_<!--{$arrOrder[cnt].order_id}-->">
                                                                        <a href="javascript:void(0);" onclick="SkipNextRegular('<!--{$arrOrder[cnt].order_id}-->')">スキップ</a>
                                                                    </li>
                                                                    <li id="button_pause_<!--{$arrOrder[cnt].order_id}-->">
                                                                        <a href="javascript:void(0);" onclick="PausedRegular('<!--{$arrOrder[cnt].order_id}-->', 'paused_regular')">一時停止</a>
                                                                    </li>
                                                                    <li id="button_restart_<!--{$arrOrder[cnt].order_id}-->">
                                                                        <a href="javascript:void(0);" onclick="PausedRegular('<!--{$arrOrder[cnt].order_id}-->', 'restart_regular')">お届け再開</a>
                                                                    </li>
                                                                    <li id="button_stop_<!--{$arrOrder[cnt].order_id}-->">
                                                                        <a href="javascript:void(0);" onclick="cancelReason_toggle('<!--{$arrOrder[cnt].order_id}-->')">解約</a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                        <div class="closearea">
                                            <span class="mg_closebt" onclick="$('#regular_detail_<!--{$arrOrder[cnt].order_id}-->').slideToggle();"><a href="javascript:void(0);">閉じる</a></span>
                                        </div>
                                     </div>
                                   </div>
                                </td>
                            </tr>
                        </table>
                        <!--{assign var=payment_id value="`$arrOrder[cnt].payment_id`"}-->
                        <hr/>
                        <!--{/section}-->
                </div>
                <!--{if $tpl_strnavi}-->
                <div class="bg_pgnav">
                    <!--▼ページナビ-->
                    <!--{$tpl_strnavi}-->
                    <!--▲ページナビ-->
                </div>
                <!--{/if}-->
            <!--{else}-->
            <p class="no_data1">定期/頒布会の申込履歴はありません。</p>
            <!--{/if}-->
        </form>
        <div class="mypage_back">
            <a href="./index.php">
                <div class="mg_back">戻る<input type="hidden" name="change" id="change" /></div>
            </a>
        </div>
    </div>
</div>

<!--▼サイクル変更ダイアログ-->
<div id="cycle_change_dialog" style="display:none">
    <form id="cycle_change">
        <input type="hidden" name="action" value="ChangeCycle" />
        <input type="hidden" name="order_id" id="cycle_change_order_id" value="" />
        <div class="mouosikomi_tb2">
            <table summary="サイクルの変更" style="margin:0 auto;padding:0;">
                <tr>
                    <th class="lefttd">ご希望のサイクルを選択してください</th>
                </tr>
                <tr id="cycle_date" style="display: none;">
                    <td>
                        <div id="set_date1">
                            <input type="radio" name="cycle_type" id="cycle_type1" value="1" <!--{if $regular_order_master.cycle_type == 1}-->checked="checked"<!--{/if}-->><label for="cycle_type1"><span>日付で指定</span></label>
                            <div class="cyclebox">
                                <select name="cycle_date_monthly" id="cycle_date_monthly"></select>
                                <select name="cycle_date_day" id="cycle_date_day"></select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr id="cycle_week" style="display: none;">
                    <td>
                        <div id="set_date2">
                            <input type="radio" name="cycle_type" id="cycle_type2" value="2" <!--{if $regular_order_master.cycle_type == 2}-->checked="checked"<!--{/if}-->><label for="cycle_type2"><span>曜日で指定</span></label><br />
                            <div class="cyclebox">
                                <select name="cycle_week_monthly" id="cycle_week_monthly"></select>
                                <select name="cycle_week_ordinal" id="cycle_week_ordinal"></select>
                                <select name="cycle_week_week" id="cycle_week_week"></select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr id="cycle_interval" style="display: none;">
                    <td>
                        <div id="set_date3">
                            <input type="radio" name="cycle_type" id="cycle_type3" value="3" <!--{if $regular_order_master.cycle_type == 3}-->checked="checked"<!--{/if}-->><label for="cycle_type3"><span>間隔で指定</span></label><br />
                            <div class="cyclebox">
                                <select name="cycle_interval_start_date" id="cycle_interval_start_date">
                                    <!--{section name=cnt start=0 loop=$regular_config.interval_range}-->
                                    <!--{assign var=time_ts value="+`$smarty.section.cnt.index` day"|strtotime:$regular_config.allowed_first_interval_date_ts}-->
                                    <!--{assign var=time value=$time_ts|date_format:"%Y-%m-%d"}-->
                                    <option value="<!--{$time}-->" <!--{if $regular_order_master.cycle_interval_start_date == $time}-->selected="selected"<!--{/if}-->><!--{$time_ts|date_format:"%Y年%m月%d日"}--></option>
                                    <!--{/section}-->
                                </select><br />
                                <div style="margin-top:10px;">から<select name="cycle_interval_interval" id="cycle_interval_interval"></select><span>間隔</span></div>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</div>
<!--▲サイクル変更ダイアログ-->

<!--▼次回希望変更ダイアログ-->
<div id="nextdate_change_dialog" style="display:none">
    <form id="nextdate_change">
        <input type="hidden" name="action" value="ChangeNextDate" />
        <input type="hidden" name="order_id" id="nextdate_change_order_id" value="" />
        <div class="mouosikomi_tb2">
            <table summary="次回希望日の変更" style="margin:0 auto;padding:0;">
                <tr>
                    <th class="lefttd">次回希望日を選択してください。</th>
                </tr>
                <tr>
                    <td class="lefttd">
                        <select name="regular_next_date" id="regular_next_date" class="mgt5">
                            <!--{section name=cnt start=0 loop=90}-->
                            <!--{assign var=time_ts value="+`$smarty.section.cnt.index` day"|strtotime:$regular_config.allowed_first_interval_date_ts}-->
                            <!--{assign var=time value=$time_ts|date_format:"%Y-%m-%d"}-->
                            <option value="<!--{$time}-->"><!--{$time_ts|date_format:"%Y年%m月%d日"}--></option>
                            <!--{/section}-->
                        </select><br />
                        <!--<div style="margin-top:5px;">-->
                    </td>
                </tr>
                <tr>
                    <td class="lefttd">※<!--{$regular_config.allowed_first_interval_date|date_format:"%Y年%m月%d日"}-->以降のみ指定可能です。</td>
                </tr>
            </table>
        </div>
    </form>
</div>
<!--▲次回希望変更ダイアログ-->

<!--希望時間指定変更ダイアログ-->
<div id="delivtime_change_dialog" style="display:none">
    <form id="delivtime_change">
        <input type="hidden" name="action" value="ChangeDelivTime" />
        <input type="hidden" name="order_id" id="delivtime_change_order_id" value="" />
        <div class="mouosikomi_tb2">
            <table summary="希望時間指定の変更" style="margin:0 auto;padding:0;">
                <tr><th>希望時間指定を選択してください</th></tr>
                <tr>
                    <td class="lefttd">
                        <span class="red"><!--{$arrErr[$key]}--></span>
                        <select name="deliv_time_id" id="deliv_time_id" class="mgt5"></select><br />
                        <!--<div style="margin-top:5px;">-->
                    </td>
                </tr>
            </table>
        </div>
    </form>
</div>

<div id="deliv_addr_change_dialog" style="display:none">
    <form id="delivaddr_change">
        <input type="hidden" name="action" value="ChangeDelivAddr" />
        <input type="hidden" name="order_id" id="delivaddr_change_order_id" value="" />
        <table summary="お届け先の変更" id="deliv_list_table" class="mouosikomi_tb2" style="margin:0 auto;padding:0;">
        </table>
    </form>
</div>

<div id="js_template" style="display:none">
    <!--お届け先変更ダイアログ-->
    <div class="deliv_addr_change_dialog_title">
        <span class="other_deliv_radio"></span>
    </div>
    <tr id="deliv_addr_change_dialog_template">
        <td class="lefttd">
            <span class="other_deliv_radio"></span>
            <input type="radio" name="other_deliv_id" class="other_deliv_id">
        </td>
        <td class="lefttd">
            <span class="other_deliv_text"></span>
        </td>
    </tr>
    <!--/お届け先変更ダイアログ-->
    <!--クレジット変更ダイアログ-->
    <table class="card_change_dialog_template" summary="利用カードの確認・変更">
        <tr>
            <th id="set_date3" class="card_list_title" colspan="2">
                <input type="radio" name="card_info_id" class="card_info_id">
                <label class="card_change_radio_label"></label>
                <div class="cd_use" style="display:none">利用中</div>
            </th>
        </tr>
        <tr class="payment_bd"><th class="bg1">カード番号</th><td class="card_num"></td></tr>
        <tr class="payment_bd"><th class="bg1">有効期限</th><td class="card_expiration"></td></tr>
        <tr class="payment_bd"><th class="bg1">カード名義</th><td class="card_holder"></td></tr>
        <tr class="payment_bd"><th class="bg1">カード会社</th><td class="card_brand"></td></tr>
    </table>
    <!--/クレジット変更ダイアログ-->
</div>

<!--▼解約事由ダイアログ-->
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
                    <div>
                        <select name="canceled_reason_id" id="selected_canceled_reason_id">
                            <option value="">----</option>
                            <!--{foreach from=$arrCanceledReason item=canceled_reason key=idx}-->
                            <option value="<!--{$canceled_reason.canceled_reason_id|escape}-->"><!--{$canceled_reason.canceled_reason_text|escape}--></option>
                            <!--{/foreach}-->
                        </select>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</div>
<!--▲解約事由ダイアログ-->

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

<!--{* 商品規格変更 *}-->
<div id="product_change_dialog" style="display:none" data-size="300">
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

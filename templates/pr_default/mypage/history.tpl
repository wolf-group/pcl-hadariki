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
<form name="form1" id="form1" method="post" action="">
<input type="hidden" name="mode" value="">
<input type="hidden" name="order_id" value="">
<input type="hidden" name="canceled_reason_id" value="">
<div id="mypagecolumn">
	<div class="head">
		<h2 class="t_mypage">マイページ
		<!--{* ポイント表示 *}-->
		<!--{if $tpl_point}--><!--{include file=$tpl_point}--><!--{/if}-->
		</h2>
	</div>
	<!--{include file=$tpl_navi}-->
	<div id="mycontentsarea">
		<div class="mycont_head">
			<h3>購入履歴詳細</h3>
		</div>
		<div class="myconditionarea">
		 <table>
			<tr>
				<th> 購入日時&nbsp;</th>
				<td><!--{$arrDisp.create_date|sfDispDBDate}--></td>
			</tr>
			<tr>
				<th>注文番号&nbsp;</th>
				<td><!--{$arrDisp.order_id}-->
				<!--{if $arrDisp.status == $smarty.const.ORDER_CANCEL}-->&nbsp;
				  <span style="color:#d00000;">キャンセル</span>
				<!--{elseif $arrDisp.status == $smarty.const.ORDER_COMBINE}-->
				<span style="color:#d00000;">同梱(同梱先：
				<a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnChangeAction('./history.php'); fnKeySubmit('order_id','<!--{$arrDisp.combine_id}-->'); return false"><!--{$arrDisp.combine_id}--></a>)</span>
				<!--{elseif $arrDisp.regular_type == 1}-->
						<span style="color:#d00000;">定期コース(お申し込み)</span>
				<!--{elseif $arrDisp.regular_type == 2}-->
						<span style="color:#d00000;">定期コース(<!--{$arrDisp.regular_cron_times}-->回目)</span>
				<!--{/if}-->
			</tr>
			<!--{if $arrDisp.regular_type == 2}-->
			<tr>
				<th>定期申込番号&nbsp;</th>
				<td>
				<!--{$arrDisp.regular_master_order_id}-->&nbsp;
				</td>
			</tr>
			<!--{/if}-->
			<tr>
				<th>お支払い方法&nbsp;</th>
				<td><!--{$arrPayment[$arrDisp.payment_id]|escape}--></td>
		   </tr>
		  <!--{if $arrDisp.deliv_time_id != ""}-->
			 <tr>
				  <th>希望時間指定&nbsp;</th>
				  <td><!--{$arrDelivTime[$arrDisp.deliv_time_id]|escape}--></td>
			  </tr>
		  <!--{/if}-->
		  
		  <!--{if $arrDisp.deliv_date != ""}-->
			 <tr>
				  <th>希望日指定&nbsp;</th>
				  <td><!--{$arrDisp.deliv_date|escape}--></td>
			  </tr>
		  <!--{/if}-->
			<!--{if $arrDisp.status == $smarty.const.ORDER_DELIV}-->
				<tr>
					<th>配送状況&nbsp;</th>
					<td>発送済み</td>
				</tr>
				<!--{if $arrDisp.commit_date != ""}-->
				<tr>
					<th>発送日&nbsp;</th>
					<td><!--{$arrDisp.commit_date|date_format:"%Y/%m/%d"|escape}--></td>
				</tr>
			<!--{/if}-->
				<!--{if $arrDisp.deliv_no != ""}-->
						<tr>
						<th>配送伝票番号&nbsp;</th>
						<td><!--{$arrDisp.deliv_no|escape}--></td>
						</tr>
					<!--{/if}-->
			<!--{/if}-->



		 </table>	
		</div>
		
		
		<div class="mouosikomi_tb2">
			<table summary="購入商品詳細">
				<tr>
					<th class="centertd">商品コード</th>
					<th class="centertd">商品名</th>
					<th class="centertd">単価</th>
					<th class="centertd">数量</th>
				</tr>
				<!--{section name=cnt loop=$arrDisp.quantity}-->
				<tr>
					<td width="20%"><!--{$arrDisp.product_code[cnt]|escape}--></td>
					<td width="45%"><a href="/product/detail/<!--{$arrDisp.product_id[cnt]}-->"><!--{$arrDisp.product_name[cnt]|mb_truncate:40|escape}--></a></td>
					<!--{assign var=price value=`$arrDisp.price[cnt]`}-->
					<!--{assign var=quantity value=`$arrDisp.quantity[cnt]`}-->
					<td class="pricetd"><!--{$price|escape|default:'0'|number_format}-->円</td>
					<td class="centertd"><!--{$quantity|escape}--></td>
				</tr>
				<!--{/section}-->
				<tr>
					<td colspan="3" class="righttd">お申し込み小計</td>
					<td class="pricetd"><!--{$arrDisp.subtotal-$arrDisp.tax|number_format}-->円</td>
				</tr>
				<tr>
					<td colspan="3" class="righttd">消費税</td>
					<td class="pricetd"><!--{$arrDisp.tax|number_format}-->円</td>
				</tr>
					<!--{assign var=point_discount value="`$arrDisp.use_point*$smarty.const.POINT_VALUE`"}-->
					<!--{if $point_discount > 0}-->
				<tr>
					<td colspan="3" class="righttd">ポイントお値引き</td>
					<td class="pricetd"><!--{$point_discount|number_format}-->円</td>
				</tr>
				<!--{/if}-->
				<!--{assign var=key value="discount"}-->
				<!--{if $arrDisp[$key] != "" && $arrDisp[$key] > 0}-->
				<tr>
					<td colspan="3" class="righttd">お値引き</td>
					<td class="pricetd"><!--{$arrDisp[$key]|number_format}-->円</td>
				</tr>
				<!--{/if}-->
				<tr>
					<td colspan="3" class="righttd">送料</td>
					<td class="pricetd"><!--{assign var=key value="deliv_fee"}--><!--{$arrDisp[$key]|escape|number_format}-->円</td>
				</tr>
				<!--{assign var=key value="charge"}-->
				<!--{if $arrDisp[$key] != "" && $arrDisp[$key] > 0}-->
				<tr>
					<td colspan="3" class="righttd">手数料</td>
					<td class="pricetd"><!--{$arrDisp[$key]|escape|number_format}-->円</td>
				</tr>
				<!--{/if}-->
				<!--{assign var=key value="relay_fee"}-->
				<!--{if $arrDisp[$key] != "" && $arrDisp[$key] > 0}-->
				<tr>
					<td colspan="3" class="righttd">離島手数料</td>
					<td class="pricetd"><!--{$arrDisp[$key]|escape|number_format}-->円</td>
				</tr>
				<!--{/if}-->
				<tr class="totalbg">
					<td colspan="3" class="righttd">お支払い合計</td>
					<td class="pricetd"><span class="price"><!--{$arrDisp.payment_total|number_format}-->円</span></td>
				</tr>
			</table>
	
			<!--{if $point_flg != 2 and $arrDisp.cycle_type == ''}-->
			<!-- 使用ポイントここから -->
			<table summary="使用ポイント">
				<tr>
					<td>ご使用ポイント</td>
					<td class="pricetd"><!--{assign var=key value="use_point"}--><!--{$arrDisp[$key]|number_format|default:0}--> pt</td>
				</tr>
				<tr>
					<td>今回加算されるポイント</td>
					<td class="pricetd"><!--{$arrDisp.add_point|number_format|default:0}--> pt</td>
				</tr>
			</table>
			<!-- 使用ポイントここまで -->
			<!--{/if}-->

			<!--{assign var=key value="invoice_registration_number"}-->
			<!--{if $arrDisp[$key] != null}-->
			<!-- 登録番号ここから -->
			<table summary="登録番号">
				<tr>
					<td>登録番号</td>
					<td class="pricetd"><!--{$arrDisp[$key]|escape}--></td>
				</tr>
			</table>
			<!-- 登録番号ここまで -->
			<!--{/if}-->
		</div>
		
		<h3 class="mycont_headttl3">
		<span>▼お届け先</span>
		</h3>
		<table summary="お届け先" class="delivname" id="delivname">
			<tbody>
				<tr>
					
					<td colspan="2">
                        <!--{assign var=key1 value="deliv_name01"}-->
                        <!--{assign var=key2 value="deliv_name02"}-->
                        <!--{$arrDisp[$key1]|escape}-->&nbsp;<!--{$arrDisp[$key2]|escape}-->
                        
                        <!--{assign var=key1 value="deliv_kana01"}-->
                        <!--{assign var=key2 value="deliv_kana02"}-->
                        (<!--{$arrDisp[$key1]|escape}-->&nbsp;<!--{$arrDisp[$key2]|escape}-->)
                        <br />
                        <!--{assign var=key1 value="deliv_zip01"}-->
                        <!--{assign var=key2 value="deliv_zip02"}-->
                        〒<!--{$arrDisp[$key1]}-->-<!--{$arrDisp[$key2]}-->
                        
                        <!--{assign var=pref value=`$arrDisp.deliv_pref`}-->
                        <!--{assign var=key value="deliv_addr01"}-->
                        <!--{$arrPref[$pref]}--><!--{$arrDisp[$key]|escape}--><!--{assign var=key value="deliv_addr02"}--><!--{$arrDisp[$key]|escape}-->
                        <br />
                        <!--{assign var=key1 value="deliv_tel01"}-->
                        <!--{assign var=key2 value="deliv_tel02"}-->
                        <!--{assign var=key3 value="deliv_tel03"}-->
                        <!--{$arrDisp[$key1]}-->-<!--{$arrDisp[$key2]}-->-<!--{$arrDisp[$key3]}-->
                    </td>
				</tr>
				<!--{if $arrDisp.cycle_type != ''}-->
				<tr>
					<th>サイクル</th>
					<td>
						<span><!--{$date_text}--></span>
					</td>
				</tr>
				<tr>
					<th>次回希望日</th>
					<td>
						<span><!--{$regular_order_master.next_date}--></span>
						<!--{$RegularStatusStr}-->
					</td>
				</tr>
			<!--{/if}-->
			</tbody>
		</table>
		<!--{if $arrDisp.regular_type == 2 and $arrDisp.regular_master_order_id > 0}-->
		<div class="btn_rpst3_2">
				<span class="btn_mgprev"><a href="./regular.php#<!--{$arrDisp.regular_master_order_id}-->">定期申込一覧を見る</a></span>
		</div>
		<!--{/if}-->
		<div class="btn_rpst3_2">
				<span class="btn_mgprev"><a href="/mypage/index.php">戻 る</a></span>
		</div>
	</div>
</div>
</form>

<!--▲CONTENTS-->

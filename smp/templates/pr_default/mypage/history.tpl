<!--▼CONTENTS-->
<form name="form1" id="form1" method="post" action="">
	<input type="hidden" name="mode" value="">
	<input type="hidden" name="order_id" value="">
	<input type="hidden" name="canceled_reason_id" value="">
	<div id="mypagecolumn">
		<div class="pankuzuarea">
			<p>
				<a href="/smp/">HOME</a> 
				&gt; <a href="/smp/mypage/login.php">マイページ</a> 
				&gt; <a href="./history_list.php">購入履歴一覧</a>
				&gt; <a href="./history.php">購入履歴詳細</a>
			</p>
		</div>
		<div class="mypage_inner">
			<h3>購入履歴詳細</h3>
			<div class="mypage_status">
			 <table>
				<tr>
					<th>購入日時&nbsp;</th>
					<td><!--{$arrDisp.create_date|sfDispDBDate}--></td>
				</tr>
				<tr>
					<th>注文番号&nbsp;</th>
					<td>
					<!--{$arrDisp.order_id}-->
					<!--{if $arrDisp.status == $smarty.const.ORDER_CANCEL}-->
						<span style="color:#ff0000;">キャンセル</span>
					<!--{elseif $arrDisp.status == $smarty.const.ORDER_COMBINE}-->
						<span style="color:#ff0000;">同梱(同梱先：<a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnChangeAction('./history.php'); fnKeySubmit('order_id','<!--{$arrDisp.combine_id}-->'); return false"><!--{$arrDisp.combine_id}--></a>)</span>
					<!--{elseif $arrDisp.regular_type == 1}-->
						<span style="color:#ff0000;">定期購入(お申し込み内容)</span>
					<!--{elseif $arrDisp.regular_type == 2}-->
						<span style="color:#ff0000;">定期購入(<!--{$arrDisp.regular_cron_times}-->回目)</span>
					<!--{/if}-->
					</td>
				</tr>
				<!--{if $arrDisp.regular_type == 2 and $arrDisp.regular_master_order_id > 0}-->
				<tr>
					<th>定期申込番号&nbsp;</th>
					<td>
					<!--{$arrDisp.regular_master_order_id}-->
					</td>
				</tr>
				<!--{/if}-->
				<tr>
					<th>お支払い方法&nbsp;</th><td><!--{$arrPayment[$arrDisp.payment_id]|escape}--></td>
				</tr>
					<!--{if $arrDisp.deliv_time_id != ""}-->
						<tr>
							<th>希望時間指定&nbsp;
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

			<div class="mypage_info">
				<h3 class="subttl4">▼&nbsp;商品詳細</h3>
				<!--{section name=cnt loop=$arrDisp.quantity}-->
					<div class="mypage_info_all">
						<div class="mypage_info_left">
							<a href="/smp/product/detail/<!--{$arrDisp.product_id[cnt]}-->">
								<img src="/resize_image.php?image=<!--{$arrDisp.main_list_image[cnt]}-->&amp;width=100&amp;height=100" alt="<!--{$arrDisp.product_name[cnt]|escape}-->" />
							</a>
						</div>
						<div class="mypage_info_right">
							<p><!--{$arrDisp.product_code[cnt]|wordwrap:50:'<wbr />':true}--></p>
							<p><a href="/smp/product/detail/<!--{$arrDisp.product_id[cnt]}-->"><!--{$arrDisp.product_name[cnt]|mb_truncate:35|escape}--></a></p>
							<!--{assign var=price value=`$arrDisp.price[cnt]`}-->
							<!--{assign var=quantity value=`$arrDisp.quantity[cnt]`}-->
							<p class="mypage_info_num">数量 <!--{$quantity|escape}-->個 / 単価：<!--{$price|escape|number_format}-->円</p>
							<!--{assign var=price value=`$arrDisp.price[cnt]`}-->
							<!--{assign var=quantity value=`$arrDisp.quantity[cnt]`}-->
							<p class="mypage_info_price">小計：<!--{assign var=x value=$arrDisp.subtotal-$arrDisp.tax}--><!--{if $x==0}--><!--{assign var=x value=$arrDisp.subtotal}--><!--{/if}--><!--{if !$x}-->0<!--{else}--><!--{$price*$arrDisp.subtotal/$x|sfMultiply:$quantity|number_format}--><!--{/if}-->円</p>
						</div>
					</div>
				<!--{/section}-->
			
			<h4 class="bg_gray2">ご注文金額</h4>
			<div class="mypage_total">
				<table>
					<!--{assign var=point_discount value="`$arrDisp.use_point*$smarty.const.POINT_VALUE`"}-->
					<!--{assign var=key value="tax"}-->
						<tr>
							<th>消費税</th>
							<td><!--{$arrDisp[$key]|number_format}-->円</td>
						</tr>
					<!--{if $point_discount > 0}-->
						<tr>
							<th>ポイント値引き</th>
							<td><!--{$point_discount|number_format}-->円</td>
						</tr>
					<!--{/if}-->
					<!--{assign var=key value="discount"}-->
					<!--{if $arrDisp[$key] != "" && $arrDisp[$key] > 0}-->
						<tr>
							<th>値引き</th>
							<td><!--{$arrDisp[$key]|number_format}-->円</td>
						</tr>
					<!--{/if}-->
						<tr>
							<th>送 料</th>
							<td><!--{assign var=key value="deliv_fee"}--><!--{$arrDisp[$key]|number_format}-->円</td>
						</tr>
					<!--{assign var=key value="charge"}-->
					<!--{if $arrDisp[$key] != "" && $arrDisp[$key] > 0}-->
						<tr>
							<th>手数料</th>
							<td><!--{assign var=key value="charge"}-->
							<!--{$arrDisp[$key]|number_format}-->円</td>
						</tr>
					<!--{/if}-->
					<!--{assign var=key value="relay_fee"}-->
					<!--{if $arrDisp[$key] != "" && $arrDisp[$key] > 0}-->
						<tr>
							<th>離島手数料</th>
							<td>
							<!--{$arrDisp[$key]|number_format}-->円</td>
						</tr>
					<!--{/if}-->
						 <tr>
							<th>合 計</th>
							<td><em><!--{$arrDisp.payment_total|number_format}-->円</em></td>
						</tr>

					<!--{if $point_flg != 2 and $arrDisp.cycle_type == ''}-->
					<!-- 使用ポイントここから -->
						<tr>
							<th>使用ポイント</th>
							<td><!--{assign var=key value="use_point"}--><!--{$arrDisp[$key]|number_format|default:0}--> pt</td>
						</tr>
						<tr>
							<th>加算ポイント</th>
							<td><!--{$arrDisp.add_point|number_format|default:0}--> pt</td>
						</tr>
					<!-- 使用ポイントここまで -->
					<!--{/if}-->

					<!--{assign var=key value="invoice_registration_number"}-->
					<!--{if $arrDisp[$key] != null}-->
					<!-- 登録番号ここから -->
						<tr>
							<th>登録番号</th>
							<td><!--{$arrDisp[$key]|escape}--></td>
						</tr>
					</table>
					<!-- 登録番号ここまで -->
					<!--{/if}-->
				</table>
			</div>
			<div class="mypage_info_deliv" id="deliv">
				<h4 class="subttl4">▼&nbsp;お届け先</h4>
					<table>
						<tr>
							<th colspan="2">
								<!--{assign var=key1 value="deliv_name01"}-->
								<!--{assign var=key2 value="deliv_name02"}-->
								<!--{$arrDisp[$key1]|escape}-->&nbsp;<!--{$arrDisp[$key2]|escape}-->
                                <!--{assign var=key1 value="deliv_kana01"}-->
								<!--{assign var=key2 value="deliv_kana02"}-->
                                （<!--{$arrDisp[$key1]|escape}-->&nbsp;<!--{$arrDisp[$key2]|escape}-->)<br />
                                <!--{assign var=key1 value="deliv_zip01"}-->
								<!--{assign var=key2 value="deliv_zip02"}-->
								〒<!--{$arrDisp[$key1]}-->-<!--{$arrDisp[$key2]}-->
                                <!--{assign var=pref value=`$arrDisp.deliv_pref`}-->
                                <!--{assign var=key value="deliv_addr01"}-->
                                <!--{$arrPref[$pref]}--><!--{$arrDisp[$key]|escape}--><!--{assign var=key value="deliv_addr02"}--><!--{$arrDisp[$key]|escape}--><br />
                                <!--{assign var=key1 value="deliv_tel01"}-->
								<!--{assign var=key2 value="deliv_tel02"}-->
								<!--{assign var=key3 value="deliv_tel03"}-->
								<!--{$arrDisp[$key1]}-->-<!--{$arrDisp[$key2]}-->-<!--{$arrDisp[$key3]}-->
							</th>
						</tr>
						<!--{if $arrDisp.cycle_type != ''}-->
						<tr>
							<td colspan="2">
							 <h3 class="subttl3">サイクル</h3>
							  <div class="pd10" style="overflow:hidden;"><!--{$date_text}--></div>
							 </td>
						 </tr>
						 <tr>
							<td colspan="2">
							<h3 class="subttl3">次回希望日</h3>
								<div class="pd10" style="overflow:hidden;"><!--{$arrDisp.next_date}--></div>
							</td>
						  </tr>
						<!--{/if}-->
						
					</table>
		</div>
		<!--{if $arrDisp.regular_type == 2 and $arrDisp.regular_master_order_id > 0}-->
		<div class="mypage_back">
				<a href="./regular.php#<!--{$arrDisp.regular_master_order_id}-->">
					<div class="mg_back">定期申込一覧を見る</div>
				</a>
		</div>
		<!--{/if}-->
		  <div class="mypage_back">
				<a href="./index.php">
					<div class="mg_back">戻る<input type="hidden" name="change" id="change" /></div>
				</a>
		  </div>
	</div>
</form>
<script type="text/javascript">
function fnEditOrderInfo(){
	document.form1['order_id'].value = '<!--{$arrDisp.order_id}-->';
	document.form1['action'] = './change_order_info.php';
	document.form1.submit();
}
</script>

<!--▲CONTENTS-->

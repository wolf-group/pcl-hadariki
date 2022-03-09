<!--{*
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
 *}-->
<!--▼CONTENTS-->
<div id="shoppingcolumn">

	<!--Start Flow Area-->
	<div class="flowarea">
         <img src="<!--{$TPL_DIR}-->img/shopping/flow01.png" style="margin:0 auto;" />
	</div>
	<!--End Flow Area-->

	<div class="head">
		<h2 class="t_deliv">お届け先の指定</h2>
	</div>
    <!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable && $chosen_payment_amazon_pay_v2}-->
        <button type="button" id="AmazonPayChangeAddressButton">AmazonPay お届け先住所変更</button><!--{amazon_pay_change_address_button button_id='AmazonPayChangeAddressButton' action='changeAddress'}-->
    <!--{else}-->
        <p class="deli_word">下記一覧よりお届け先住所を選択して、「選択したお届け先に送る」ボタンをクリックしてください。<br />
            一覧にご希望の住所が無い場合は、「新しいお届け先を追加する」より追加登録してください。<br />
        ※最大20件まで登録できます。</p>
        <!--{if $tpl_addrmax < $smarty.const.DELIV_ADDR_MAX}-->
        <p class="btnbox_l">
            <a href="<!--{$smarty.const.URL_DIR}-->mypage/delivery_addr.php" onclick="win02('<!--{$smarty.const.URL_DIR}-->mypage/delivery_addr.php?page=<!--{$smarty.server.PHP_SELF|escape}-->','new_deiv','600','640'); return false;">新しいお届け先を追加する<input type="hidden" name="addition" id="addition" /></a>
        </p>
    <!--{/if}-->
	<div style="clear:both;"> </div>
	<!--{/if}-->
	<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
		<input type="hidden" name="mode" value="customer_addr" />
		<input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
		<input type="hidden" name="other_deliv_id" value="" />
		<!--{if $arrErr.deli != ""}-->
		<p class="attention"><!--{$arrErr.deli}--></p>
		<!--{/if}-->
		<table summary="お届け先の指定">
			<tr>
				<th>選択</th>
				<th>住所種類</th>
                <th>お届け先</th>
                <!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable}-->
                <th></th>
                <th></th>
                <!--{else}-->
				<th>変更</th>
                <th>削除</th>
                <!--{/if}-->
			</tr>
		<!--{section name=cnt loop=$arrAddr}-->
		<tr>
			<td class="centertd">
			<!--{if $smarty.section.cnt.first}-->
				<input type="radio" name="deliv_check" id="chk_id_<!--{$smarty.section.cnt.iteration}-->" value="-1" <!--{if $arrForm.deliv_check.value == "" || $arrForm.deliv_check.value == -1}--> checked="checked"<!--{/if}--> />
			<!--{else}-->
				<input type="radio" name="deliv_check" id="chk_id_<!--{$smarty.section.cnt.iteration}-->" value="<!--{$arrAddr[cnt].other_deliv_id}-->" <!--{if $arrForm.deliv_check.value == $arrAddr[cnt].other_deliv_id}--> checked="checked"<!--{/if}--> />
			<!--{/if}-->
			</td>
			<td>
				<label for="chk_id_<!--{$smarty.section.cnt.iteration}-->">
                <!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable && $chosen_payment_amazon_pay_v2}-->
                    AmazonPayお届け先住所
				<!--{elseif $smarty.section.cnt.first}-->
					会員登録住所
				<!--{else}-->
					追加登録住所
				<!--{/if}-->
				</label>
			</td>
			<td>
				<!--{assign var=key value=$arrAddr[cnt].pref}-->
				<!--{$arrPref[$key]}--><!--{$arrAddr[cnt].addr01|escape}--><!--{$arrAddr[cnt].addr02|escape}--><br />
				<!--{$arrAddr[cnt].name01|escape}--> <!--{$arrAddr[cnt].name02|escape}-->
			</td>
			<td class="centertd">
				<!--{if !$smarty.section.cnt.first}-->
					<div class="btn_fv"><a href="<!--{$smarty.const.URL_DIR}-->mypage/delivery_addr.php" onclick="win02('<!--{$smarty.const.URL_DIR}-->mypage/delivery_addr.php?page=<!--{$smarty.server.PHP_SELF|escape}-->&amp;other_deliv_id=<!--{$arrAddr[cnt].other_deliv_id}-->','new_deiv','600','640'); return false;">変更</a></div>
				<!--{/if}-->
			</td>
			<td class="centertd">
				<!--{if !$smarty.section.cnt.first}-->
					<div class="btn_fv"><a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('delete', 'other_deliv_id', '<!--{$arrAddr[cnt].other_deliv_id}-->'); return false">削除</a></div>
				<!--{/if}-->
			</td>
			</tr>
			<!--{/section}-->
		</table>
		<p style="height:15px;"></p>
		<!--Start Button Page Movie-->
			<div class="btn_rpst1">
				<span class="btn_prev">
					<a href="/cart/index.php" onclick="document.form1.submit();">前のページへ</a>
				</span>
			</div>
			<div class="btn_rpst2">
				<span class="btn_next">
					<a href="javascript:void(0);" onclick="document.form1.submit();">選択したお届け先に送る<input type="hidden" name="send_button" id="send_button" /></a>
				</span>
			</div>
		<!--End Button Page Movie-->

	</form>
</div>
<!--▲CONTENTS-->


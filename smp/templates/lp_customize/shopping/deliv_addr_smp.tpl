<div id="shoppingcolumn">
	<div class="shopping_inner">
        <h2>お届け先の指定</h2>
        <!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable}-->
            <button type="button" id="AmazonPayChangeAddressButton">AmazonPay お届け先住所変更</button><!--{amazon_pay_change_address_button button_id='AmazonPayChangeAddressButton' action='changeAddress'}-->
        <!--{else}-->
            <p>
                下記一覧よりお届け先住所を選択して、「選択したお届け先へ」ボタンをクリックしてください。<br />
                一覧にご希望の住所が無い場合は、「新しいお届け先を追加する」ボタンより追加登録してください。<br />
                ※最大20件まで登録できます。
            </p>
            <!--{if $tpl_addrmax < $smarty.const.DELIV_ADDR_MAX}-->
            <ul>
                <li class="nm_btn">
                    <!-- <a href="<!--{$smarty.const.URL_DIR}-->smp/mypage/delivery_addr_smp.php?page=<!--{$smarty.server.PHP_SELF|escape|replace:'/smp':''}-->" > -->
                    <a href="<!--{$smarty.const.URL_DIR}-->smp/mypage/delivery_addr_smp.php?page=<!--{$smarty.server.PHP_SELF|escape}-->" >新しいお届け先を追加する<input type="hidden" name="addition" id="addition" /></a>
                </li>
            </ul>
            <!--{/if}-->
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
					<th width="50">選択</th>
					<th>お届け先</th>
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
						<!--{assign var=key value=$arrAddr[cnt].pref}-->
						<div>
							<!--{$arrPref[$key]}--><br /><!--{$arrAddr[cnt].addr01|escape}--><br /><!--{$arrAddr[cnt].addr02|escape}--><br />
							<!--{$arrAddr[cnt].name01|escape}--> <!--{$arrAddr[cnt].name02|escape}-->
						</div>
						<div>
							<!--{if !$smarty.section.cnt.first}-->
								<a href="<!--{$smarty.const.URL_DIR}-->smp/mypage/delivery_addr_smp.php?page=<!--{$smarty.server.PHP_SELF|escape}-->&amp;other_deliv_id=<!--{$arrAddr[cnt].other_deliv_id}-->" >変更</a>
							<!--{/if}-->
							<!--{if !$smarty.section.cnt.first}-->
								<a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('delete', 'other_deliv_id', '<!--{$arrAddr[cnt].other_deliv_id}-->'); return false">削除</a>
							<!--{/if}-->
						</div>
						</td>
					</tr>
				<!--{/section}-->
			</table>
		</form>
	</div>
	<ul>
		<li class="prv_btn">
			<a href="<!--{$smarty.const.URL_DIR}-->smp/shopping/deliv_smp.php">戻る<input type="hidden" name="back03" id="back03" /></a>
		</li>
		<li class="nx_btn">
			<a href="javascript:void(0);" onclick="document.form1.submit();">選択したお届け先に送る<input type="hidden" name="send_button" id="send_button" /></a>
		</li>
	</ul>
</div>

<script type="text/javascript">
<!--{$tpl_javascript}-->

</script>
<div id="windowcolumn">
	<div id="windowarea">
		<h2><!--{$title}--></h2>
		<p class="windowtext">
			在庫通知希望メール送信画面です。<br />
			「<span class="attention">※</span>」印は入力必須項目です。<br />
			ご入力後、一番下の「登録」ボタンをクリックしてください。
		</p>
		<form name="form1" method="post" action="">
			<input type="hidden" name="mode" value="confirm" />
			<input type="hidden" name="product_id" value="<!--{$arrForm.product_id}-->" />
			<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
			<table summary="<!--{$title}-->">
				<tr>
					<th>商品名</th>
					<td><!--{$arrForm.name|escape}--></td>
				</tr>
				<!--{if $tpl_classcat_find1}-->
				<tr>
					<th>規格名<span class="attention">※</span></th>
					<td>
						<dl>
							<dt>
							<!--{$tpl_class_name1|escape}-->
							</dt>
							<dd>
								<select name="classcategory_id1"
									style="<!--{$arrErr.classcategory_id1|sfGetErrorColor}-->"
									onchange="lnSetSelect('form1', 'classcategory_id1', 'classcategory_id2', ''); ">
									<option value="">選択してください</option>
									<!--{html_options options=$arrClassCat1 selected=$arrForm.classcategory_id1}-->
								</select>
								<!--{if $arrErr.classcategory_id1 != ""}-->
								<br /><span class="attention">※ <!--{$tpl_class_name1|escape}-->を入力して下さい。</span>
								<!--{/if}-->
							</dd>
						</dl>
						<!--{if $tpl_classcat_find2}-->
						<dl>
							<dt><!--{$tpl_class_name2|escape}--></dt>
							<dd>
								<select name="classcategory_id2"
									style="<!--{$arrErr.classcategory_id2|sfGetErrorColor}-->">
									<option value="">選択してください</option>
								</select>
								<!--{if $arrErr.classcategory_id2 != ""}-->
								<br />
								<span class="attention">※ <!--{$tpl_class_name2|escape}-->を入力して下さい。</span>
								<!--{/if}-->
							</dd>
						</dl>
						<!--{/if}-->
					</td>
				</tr>
				<!--{/if}-->
				<!--{if !$is_login}-->
				<tr>
					<th>お名前</th>
					<td>
						姓&nbsp;<input type="text" name="sender_name01" value="<!--{$arrForm.sender_name01}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.sender_name01|sfGetErrorColor}-->;" size="15" class="box120" />&nbsp;
						名&nbsp;<input type="text" name="sender_name02" value="<!--{$arrForm.sender_name02}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.sender_name02|sfGetErrorColor}-->;" size="15" class="box120" />
						<div class="attention"><!--{$arrErr.sender_name01}--><!--{$arrErr.sender_name02}--></div>
					</td>
				</tr>
				<tr>
					<th>お名前<br />(ﾌﾘｶﾞﾅ)</th>
					<td>
						ｾｲ&nbsp;<input type="text" name="sender_kana01" value="<!--{$arrForm.sender_kana01}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.sender_kana01|sfGetErrorColor}-->;" size="15" class="box120" />&nbsp;
						ﾒｲ&nbsp;<input type="text" name="sender_kana02" value="<!--{$arrForm.sender_kana02}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.sender_kana02|sfGetErrorColor}-->;" size="15" class="box120" />
						<div class="attention"><!--{$arrErr.sender_kana01}--><!--{$arrErr.sender_kana02}--></div>
					</td>
				</tr>
				<tr>
					<th>メール<br />アドレス<span class="attention">※</span></th>
					<td>
						<input type="text" name="sender_email" value="<!--{$arrForm.sender_email}-->" style="<!--{$arrErr.sender_email|sfGetErrorColor}-->;" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" size="40" class="box300" inputmode="email" /><div class="attention"><!--{$arrErr.sender_email}--></div>
					</td>
				</tr>
				<!--{/if}-->
			</table>
		</form>
	</div>
</div>
<ul class="btn_area">
	<li class="nx_btn">
		<a href="/smp/product/detail/<!--{$arrForm.product_id}-->">買い物を続ける</a>
	</li>
	<li class="nx_btn">
		<a href="javascript:void(0);" onclick="fnModeSubmit('confirm','product_id','<!--{$arrForm.product_id}-->'); return false;">登録</a>
	</li>
</ul>
<script type="text/javascript">
<!--{$tpl_onload}-->
</script>

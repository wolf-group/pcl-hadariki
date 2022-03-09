<!--{include file=$common_request_header_tpl}-->
<script type="text/javascript">
<!--{$tpl_javascript}-->

</script>

<body onload="preLoadImg('<!--{$TPL_DIR}-->')">

<div id="windowcolumn">
	<div id="windowarea">
		<div class="head">
			<h2 class="t_mypage">入荷通知希望メール送信</h2>
		</div>
		<p class="windowtext">入荷お知らせメール送信画面です。 <br />
		ご入力後、一番下の「確認ページへ」ボタンをクリックしてください。</p>
		<form name="form1" method="post" action="">
			<input type="hidden" name="mode" value="confirm" />
			<input type="hidden" name="product_id" value="<!--{$arrForm.product_id}-->" />
			<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
			<table>
				<tr>
					<th>商品名</th>
					<td><!--{$arrForm.name|escape}--></td>
				</tr>
				<!--{if $tpl_class_name1}-->
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
					<span class="attention"><!--{$arrErr.sender_name01}--><!--{$arrErr.sender_name02}--></span>
		            姓&nbsp;<input type="text" name="sender_name01" value="<!--{$arrForm.sender_name01|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.sender_name01|sfGetErrorColor}-->; ime-mode: active;" class="box120" />&nbsp;
		            名&nbsp;<input type="text" name="sender_name02" value="<!--{$arrForm.sender_name02|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.sender_name02|sfGetErrorColor}-->; ime-mode: active;" class="box120" />
					</td>
				</tr>
				<tr>
				<th>お名前（フリガナ）</th>
					<td>
					<span class="attention"><!--{$arrErr.sender_kana01}--><!--{$arrErr.sender_kana02}--></span>
					セイ&nbsp;<input type="text" name="sender_kana01"  class="box120" value="<!--{$arrForm.sender_kana01|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.sender_kana01|sfGetErrorColor}-->; ime-mode: active;" />&nbsp;
					メイ&nbsp;<input type="text" name="sender_kana02"  class="box120" value="<!--{$arrForm.sender_kana02|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.sender_kana02|sfGetErrorColor}-->; ime-mode: active;" />
					</td>
				</tr>
				<tr>
					<th>メールアドレス<span class="attention">※</span></th>
					<td>
						<span class="attention"><!--{$arrErr.sender_email}--><!--{$arrErr.sender_email02}--></span>
						<div id="undercolumn_entry"><input type="text" name="sender_email"   class="box320" value="<!--{$arrForm.sender_email|escape}-->" style="<!--{$arrErr.sender_email|sfGetErrorColor}-->; ime-mode: disabled;" /></div>

					</td>
				</tr>
				<!--{/if}-->
			</table>
			<ul class="btn_area_l2">
				<li class="btn">
					<span class="btn_next">
						<a href="javascript:void(0);" onclick="fnModeSubmit('confirm','product_id','<!--{$arrForm.product_id}-->'); return false;">登録<input type="hidden" name="conf" id="conf" /></a>
					</span>
				</li>
			</ul>

		</form>
	</div>
</div>
<script type="text/javascript">

<!--{$tpl_onload}-->
</script>
</body>
</html>
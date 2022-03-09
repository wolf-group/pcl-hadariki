<div id="entrycolumn">
	<div class="entry_inner">
		<h2>会員登録</h2>
		<p>
			下記の内容で送信してもよろしいでしょうか？<br />
			よろしければ、一番下の「会員登録完了へ」ボタンをクリックしてください。
		</p>
		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="complete">
			<!--{foreach from=$list_data key=key item=item}-->
				<input type="hidden" name="<!--{$key|escape}-->" value="<!--{$item|escape}-->" />
			<!--{/foreach}-->
			<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
			<div class="entry_info">
				<ul>
					<li class="entry_info_head">お名前<span class="attention">※</span></li>
					<li class="entry_info_inner">
						<!--{$list_data.name01|escape}-->&nbsp;
						<!--{$list_data.name02|escape}-->
					</li>
					<li class="entry_info_head">お名前(ﾌﾘｶﾞﾅ)<span class="attention">※</span></li>
					<li class="entry_info_inner">
						<!--{$list_data.kana01|escape}-->&nbsp;
						<!--{$list_data.kana02|escape}-->
					</li>
					<li class="entry_info_head">郵便番号<span class="attention">※</span></li>
					<li class="entry_info_inner">〒<!--{$list_data.zip01|escape}--> - <!--{$list_data.zip02|escape}--></li>
					<li class="entry_info_head">住所<span class="attention">※</span></li>
					<li class="entry_info_inner"><!--{$arrPref[$list_data.pref]|escape}--><!--{$list_data.addr01|escape}--><!--{$list_data.addr02|escape}--></li>
					<li class="entry_info_head">電話番号<span class="attention">※</span></li>
					<li class="entry_info_inner"><!--{$list_data.tel01|escape}--> - <!--{$list_data.tel02|escape}--> - <!--{$list_data.tel03|escape}--></li>
					<li class="entry_info_head">FAX</li>
					<li class="entry_info_inner">
						<!--{if strlen($list_data.fax01) > 0 && strlen($list_data.fax02) > 0 && strlen($list_data.fax03) > 0}-->
							<!--{$list_data.fax01|escape}--> - <!--{$list_data.fax02|escape}--> - <!--{$list_data.fax03|escape}-->
						<!--{else}-->
							未登録
						<!--{/if}-->
					</li>
					<li class="entry_info_head">メールアドレス<span class="attention">※</span></li>
					<li class="entry_info_inner">
						<a href="mailto:<!--{$list_data.email|escape:'hex'}-->"><!--{$list_data.email|escape:'hexentity'}--></a>
					</li>
					<li class="entry_info_head">性別<!--{if $req_setting.pc_sex == 'REQUIRED'}--><span class="attention">※</span><!--{/if}--></li>
					<li class="entry_info_inner">
						<!--{if $list_data.sex eq 1}-->
							男性
						<!--{elseif $list_data.sex eq 2}-->
							女性
						<!--{else}-->
							未回答
						<!--{/if}-->
					</li>
					<li class="entry_info_head">職業</li>
					<li class="entry_info_inner"><!--{$arrJob[$list_data.job]|escape|default:"未登録"}--></li>
					<li class="entry_info_head">生年月日<!--{if $req_setting.pc_birth == 'REQUIRED'}--><span class="attention">※</span><!--{/if}--></li>
					<li class="entry_info_inner">
						<!--{if strlen($list_data.year) > 0 && strlen($list_data.month) > 0 && strlen($list_data.day) > 0}-->
							<!--{$list_data.year|escape}-->年<!--{$list_data.month|escape}-->月<!--{$list_data.day|escape}-->日
						<!--{else}-->
							未回答
						<!--{/if}-->
					</li>
					<li class="entry_info_head">希望するパスワード<span class="attention">※</span></li>
					<li class="entry_info_inner"><!--{$passlen}--></li>
					<!--{if $arrMailCompulsionView eq "OFF"}-->
						<li class="entry_info_head">メールマガジン送付について<span class="attention">※</span></li>
						<li class="entry_info_inner">
							<!--{if $list_data.mailmaga_flg eq 1 || $list_data.mailmaga_flg eq 2}-->
								受け取る
							<!--{else}-->
								受け取らない
							<!--{/if}-->
						</li>
					<!--{/if}-->
				</ul>
			</div>
		</form>
	</div>
</div>
<ul class="btn_area2">
	<li class="prv_btn2">
		<a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('return', '', ''); return false;">戻る</a>
	</li>
	<li class="nx_btn2">
		<input type="submit" onclick="document.form1.submit();" value="送信" id="to_confirm_btn"/>
	</li>
</ul>

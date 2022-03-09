<div id="guidecolumn">
	<div class="guide_inner">
		<h2>お問い合わせ</h2>
		<p>
			下記入力内容で送信してもよろしいでしょうか？<br />
			よろしければ、一番下の「送信」ボタンをクリックしてください。
		</p>
		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="complete" />
			<!--{foreach key=key item=item from=$arrForm}-->
				<!--{if $key ne 'mode'}-->
					<input type="hidden" name="<!--{$key|escape}-->" value="<!--{$item|escape}-->" />
				<!--{/if}-->
			<!--{/foreach}-->
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$transactionid|escape}-->" />

			<div class="guide_info">
				<ul>
					<li class="guide_info_head">お名前<span class="attention">※</span></li>
					<li class="guide_info_inner02"><!--{$arrForm.name01|escape}-->　<!--{$arrForm.name02|escape}--></li>
					<li class="guide_info_head">お名前(ﾌﾘｶﾞﾅ)<span class="attention">※</span></li>
					<li class="guide_info_inner02"><!--{$arrForm.kana01|escape}-->　<!--{$arrForm.kana02|escape}--></li>
					<li class="guide_info_head">郵便番号</li>
					<li class="guide_info_inner02">
						<!--{if strlen($arrForm.zip01) > 0 && strlen($arrForm.zip02) > 0}-->
							〒<!--{$arrForm.zip01|escape}-->-<!--{$arrForm.zip02|escape}-->
						<!--{/if}-->
					</li>
					<li class="guide_info_head">住所</li>
					<li class="guide_info_inner02"><!--{$arrPref[$arrForm.pref]}--><!--{$arrForm.addr01|escape}--><!--{$arrForm.addr02|escape}--></li>
					<li class="guide_info_head">電話番号</li>
					<li class="guide_info_inner02">
						<!--{if strlen($arrForm.tel01) > 0 && strlen($arrForm.tel02) > 0 && strlen($arrForm.tel03) > 0}-->
							<!--{$arrForm.tel01|escape}-->-<!--{$arrForm.tel02|escape}-->-<!--{$arrForm.tel03|escape}-->
						<!--{/if}-->
					</li>
					<li class="guide_info_head">e-mail<span class="attention">※</span></li>
					<li class="guide_info_inner02"><a href="mailto:<!--{$arrForm.email|escape:'hex'}-->"><!--{$arrForm.email|escape:'hexentity'}--></a></li>
					<!--{if $arrForm.contact_type}-->
					<li class="guide_info_head">お問い合わせ種別<!--{if $contactRequired === $contact_stting_required}--><span class="attention">※</span><!--{/if}--></li>
					<li class="guide_info_inner02"><!--{$arrForm.contact_type|escape}--></li>
					<!--{/if}-->
					<li class="guide_info_head">お問合せ内容<span class="attention">※</span></li>
					<li class="guide_info_inner02"><!--{$arrForm.contents|escape|nl2br}--></li>
				</ul>
			</div>
		</form>
	</div>
</div>
<ul class="btn_area">
	<li class="prv_btn">
		<a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('return', '', ''); return false;">戻る<input type="hidden" name="back02" id="back02" /></a>
	</li>
	<li class="nx_btn">
		<a href="javascript:void(0);" onclick="document.form1.submit();">送信<input type="hidden" name="send" id="send"/></a>
	</li>
</ul>

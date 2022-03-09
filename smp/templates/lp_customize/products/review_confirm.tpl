<a name="top" id="top"></a>
<div id="windowcolumn">
	<div id="windowarea">
		<h2>お客様の声書き込み</h2>
		<form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="complete" />
			<input type="hidden" name="product_id" value="<!--{$arrForm.product_id}-->" />
			<!--{foreach from=$arrForm key=key item=item}-->
				<!--{if $key ne "mode"}-->
					<input type="hidden" name="<!--{$key|escape}-->" value="<!--{$item|escape}-->" />
				<!--{/if}-->
			<!--{/foreach}-->
			<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
			<div class="detail_info">
				<ul>
					<li class="detail_info_head">商品名</li>
					<li class="detail_info_inner"><!--{$arrForm.name|escape}--></li>
					<li class="detail_info_head">投稿者名<span class="attention">※</span></li>
					<li class="detail_info_inner"><!--{$arrForm.reviewer_name|escape}--></li>
					<li class="detail_info_head">ホームページアドレス</li>
					<li class="detail_info_inner"><!--{$arrForm.reviewer_url|escape}--></li>
					<li class="detail_info_head">性別</li>
					<li class="detail_info_inner"><!--{if $arrForm.sex eq 1 }-->男性<!--{elseif $arrForm.sex eq 2 }-->女性<!--{/if}--></li>
					<li class="detail_info_head">おすすめレベル<span class="attention">※</span></li>
					<li class="detail_info_inner"><span class="attention"><!--{$arrRECOMMEND[$arrForm.recommend_level]}--></span></li>
					<li class="detail_info_head">タイトル</li>
					<li class="detail_info_inner"><!--{$arrForm.title|escape}--></li>
					<li class="detail_info_head">コメント<span class="attention">※</span></li>
					<li class="detail_info_inner"><!--{$arrForm.comment|escape|nl2br}--></li>
				</ul>
			</div>
		</form>
	</div>
</div>
<ul class="btn_area">
	<li class="prv_btn">
		<a href="javascript:void(0);" onclick="document.form1.mode.value='return';document.form1.submit();">戻る</a>
	</li>
	<li class="nx_btn">
		<a href="javascript:void(0);" onclick="document.form1.submit();">送信</a>
	</li>
</ul>

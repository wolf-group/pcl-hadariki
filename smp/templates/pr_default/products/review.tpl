<div id="windowcolumn">
	<div id="windowarea">
		<h2>お客様の声書き込み</h2>
		<p class="windowtext">
			以下の商品について、お客様のご意見、ご感想をどしどしお寄せください。<br />
			「<span class="attention">※</span>」印は入力必須項目です。<br />
			ご入力後、一番下の「確認ページへ」ボタンをクリックしてください。
		</p>
		<form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="confirm" />
			<input type="hidden" name="product_id" value="<!--{$arrForm.product_id}-->" />
			<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
			<div class="detail_info">
				<ul>
					<li class="detail_info_head">商品名</li>
					<li class="detail_info_inner"><!--{$arrForm.name|escape}--></li>
					<li class="detail_info_head">投稿者名<span class="attention">※</span></li>
					<li class="detail_info_inner">
						<span class="attention"><!--{$arrErr.reviewer_name}--></span><input type="text" name="reviewer_name" value="<!--{$arrForm.reviewer_name|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.reviewer_name|sfGetErrorColor}-->" size="40" class="box350" />
					</li>
					<li class="detail_info_head">ホームページアドレス</li>
					<li class="detail_info_inner">
						<span class="attention"><!--{$arrErr.reviewer_url}--></span><input type="text" name="reviewer_url" value="<!--{$arrForm.reviewer_url|escape}-->" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" style="<!--{$arrErr.reviewer_url|sfGetErrorColor}-->" size="40" class="box350" />
					</li>
					<li class="detail_info_head">性別</li>
					<li class="detail_info_inner">
						<input type="radio" name="sex" id="man" value="1" <!--{if $arrForm.sex eq 1}--> checked="checked"<!--{/if}--> /><label for="man">男性</label>&nbsp;
						<input type="radio" name="sex" id="woman" value="2" <!--{if $arrForm.sex eq 2}--> checked="checked"<!--{/if}--> /><label for="woman">女性</label>
					</li>
					<li class="detail_info_head">おすすめレベル<span class="attention">※</span></li>
					<li class="detail_info_inner">
						<span class="attention"><!--{$arrErr.recommend_level}--></span>
						<select name="recommend_level" style="<!--{$arrErr.recommend_level|sfGetErrorColor}-->">
							<option value="" selected="selected">選択してください</option>
							<!--{html_options options=$arrRECOMMEND selected=$arrForm.recommend_level}-->
						</select>
					</li>
					<li class="detail_info_head">タイトル</li>
					<li class="detail_info_inner">
						<span class="attention"><!--{$arrErr.title}--></span>
						<input type="text" name="title" value="<!--{$arrForm.title|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.title|sfGetErrorColor}-->" size="40" class="box350" />
					</li>
					<li class="detail_info_head">コメント<span class="attention">※</span></li>
					<li class="detail_info_inner">
						<span class="attention"><!--{$arrErr.comment}--></span>
						<textarea name="comment" cols="50" rows="10" style="<!--{$arrErr.comment|sfGetErrorColor}-->width:100%;" ><!--{$arrForm.comment|escape}--></textarea>
					</li>
				</ul>
			</div>
		</form>
	</div>
</div>
<ul class="btn_area">
	<li class="nx_btn">
		<a href="/smp/product/detail/<!--{$arrForm.product_id}-->">買い物を続ける</a>
	</li>
	<li class="nx_btn">
		<a href="javascript:void(0);" onclick="document.form1.submit();">確認ページへ</a>
	</li>
</ul>


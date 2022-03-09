<div id="entrycolumn">
	<div class="entry_inner">
		<h2>会員登録</h2>
		<div id="completetext">
			<em>会員登録の受付が完了いたしました。</em>
			<p>
				現在<em>仮会員</em>の状態です。<br />
				ご入力いただいたメールアドレス宛てに、ご連絡が届いておりますので、本会員登録になった上でお買い物をお楽しみください。<br />
				今後ともご愛顧賜りますようよろしくお願い申し上げます。
			</p>
			<p>
				<!--{$arrSiteInfo.company_name|escape}--><br />
				TEL：<!--{$arrSiteInfo.tel01}-->-<!--{$arrSiteInfo.tel02}-->-<!--{$arrSiteInfo.tel03}--> <!--{if $arrSiteInfo.business_hour != ""}-->（受付時間/<!--{$arrSiteInfo.business_hour}-->）<!--{/if}--><br />
				E-mail：<a href="mailto:<!--{$arrSiteInfo.email02|escape:'hex'}-->"><!--{$arrSiteInfo.email02|escape:'hexentity'}--></a>
			</p>
		</div>
	</div>
</div>
<ul class="btn_area">
	<!--{if $is_campaign}-->
		<li class="sp_btn">
			<a href="<!--{$smarty.const.URL_SHOP_TOP}-->">トップページへ<input type="hidden" name="b_toppage" /></a>
		</li>
	<!--{else}-->
		<li class="sp_btn">
			<a href="<!--{$smarty.const.URL_DIR}-->index.php" >トップページへ<input type="hidden" name="b_toppage" /></a>
		</li>
	<!--{/if}-->
</ul>


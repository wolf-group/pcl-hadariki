<div id="undercolumn">
	<div id="undercolumn_entry">
		<h2 class="title">
		会員登録
		</h2>
		<div class="completetext">
			<span style="color:ff0000;font-weight:bold;text-align:center">
				本登録が完了いたしました。<br />
				それではショッピングを<br />お楽しみください。
			</span>
			<p>今後ともご愛顧賜りますようよろしくお願い申し上げます。</p>
			<p>
				<!--{$arrSiteInfo.company_name|escape}--><br />
				TEL：<!--{$arrSiteInfo.tel01}-->-<!--{$arrSiteInfo.tel02}-->-<!--{$arrSiteInfo.tel03}--> <!--{if $arrSiteInfo.business_hour != ""}-->（受付時間/<!--{$arrSiteInfo.business_hour}-->）<!--{/if}--><br />
				E-mall：<a href="mailto:<!--{$arrSiteInfo.email02|escape:'hex'}-->"><!--{$arrSiteInfo.email02|escape:'hexentity'}--></a>
			</p>
			<ul class="btn_area">
				<li class="sp_btn">
					<a href="<!--{$smarty.const.URL_DIR}-->index.php" >トップページへ<input type="hidden" name="b_toppage" /></a>
				</li>
			</ul>
		</div>
	</div>
</div>

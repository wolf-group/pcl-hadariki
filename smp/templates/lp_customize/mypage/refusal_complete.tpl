<!--▼CONTENTS-->
<div id="mypagecolumn">
	<div class="mypage_inner">
		<h3>退会手続き</h3>
			<div id="completetext">
			<p class="changetext">
				<span class="textred">退会手続きが完了いたしました。</span><br />
				MYページをご利用いただき<br />誠にありがとうございました。<br />
				またのご利用を心よりお待ち申し上げます。
			</p>
			<p class="changetext2">
				<!--{$arrSiteInfo.company_name|escape}--><br />
				TEL：<!--{$arrSiteInfo.tel01}-->-<!--{$arrSiteInfo.tel02}-->-<!--{$arrSiteInfo.tel03}--> <!--{if $arrSiteInfo.business_hour != ""}-->（受付時間/<!--{$arrSiteInfo.business_hour|escape}-->）<!--{/if}--><br />
				E-mail：<a href="mailto:<!--{$arrSiteInfo.email02|escape:'hex'}-->"><!--{$arrSiteInfo.email02|escape:'hexentity'}--></a>
			</p>
		</div>
	</div>
</div>
<!--▲CONTENTS-->

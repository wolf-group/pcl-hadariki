<div id="guidecolumn">
	<h2>お問い合わせ</h2>
	<div class="completetext">
		<span style="color:ff0000;font-weight:bold">お問い合わせ内容の送信が<br />完了いたしました。</span><br />
		<p class="mini"> 
			万一、ご回答メールが届かない場合は、トラブルの可能性もありますので大変お手数ではございますがもう一度お問い合わせいただくか、お電話にてお問い合わせください。<br />
			今後ともご愛顧賜りますようよろしくお願い申し上げます。
		</p>
		<p>
			<!--{$arrSiteInfo.company_name|escape}--><br />
			TEL：<!--{$arrSiteInfo.tel01}-->-<!--{$arrSiteInfo.tel02}-->-<!--{$arrSiteInfo.tel03}-->
			<!--{if $arrSiteInfo.business_hour != ""}--><br />
			（受付時間/<!--{$arrSiteInfo.business_hour}-->）
			<!--{/if}--><br />
			E-mail：<a href="mailto:<!--{$arrSiteInfo.email02|escape:'hex'}-->"><!--{$arrSiteInfo.email02|escape:'hexentity'}--></a>
		</p>
	</div>
</div>
<ul>
	<li class="sp_btn">
	<!--{if $is_campaign}-->
		<a href="<!--{$smarty.const.CAMPAIGN_URL}--><!--{$campaign_dir}-->/index.php">トップページへ</a>
	<!--{else}-->
		<a href="/smp/">トップページへ</a>
	<!--{/if}-->
	</li>
</ul>
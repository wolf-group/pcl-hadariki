<div id="windowcolumn">
	<h2>パスワードを忘れた方</h2>
	<p class="completebox">仮ログインURLを発行致しました。<br />確認メールをご確認下さい。</p>
	<p class="attention">※ 仮ログインURLは一時的なものですので、お早めにご利用下さい。<br />パスワードは、マイページの「会員登録内容変更」よりご変更いただけます。</p>
	<ul class="btn_area">
	<!--{if $is_campaign}-->
		<li class="sp_btn">
			<a href="<!--{$smarty.const.CAMPAIGN_URL}--><!--{$campaign_dir}-->/smp/index.php" >トップページへ</a>
		</li>
	<!--{else}-->
		<li class="sp_btn">
			<a href="/smp/index.php" >トップページへ</a>
		</li>
	<!--{/if}-->
	</ul>
</div>

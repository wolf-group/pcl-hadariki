<div id="windowcolumn">
	<h2>パスワードを忘れた方</h2>
	<p class="attention">※ 連続して仮ログインURLを再発行することは<br />出来ません。<br />しばらく時間をおいてからてから<br />やり直して下さい。</p>
	<ul class="btn_area">
		<!--{if $is_campaign}-->
		<li class="sp_btn">
			<a href="<!--{$smarty.const.CAMPAIGN_URL}--><!--{$campaign_dir}-->/smp/index.php">トップページへ</a>
		</li>
		<!--{else}-->
		<li class="sp_btn">
			<a href="/smp/index.php">トップページへ</a>
		</li>
		<!--{/if}-->
	</ul>
</div>

<div id="entrycolumn">
	<div class="entry_inner">
		<h2>会員規約</h2>
		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<div class="kiyaku">
				<p><!--{$tpl_kiyaku_text|nl2br}--></p>
			</div>
		</form>
	</div>
</div>

<ul>
	<li class="nm_btn">
        <!--{if $rfr === 'lp'}-->
        <a onclick="window.close();return false;">閉じる<input type="hidden" name="b_noagree" /></a>
        <!--{else}-->
		<a href="javascript:history.back();">戻る<input type="hidden" name="b_noagree" /></a>
        <!--{/if}-->
	</li>
</ul>


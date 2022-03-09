<!--▼新着情報ここから-->
<div id="newsarea">
	<h2>新着情報</h2>
	<p>新着情報は<a href="/rss/index.php" target="_blank">RSS</a>で配信しています。</p>
	<!--{section name=data loop=$arrNews}-->
		<dl>
			<dt><!--{$arrNews[data].news_date_disp|date_format:"%Y年%m月%d日"}--></dt>
			<dd>
				<!--{if $arrNews[data].news_url}-->
					<a href="<!--{$arrNews[data].news_url}-->"<!--{if $arrNews[data].link_method eq "2"}--> target="_blank"<!--{/if}-->>
				<!--{/if}-->
				<!--{$arrNews[data].news_title|escape|nl2br}-->
				<!--{if $arrNews[data].news_url}-->
					</a>
				<!--{/if}-->
				<br />
				<!--{$arrNews[data].news_comment|escape|nl2br}-->
			</dd>
		</dl>
	<!--{/section}-->
	<div style="text-align:right;font-size:12px;padding:5px" >
		<a href="/smp/news/index.php">過去のNEWSを見る</a>
	</div>
</div>
<!--▲新着情報ここまで-->
<div id="newsdata">
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
				<!--{/if}--><br />
				<!--{$arrNews[data].news_comment|escape|nl2br}-->
			</dd>
		</dl>
	<!--{/section}-->
</div>
<div style = "text-align:center">
	<!--{if $listOff > 0}-->
		<a href="/smp/news/index.php?offset=<!--{$listOff-$listMax}-->&max=<!--{$listMax}-->">&lt;前へ</a>
	<!--{else}-->
		&lt;前へ&nbsp;
	<!--{/if}-->
	<!--{if $listDataCnt > ($listOff+$listMax)}-->
		<a href="/smp/news/index.php?offset=<!--{$listOff+$listMax}-->&max=<!--{$listMax}-->">次へ&gt;</a>
	<!--{else}-->
		次へ&gt;
	<!--{/if}-->
</div>

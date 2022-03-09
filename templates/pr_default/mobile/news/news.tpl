<center>
新着情報
</center>
<hr>
<!--{$title|escape}--><br>
(<!--{$news_date}-->)<br>
<!--{$comment|escape|nl2br}--><br>
<!--{if $url}-->
<a href="<!--{$url}-->?PHPSESSID=<!--{$smarty.get.PHPSESSID}-->&transactionid=<!--{$smarty.get.transactionid}-->&news_id=<!--{$arrNews[0].news_id}-->">
関連ﾘﾝｸ
</a>
<!--{/if}-->
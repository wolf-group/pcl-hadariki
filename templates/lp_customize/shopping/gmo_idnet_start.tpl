<center>iDアプリを起動します。<br>次へを押してください。</center>

<hr>

<form method="POST" action="http://auth.id-credit-t.jp/net/run/IdApSite" enctype="application/x-www-form-urlencode">
<!--{foreach from=$arrIdNetParam key=key item=value}-->
<input type="hidden" name="<!--{$key}-->" value="<!--{$value}-->">
<!--{/foreach}-->

<center><input type="submit" value="次へ"></center>
</form>


<br>
<hr>

<br>

<!-- ▼フッター ここから -->
<center>LOCKON CO.,LTD.</center>
<!-- ▲フッター ここまで -->
<center>iDネット決済を開始します<br>次へを押してください</center>

<hr>

<!--{* 決済時のエラーを表示 *}-->
<!--{assign var=key value="gmo_request"}-->
<!--{if $arrErr[$key]}-->
<font color="red">
エラーが発生しました：<!--{$arrErr[$key]|nl2br}--></font>
<br>
<!--{/if}-->

<form method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
<input type="hidden" name="mode" value="register">
<input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->">

<br>

<center><input type="submit" name="register" value="次へ"></center>
</form>

<form method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
<input type="hidden" name="mode" value="return">
<center><input type="submit" name="return" value="戻る"></center>
</form>

<br>
<hr>

<br>

<!-- ▼フッター ここから -->
<center>LOCKON CO.,LTD.</center>
<!-- ▲フッター ここまで -->

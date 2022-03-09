<form name="ACSCall" action="<!--{$arrExecRet.ACSUrl}-->" method="POST">

本人認証サービスを続けます。<br />
自動的に切り替わらない場合はボタンをクリックしてください。<br />
<input type="submit" value="OK">

<input type="hidden" name="PaReq" value="<!--{$arrExecRet.PaReq}-->">
<input type="hidden" name="TermUrl" value="<!--{$arrExecRet.TermUrl}-->">
<input type="hidden" name="MD" value="<!--{$arrExecRet.MD}-->">

</form>

<script>
<!--
function OnLoadEvent() {
    document.ACSCall.submit();
}
//-->
</script>

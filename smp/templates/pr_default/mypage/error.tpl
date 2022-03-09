<!DOCTYPE HTML>
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$smarty.const.CHAR_CODE}-->" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta name="format-detection" content="telephone=no" />
<meta name="viewport" content="width=device-width,user-scalable=no">
<!--{$pc_front_head|smarty:nodefaults}-->
<!--{if $smarty.const.CHECKBROWSER == 'MSIE'}--><link rel="stylesheet" href="<!--{$TPL_DIR}-->css_ie/import.css" type="text/css" media="all" /><!--{else}--><link rel="stylesheet" href="<!--{$TPL_DIR}-->css/import.css" type="text/css" media="all" /><!--{/if}-->
<title><!--{$arrSiteInfo.shop_name}-->/エラー</title>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/css.js"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/navi.js"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/win_op.js"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/site.js"></script>
</head>
<body>
<noscript>
<link rel="stylesheet" href="<!--{$smarty.const.URL_DIR}--><!--{$smarty.const.USER_DIR}-->css/common.css" type="text/css" />
</noscript>

<div align="center">

<!--▼CONTENTS-->
<!--▼MAINN ONTENTS-->
	<div id="compbox">
		<span class="red"><!--{$tpl_error}--></span><br />
	</div>

	<ul>
		<li class="sp_btn">
			<a href="javascript:window.close()">閉じる</a>
		</li>
	</ul>
<!--▲MAIN CONTENTS-->
<!--▲CONTENTS-->
</div>

</body>
</html>

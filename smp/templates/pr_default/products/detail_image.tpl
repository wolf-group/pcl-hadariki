<!DOCTYPE HTML>
<html lang="ja">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<!--{$smarty.const.CHAR_CODE}-->" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta name="author" content="<!--{$arrPageLayout.author|escape}-->" />
	<meta name="description" content="<!--{$arrPageLayout.description|escape}-->" />
	<meta name="keywords" content="<!--{$arrPageLayout.keyword|escape}-->" />
	<meta name="format-detection" content="telephone=no" />
	<meta name="viewport" content="width=device-width,user-scalable=no">
	<!--{$pc_front_head|smarty:nodefaults}-->
	<!--{if $smarty.const.CHECKBROWSER == 'MSIE'}--><link rel="stylesheet" href="<!--{$TPL_DIR}-->css_ie/import.css" type="text/css" media="all" /><!--{else}--><link rel="stylesheet" href="<!--{$TPL_DIR}-->css/import.css" type="text/css" media="all" /><!--{/if}-->
	<title><!--{$arrSiteInfo.shop_name}--></title>
	<script type="text/javascript" src="<!--{$TPL_DIR}-->js/navi.js"></script>
	<script type="text/javascript" src="<!--{$TPL_DIR}-->js/win_op.js"></script>
	<script type="text/javascript" src="<!--{$TPL_DIR}-->js/site.js"></script>
	<script type="text/javascript">//<![CDATA[
	    <!--{$tpl_javascript}-->
	//]]>
	</script>
</head>
<body>
	<noscript>
		<p>JavaScriptを有効にしてご利用下さい</p>
	</noscript>
	<!--{if $tpl_width > 300}-->
		<!--{assign var=id value=bigimage}-->
	<!--{else}-->
		<!--{assign var=id value=cartimage}-->
	<!--{/if}-->
	画像をクリックすると前のページへ戻ります。<br />
	<div id="<!--{$id}-->">
		<a href="/smp/product/detail/<!--{$product_id}-->"><img src="<!--{$smarty.const.IMAGE_SAVE_URL}--><!--{$tpl_image}-->" width="<!--{$tpl_width}-->" height="<!--{$tpl_height}-->" alt="<!--{$tpl_name}-->" /></a>
	</div>
</body>
</html>

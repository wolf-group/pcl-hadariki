<!--{*<!--{printXMLDeclaration}--><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ja" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$smarty.const.CHAR_CODE}-->" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Pragma" content="no-cache">
<link rel="stylesheet" href="<!--{$TPL_DIR}-->css/common.css?<!--{$smarty.const.FRONT_CSS_VERSION}-->" type="text/css" media="all" />
<!--{$pc_front_head|smarty:nodefaults}-->
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/css.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/navi.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/win_op.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/site.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<meta name="author" content="<!--{$arrPageLayout.author|escape}-->" />
<meta name="description" content="<!--{$arrPageLayout.description|escape}-->" />
<meta name="keywords" content="<!--{$arrPageLayout.keyword|escape}-->" />
<title><!--{$arrSiteInfo.shop_name}-->/<!--{$title}--></title>
</head>
*}-->
<!--{include file=$common_request_header_tpl}-->


<body onload="preLoadImg('<!--{$TPL_DIR}-->')">
<div id="windowcolumn">
	<div id="windowarea">
		<div class="head">
			<h2 class="t_mypage">入荷通知希望メール送信</h2>
		</div>
		<div id="completebox">
			<!--{$message}-->
		</div>
		<ul class="btn_area_l2">
			<li class="btn">
				<span class="btn_next">
					<a href="javascript:window.close()">閉じる</a>
				</span>
			</li>
		</ul>
	</div>
</div>

</body>
</html>

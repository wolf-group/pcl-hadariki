<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ja">
<head>
<!--{* アフィリエイトタグ *}-->
<!--{foreach from=$affiliate_tag_head_prepend_list key=affiliate_key item=affiliate_tag}-->
<!--{safe_include file=$affiliate_tag}-->
<!--{/foreach}-->
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$smarty.const.CHAR_CODE}-->" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta name="author" content="<!--{$arrPageLayout.author|escape}-->" />
<meta name="description" content="<!--{$arrPageLayout.description|escape}-->" />
<meta name="keywords" content="<!--{$arrPageLayout.keyword|escape}-->" />
<meta name="format-detection" content="telephone=no" />
<meta name="viewport" content="width=device-width,user-scalable=no">
<script type="text/javascript">var transactionid_name = '<!--{$smarty.const.TRANSACTION_ID_NAME|escape:'javascript'}-->';</script>
<!--{$pc_front_head|smarty:nodefaults}-->
<!--{include file='../../ogp_template_files/ogp.tpl'}-->
<link rel="stylesheet" href="/css/jquery-ui-1.8.22.custom.css" type="text/css" media="all" />
<link rel="stylesheet" href="<!--{$TPL_DIR}-->css/import.css?<!--{$smarty.const.FRONT_CSS_VERSION}-->" type="text/css" media="all" />
<!--{if $amazon_pay_usable}-->
<link rel="stylesheet" href="<!--{$TPL_DIR}-->css/amazon_pay.css?<!--{$smarty.const.FRONT_CSS_VERSION}-->" type="text/css" media="all" />
<!--{/if}-->
<title><!--{$tpl_title|escape}--><!--{if $tpl_title}-->-[<!--{/if}--><!--{$arrSiteInfo.shop_name|escape}--><!--{if $tpl_title}-->]<!--{/if}--><!--{$page_title_add_str}--></title>
<!--{if $amazon_client_id}-->
<script type='text/javascript'>
window.onAmazonLoginReady = function () {
    amazon.Login.setClientId('<!--{$amazon_client_id}-->');
    amazon.Login.setUseCookie(true);
};
</script>
<script type="text/javascript">
    function getURLParameter(name, source) {
        return decodeURIComponent((new RegExp('[?|&|#]' + name + '=' + '([^&]+?)(&|#|;|$)').exec(source) || [,""])[1].replace(/\+/g,'%20')) || null;
    }
    var accessToken = getURLParameter("access_token", location.hash);
    if (typeof accessToken === 'string' && accessToken.match(/^Atza/)) {
        document.cookie = "amazon_Login_accessToken=" + accessToken + ";secure";
        var href= location.href;
        var conjunction = location.search.indexOf('?') == -1 ? '?' : '&';
        if (href.indexOf('redirect=yes') == -1) {
            location.href=href.split('#')[0] + conjunction + 'redirect=yes';
        }
    }
    <!--{if $redirect_flg}-->
    location.href = '<!--{$smarty.const.SSL_URL}-->smp/shopping/amazon_pay.php';
    <!--{/if}-->
    <!--{if $access_token}-->
    accessToken = '<!--{$access_token}-->';
    <!--{/if}-->
</script>
<!--{/if}-->
<script type="text/javascript" src="/js/jquery.js"></script>
<!--{if $amazon_client_id}-->
<script type="text/javascript" src="/js/amazon_pay_parallel.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->"></script>
<!--{/if}-->
<!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable}-->
<script type="text/javascript" src="/js/amazon_pay_v2.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->"></script>
<!--{/if}-->
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/navi.js"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/win_op.js"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/site.js"></script>
<!--<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>-->
<script type="text/javascript" src="/js/load.template.js.php"></script>
<script type="text/javascript" src="/js/load.products.js.php"></script>
<script type="text/javascript" src="/js/jquery-ui-1.8.22.custom.min.js"></script>

<script type="text/javascript">//<![CDATA[
    <!--{$tpl_javascript}-->
//]]>
</script>
<!--{get_paygent_token_tag}-->
<!--{get_gmo_token_tag}-->
<!--{if 'basis-line_app'|get_option_use_flg}-->
    <!--{get_line_tag}-->
    <!--{get_line_prof_js}-->
<!--{/if}-->
<!--{get_token_payment_tag_headers}-->
<!--{get_token_payment_tag_process}-->
<!--{get_paidy_js_tag}-->
<!--{* アフィリエイトタグ *}-->
<!--{foreach from=$affiliate_tag_head_append_list key=affiliate_key item=affiliate_tag}-->
<!--{safe_include file=$affiliate_tag}-->
<!--{/foreach}-->

</head>
<!-- ▼BODY部 スタート -->
<!--{include file="`$smarty.const.S_TEMPLATE_PATH`/site_main.tpl"}-->
<!-- ▲BODY部 エンド -->

</html>

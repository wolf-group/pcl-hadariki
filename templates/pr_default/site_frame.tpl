<!--{printXMLDeclaration}--><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--{*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2007 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *}-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="ja" xml:lang="ja">
<head>
<!--{* アフィリエイトタグ *}-->
<!--{foreach from=$affiliate_tag_head_prepend_list key=affiliate_key item=affiliate_tag}-->
<!--{safe_include file=$affiliate_tag}-->
<!--{/foreach}-->
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$smarty.const.CHAR_CODE}-->" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<link rel="stylesheet" href="<!--{$TPL_DIR}-->css/common.css?<!--{$smarty.const.FRONT_CSS_VERSION}-->" type="text/css" media="all" />
<link rel="stylesheet" href="/css/jquery.lightbox-0.5.css?<!--{$smarty.const.FRONT_CSS_VERSION}-->" type="text/css" media="all" />
<link rel="stylesheet" href="/css/jquery-ui-1.8.22.custom.css?<!--{$smarty.const.FRONT_CSS_VERSION}-->" type="text/css" media="all" />
<!--{if $amazon_pay_usable}-->
<link rel="stylesheet" href="<!--{$TPL_DIR}-->css/amazon_pay.css?<!--{$smarty.const.FRONT_CSS_VERSION}-->" type="text/css" media="all" />
<!--{/if}-->
<link rel="shortcut icon" href="/gold/favicon.ico" type="image/vnd.microsoft.icon" />
<!--{if $amazon_client_id}-->
<script type='text/javascript'>
window.onAmazonLoginReady = function () {
    amazon.Login.setClientId('<!--{$amazon_client_id}-->');
    amazon.Login.setUseCookie(true);
};
</script>
<!--{/if}-->
<script type="text/javascript">var transactionid_name = '<!--{$smarty.const.TRANSACTION_ID_NAME|escape:'javascript'}-->';</script>
<!--{$pc_front_head|smarty:nodefaults}-->
<script type="text/javascript" src="/js/clone.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/css.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/navi.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/win_op.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/site.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<!--{if $smarty.server.SCRIPT_NAME == "/shopping/lp.php"}-->
<script type="text/javascript" src="/js/jquery.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<!--{else}-->
<script type="text/javascript" src="/js/jquery-1.9.1.min.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<!--{/if}-->
<!--{if $amazon_pay_v1_enabled && $amazon_client_id}-->
<script type="text/javascript" src="/js/amazon_pay_parallel.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->"></script>
<!--{/if}-->
<!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable}-->
<script type="text/javascript" src="/js/amazon_pay_v2.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->"></script>
<!--{/if}-->
<script type="text/javascript" src="/js/jquery.lightbox-0.5.min.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="/js/tilescroller.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="/js/bestproducts.js.php"></script>
<script type="text/javascript" src="/js/jquery-ui-1.8.22.custom.min.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="/js/jquery.flexslider-min.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="/js/owl.carousel.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>

<title><!--{$tpl_title|escape}--><!--{if $tpl_title}-->-[<!--{/if}--><!--{$arrSiteInfo.shop_name|escape}--><!--{if $tpl_title}-->]<!--{/if}--></title>
<meta name="author" content="<!--{$arrPageLayout.author|escape}-->" />
<meta name="description" content="<!--{$arrPageLayout.description|escape}-->" />
<meta name="keywords" content="<!--{$arrPageLayout.keyword|escape}-->" />

<!--{get_paygent_token_tag}-->
<!--{get_gmo_token_tag}-->
<!--{get_paidy_js_tag}-->
<!--{include file='../../ogp_template_files/ogp.tpl'}-->
<script type="text/javascript">//<![CDATA[
    <!--{$tpl_javascript}-->
//]]>
</script>

<!--▼バナースライダー-->
<script type="text/javascript">
    $(window).load(function() {
        if ($('#flasharea div').hasClass('flexslider')) {
            $('.flexslider').css('width', '100%');
            $('.flexslider').css('height', 'auto');
            $('.flexslider').flexslider({
                slideshowSpeed: 5000,
                mousewheel: false,
                slideshow: true,
                animation: "slide",
            });
        }
    });
</script>

<!--▲バナースライダー エンド-->


<!--▼横並びスライダー-->
<script type="text/javascript">
  $(document).ready(function(){
    if ($('#slider1').length) {
      $('#slider1').owlCarousel({
            items : 5, //ブラウザの幅が1199px 以上の時 6
            itemsDesktop : [1199,5], // 1199px から 600px　まで 5つ
            itemsDesktopSmall : false, // betweem 900px and 601px
            itemsTablet: [600,4], //600px から 479px　まで　4つ
            itemsMobile : [479,2], // 479px　以下は 2つ
            autoPlay : true,
            stopOnHover : true,
            navigation : true
        });
    }
    if ($('#slider2').length) {
      $('#slider2').owlCarousel({
            items : 5, //ブラウザの幅が1199px 以上の時 6
            itemsDesktop : [1199,5], // 1199px から 600px　まで 5つ
            itemsDesktopSmall : false, // betweem 900px and 601px
            itemsTablet: [600,4], //600px から 479px　まで　4つ
            itemsMobile : [479,2], // 479px　以下は 2つ
            autoPlay : true,
            stopOnHover : true,
            navigation : true
        });
    }
    if ($('#slider2').length) {
      $('#slider3').owlCarousel({
            items : 5, //ブラウザの幅が1199px 以上の時 6
            itemsDesktop : [1199,5], // 1199px から 600px　まで 5つ
            itemsDesktopSmall : false, // betweem 900px and 601px
            itemsTablet: [600,4], //600px から 479px　まで　4つ
            itemsMobile : [479,2], // 479px　以下は 2つ
            autoPlay : true,
            stopOnHover : true,
            navigation : true
      });
    }
  });
</script>
<!--▲横並びスライダー エンド-->


<!--▼開閉-->
<script type="text/javascript">
$(document).ready(function(){
  $(".news_acd dt").click(function(){
      $(this).next("dd").slideToggle();
      $(this).next("dd").siblings("dd").slideUp();
      $(this).toggleClass("open");
      $(this).siblings("dt").removeClass("open");
  });
});
</script>
<!--▼開閉 エンド-->
<!--{if 'basis-line_app'|get_option_use_flg}-->
    <!--{get_line_tag}-->
    <!--{get_line_prof_js}-->
<!--{/if}-->
<!--{get_token_payment_tag_headers}-->
<!--{get_token_payment_tag_process}-->
<!--{* アフィリエイトタグ *}-->
<!--{foreach from=$affiliate_tag_head_append_list key=affiliate_key item=affiliate_tag}-->
<!--{safe_include file=$affiliate_tag}-->
<!--{/foreach}-->

</head>

<!-- ▼BODY部 スタート -->
<!--{include file='./site_main.tpl'}-->
<!-- ▲BODY部 エンド -->

</html>

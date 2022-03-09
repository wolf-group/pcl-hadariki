<body onload="<!--{$tpl_onload}-->">
<!--{* アフィリエイトタグ *}-->
<!--{foreach from=$affiliate_tag_body_prepend_list key=affiliate_key item=affiliate_tag}-->
<!--{safe_include file=$affiliate_tag}-->
<!--{/foreach}-->
<!--{include file="`$smarty.const.S_TEMPLATE_PATH`/init_timer_bloc.tpl"}-->
<!--{$GLOBAL_ERR}-->
<noscript>
  <p style="color:red;text-align:left;">JavaScript を有効にしてご利用下さい.</p>
</noscript>
<!--{if $isCookieEnabled==-1}-->
<p style="color:red;text-align:left;">ご購入頂く場合には、ブラウザのクッキーを有効にしてご利用下さい.</p>
<!--{/if}-->
<a name="top" id="top"></a>
<!--{* ▼HEADER（ヘッダー） *}-->
<!--{*<pre style="font-size: 12px;color: #00ff00;background: #000; margin: 5px; padding: 5px;border: 2px outset;">ヘッダー:<br /><!--{$header_tpl|@var_export}--></pre>*}-->
<!--{if $arrPageLayout.header_chk != 2}-->
    <!--{include file= $header_tpl}-->
<!--{/if}-->
<!--{* ▲HEADER *}-->

<!--{* ▼CONTENTS（メインコンテンツ開始） *}-->
<div id="container">

<!--{*<pre style="font-size: 12px;color: #00ff00;background: #000; margin: 5px; padding: 5px;border: 2px outset;">$arrPageLayout.MainHead:<br /><!--{$arrPageLayout.MainHead|@var_export}--></pre>*}-->
    <!--{* ▼メイン上部 *}-->
    <!--{if $arrPageLayout.MainHead|@count > 0}-->
      <!--{foreach key=MainHeadKey item=MainHeadItem from=$arrPageLayout.MainHead}-->
        <!-- ▼<!--{$MainHeadItem.bloc_name}--> ここから-->
        <!--{if $MainHeadItem.php_path != ""}-->
          <!--{include_php file=$MainHeadItem.php_path}-->
        <!--{else}-->
          <!--{include file=$MainHeadItem.tpl_path}-->
        <!--{/if}-->
        <!-- ▲<!--{$MainHeadItem.bloc_name}--> ここまで-->
      <!--{/foreach}-->
    <!--{/if}-->
    <!--{* ▲メイン上部 *}-->

    <!--{* ▼メイン *}-->
<!--{*<pre style="font-size: 12px;color: #00ff00;background: #000; margin: 5px; padding: 5px;border: 2px outset;">メインテンプレ(スマフォ):<br /><!--{$tpl_mainpage|@var_export}--></pre>*}-->
    <!--{include file=$tpl_mainpage}-->
    <!--{* ▲メイン *}-->

    <!--{* ▼メイン下部 *}-->
    <!--{if $arrPageLayout.MainFoot|@count > 0}-->
      <!--{foreach key=MainFootKey item=MainFootItem from=$arrPageLayout.MainFoot}-->
        <!-- ▼<!--{$MainFootItem.bloc_name}--> ここから-->
        <!--{if $MainFootItem.php_path != ""}-->
          <!--{include_php file=$MainFootItem.php_path}-->
        <!--{else}-->
          <!--{include file=$MainFootItem.tpl_path}-->
        <!--{/if}-->
        <!-- ▲<!--{$MainFootItem.bloc_name}--> ここまで-->
      <!--{/foreach}-->
    <!--{/if}-->
    <!--{* ▲メイン下部 *}-->
</div>

<!--{if $arrPageLayout.is_my_page}-->
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/tooltip.js"></script>
<script type="text/javascript" src="/js/mypage_both.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->"></script>
<!--{/if}-->

<!--{* ▲CONTENTS *}-->
<!--{* ▼FOTTER（フッター） *}-->
<!--{*<pre style="font-size: 12px;color: #00ff00;background: #000; margin: 5px; padding: 5px;border: 2px outset;">フッター:<br /><!--{$footer_tpl|@var_export}--></pre>*}-->
<!--{if $arrPageLayout.footer_chk != 2}-->
	<!--{include file=$footer_tpl}-->
<!--{/if}-->
<!--{* ▲FOTTER *}-->

<!--{* アフィリエイトタグ表示用 *}-->
<!--{$tpl_conv_page|sfPrintAffTag:$tpl_aff_option}-->
<!--{$view_system_id}-->
<!--{if $amazon_pay_v1_enabled && $amazon_client_id}-->
<script type="text/javascript" src="<!--{$amazon_widget_path|escape}-->" async="async"></script>
<!--{/if}-->

<!--{* アフィリエイトタグ *}-->
<!--{foreach from=$affiliate_tag_body_append_list key=affiliate_key item=affiliate_tag}-->
<!--{safe_include file=$affiliate_tag}-->
<!--{/foreach}-->
</body>

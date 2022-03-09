<!--{if $arrRequest.sender_name01 || $arrRequest.sender_name02}-->
<!--{$arrRequest.sender_name01}--> <!--{$arrRequest.sender_name02}--> 様
<!--{/if}-->
<!--{$tpl_header}-->

*********************
　　　商品詳細
*********************
商品ID: <!--{$arrRequest.product_id}-->
商品名: <!--{$arrRequest.product_name}-->
<!--{if $arrRequest.classcategory_name1}--><!--{$arrRequest.class_name1}-->:<!--{$arrRequest.classcategory_name1}--><!--{$smarty.const.PHP_EOL}--><!--{/if}-->
<!--{if $arrRequest.classcategory_name2}--><!--{$arrRequest.class_name2}-->:<!--{$arrRequest.classcategory_name2}--><!--{$smarty.const.PHP_EOL}--><!--{/if}-->
商品ｺｰﾄﾞ: <!--{$arrRequest.product_code}-->

<!--{$tpl_footer}-->
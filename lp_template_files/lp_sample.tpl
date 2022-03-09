<!--{if $layout == 'lp_header'}-->
<!--{* ↓↓ヘッダーデザイン↓↓ *}-->
ここにヘッダーデザイン設定
<!--{* ↑↑ヘッダーデザイン↑↑ *}-->
<!--{/if}-->
<!--{if $layout == 'lp_product'}-->
<!--{* ↓↓商品リスト↓↓ *}-->
<option value=""<!--{if $select === ''}--> selected="selected"<!--{/if}-->>＜＜商品を選択してください＞＞</option>
<option value="1"<!--{if $select === '1'}--> selected="selected"<!--{/if}-->>商品名1</option>
<option value="2"<!--{if $select === '2'}--> selected="selected"<!--{/if}-->>商品名2</option>
<!--{* ↑↑商品リスト↑↑ *}-->
<!--{/if}-->

<!--{if $layout == 'lp_footer'}-->
<!--{* ↓↓フッターデザイン↓↓ *}-->
ここにフッターデザイン設定
<!--{* ↑↑フッターデザイン↑↑ *}-->
<!--{/if}-->

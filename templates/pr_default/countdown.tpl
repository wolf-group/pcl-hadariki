<!--{*
タイムセール用カウントダウン制御用JS
*}-->

<!--{assign var=default_layout value='タイムセール中&nbsp;&nbsp;<br />終了まで<span style="font-size:20px;font-bold:bold"><b>{dn}{dl}と{hnn}時間{mnn}分{snn}秒</b> {desc}</span>'}-->
<!--{assign var=default_layout2 value='<span style="font-size:10px">タイムセール中</span><br />終了まで<span style="font-bold:bold"><b>{dn}{dl}と{hnn}時間{mnn}分{snn}秒</b> {desc}</span>'}-->
<!--{assign var=default_msg_before_start value='{start_date}からタイムセール'}-->
<!--{assign var=default_msg_after_stoped value='タイムセールは終了しました。'}-->

<!--{include file="`$smarty.const.TEMPLATE_DIR`timesales/countdown_layout.tpl" assign=layout}-->
<!--{include file="`$smarty.const.TEMPLATE_DIR`timesales/countdown_layout2.tpl" assign=layout2}-->
<!--{include file="`$smarty.const.TEMPLATE_DIR`timesales/msg_before_start.tpl" assign=msg_before_start}-->
<!--{include file="`$smarty.const.TEMPLATE_DIR`timesales/msg_after_stoped.tpl" assign=msg_after_stoped}-->

$(document).ready(function() {
	require_jquery_countdown('<!--{$smarty.const.URL_DIR}-->'  , function() {
		var objTimeSales = null;
		var objTimeSaleses = new Array();
		<!--{* 商品詳細用 *}-->
	    <!--{if $arrProduct.timesales_flg == 1}-->
	    	/*var expire = new Date('<!--{$arrProduct.timesales_end_date}-->'.replace(/-/g , '/')); */
	    	objTimeSales = new TimeSales('<!--{$arrProduct.product_id}-->' , '<!--{$arrProduct.timesales_start_date}-->', '<!--{$arrProduct.timesales_end_date}-->');
	    	objTimeSales.setLayout('<!--{if $layout}--><!--{$layout}--><!--{else}--><!--{$default_layout}--><!--{/if}-->');
	    	objTimeSales.setMsgBeforeStart('<div class="timesales_before_start"><!--{if $msg_before_start}--><!--{$msg_before_start}--><!--{else}--><!--{$default_msg_before_start}--><!--{/if}--></div>'); 
	    	objTimeSales.setMsgAfterStoped('<div class="timesales_ended" ><!--{if $msg_after_stoped}--><!--{$msg_after_stoped}--><!--{else}--><!--{$default_msg_after_stoped}--><!--{/if}--></div>');
	    	objTimeSales.countdown();
	    <!--{/if}-->
	    <!--{* 商品一覧用 *}-->
	    <!--{foreach from=$arrProducts item=product key=idx}-->
	    	<!--{if $product.timesales_flg == 1}--> 
	    		/*var expire = new Date('<!--{$product.timesales_end_date}-->'.replace(/-/g , '/')); */
	    		objTimeSaleses[<!--{$idx}-->] = new TimeSales('<!--{$product.product_id}-->' , '<!--{$product.timesales_start_date}-->', '<!--{$product.timesales_end_date}-->');
	    		objTimeSaleses[<!--{$idx}-->].setLayout('<!--{if $layout}--><!--{$layout}--><!--{else}--><!--{$default_layout}--><!--{/if}-->');
	    		objTimeSaleses[<!--{$idx}-->].setMsgBeforeStart('<div class="timesales_before_start"><!--{if $msg_before_start}--><!--{$msg_before_start}--><!--{else}--><!--{$default_msg_before_start}--><!--{/if}--></div>');
	    		objTimeSaleses[<!--{$idx}-->].setMsgAfterStoped('<div class="timesales_ended" ><!--{if $msg_after_stoped}--><!--{$msg_after_stoped}--><!--{else}--><!--{$default_msg_after_stoped}--><!--{/if}--></div>');
	    		objTimeSaleses[<!--{$idx}-->].countdown();
	    	<!--{/if}-->
	   	<!--{/foreach}-->
	   	<!--{* カート用 & 購入手続き確認画面用*}-->
	    <!--{foreach from=$arrProductsClass item=product key=idx}-->
	    	<!--{if $product.timesales_flg == 1 && $product.timesales_term_type == 2}-->
	    		/*var expire = new Date('<!--{$product.timesales_end_date}-->'.replace(/-/g , '/')); */
	    		objTimeSaleses[<!--{$idx}-->] = new TimeSales('<!--{$product.product_id}-->' , '<!--{$product.timesales_start_date}-->', '<!--{$product.timesales_end_date}-->');
	    		objTimeSaleses[<!--{$idx}-->].setLayout('<!--{if $layout}--><!--{$layout}--><!--{else}--><!--{$default_layout}--><!--{/if}-->');
	    		objTimeSaleses[<!--{$idx}-->].setMsgBeforeStart('<div class="timesales_before_start"><!--{if $msg_before_start}--><!--{$msg_before_start}--><!--{else}--><!--{$default_msg_before_start}--><!--{/if}--></div>');
	    		objTimeSaleses[<!--{$idx}-->].setMsgAfterStoped('<div class="timesales_ended" ><!--{if $msg_after_stoped}--><!--{$msg_after_stoped}--><!--{else}--><!--{$default_msg_after_stoped}--><!--{/if}--></div>');
	    		objTimeSaleses[<!--{$idx}-->].addOnExpiry(function() {
	    				alert('<!--{$product.name|escape:"quotes"}-->のタイムセールは終了致しました。カートから対象商品を自動的に削除します。');
	    				
	    				<!--{if $smarty.server.SCRIPT_NAME == '/cart/index.php'}-->
	    				$('input[name="cart_no"]').val('<!--{$product.cart_no}-->');
	    				$('input[name="mode"]').val('delete');
	    				$('#form1').submit();
	    				<!--{elseif $smarty.server.SCRIPT_NAME == '/shopping/confirm.php'}-->
	    				$('input[name="mode"]').val('delete_timesales_ended_product');
	    				$('#form1').submit();
	    				<!--{/if}-->
	    			} 
	    		);
	    		objTimeSaleses[<!--{$idx}-->].countdown();
	    	<!--{/if}-->
	   	<!--{/foreach}-->
	   	<!--{* おすすめ商品用 *}-->
	   	<!--{foreach from=$arrBestProducts item=product key=idx}-->
	   		<!--{if $product.timesales_flg == 1 && $id_prefix}-->
	   			var expire = new Date('<!--{$product.timesales_end_date}-->'.replace(/-/g , '/')); 
	    		objTimeSaleses[<!--{$idx}-->] = new TimeSales('<!--{$product.product_id}-->' , '<!--{$product.timesales_start_date}-->', '<!--{$product.timesales_end_date}-->' , '<!--{$id_prefix}-->');
	    		objTimeSaleses[<!--{$idx}-->].setLayout('<!--{if $layout2}--><!--{$layout2}--><!--{else}--><!--{$default_layout2}--><!--{/if}-->');
	    		objTimeSaleses[<!--{$idx}-->].setMsgBeforeStart('<div class="timesales_before_start"><!--{if $msg_before_start}--><!--{$msg_before_start}--><!--{else}--><!--{$default_msg_before_start}--><!--{/if}--></div>');
	    		objTimeSaleses[<!--{$idx}-->].setMsgAfterStoped('<div class="timesales_ended" ><!--{if $msg_after_stoped}--><!--{$msg_after_stoped}--><!--{else}--><!--{$default_msg_after_stoped}--><!--{/if}--></div>');
	    		objTimeSaleses[<!--{$idx}-->].addOnExpiry(function() {
	    			} 
	    		);
	    		objTimeSaleses[<!--{$idx}-->].countdown();
	   		<!--{/if}-->
	   	<!--{/foreach}-->
	   	<!--{* ランキング用 *}-->
	   	<!--{foreach from=$rankingData item=product key=idx}-->
	   		<!--{if $product.timesales_flg == 1 && $id_prefix}-->
	   			var expire = new Date('<!--{$product.timesales_end_date}-->'.replace(/-/g , '/')); 
	    		objTimeSaleses[<!--{$idx}-->] = new TimeSales('<!--{$product.product_id}-->' , '<!--{$product.timesales_start_date}-->', '<!--{$product.timesales_end_date}-->', '<!--{$id_prefix}-->');
	    		objTimeSaleses[<!--{$idx}-->].setLayout('<!--{if $layout2}--><!--{$layout2}--><!--{else}--><!--{$default_layout2}--><!--{/if}-->');
	    		objTimeSaleses[<!--{$idx}-->].setMsgBeforeStart('<div class="timesales_before_start"><!--{if $msg_before_start}--><!--{$msg_before_start}--><!--{else}--><!--{$default_msg_before_start}--><!--{/if}--></div>');
	    		objTimeSaleses[<!--{$idx}-->].setMsgAfterStoped('<div class="timesales_ended" ><!--{if $msg_after_stoped}--><!--{$msg_after_stoped}--><!--{else}--><!--{$default_msg_after_stoped}--><!--{/if}--></div>');
	    		objTimeSaleses[<!--{$idx}-->].addOnExpiry(function() {
	    			} 
	    		);
	    		objTimeSaleses[<!--{$idx}-->].countdown();
	   		<!--{/if}-->
	   	<!--{/foreach}-->
	} , '<!--{$custom_css}-->'); 
	<!--{if $tpl_global_alert_msg}-->
	alert('<!--{$tpl_global_alert_msg}-->');
	<!--{/if}-->
});
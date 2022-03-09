	<!--▼CONTENTS-->
	<div id="mypagecolumn">
		<div class="head">
			<h2 class="t_mypage">マイページ
			<!--{* ポイント表示 *}-->
			<!--{if $tpl_point}--><!--{include file=$tpl_point}--><!--{/if}-->
            </h2>
		</div>
		<!--{if $tpl_navi != ""}-->
			<!--{include file=$tpl_navi}-->
			<!--{else}-->
			<!--{include file=`$smarty.const.TEMPLATE_DIR`mypage/navi.tpl}-->
		<!--{/if}-->
		<div id="mycontentsarea">
			<form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="order_id" value="" />
			<input type="hidden" name="pageno" value="<!--{$tpl_pageno}-->" />
			<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
			<div class="mycont_head">
				<h3>お気に入り</h3>
			</div>

        <!--▼件数表示-->
				<p class="pg_num" id="fv_count"></p>
        <!--▲件数表示-->
             <!--▼ページナビ-->
                <div class="pg_nav" id="pg_nav"></div>
             <!--▲ページナビ-->

             <!--お気に入り一覧-->
             <div class="pdtb10" id="fv_list"></div>

           <!--一括削除欄-->
             <div class="all_delete" style="display: none;">
                  <div class="allcheck">
                      <input type="checkbox" class="favorite_check" name="all_check" id="all_check" value="1"><label for="all_check">すべてチェック</label>
                  </div>
                  <div class="btn_fv2">
                      <a href="javascript:void(0);" onclick="Del_Favorite_multi();">チェックしたアイテムを一括削除</a>
                  </div>
             </div>

	    </form>
	  </div>
	</div>

<!--お気に入り一覧テンプレート-->
<div id="favolite_list_template" class="template" style="display: none;">
  <dl summary="お気に入り一覧" class="favolite_list">
    <dt class="favolite_img">
    <a class="item_link" href="">
    <img class="item_img" src="" width="120" height="120" alt=""/><!--商品画像-->
    </a>
   </dt>
   <dd class="favolite_detail">
    <p class="item_name"></p><!--商品名-->
    <p class="item_price"></p><!--商品値段-->
    <p><!--削除ボタン-->
      <div class="item_check" style="display:inline-block;position:relative;top:12px;"><input type="checkbox" class="item_check_box" name="favorite_check" value=""><label class="item_check_label"></label></div>
      <div class="item_del btn_fv"><a class="item_del_button" href="javascript:void(0);" >削除</a></div>
    </p>
   </dd>
  </dl>
</div>

<script type="text/javascript">
var now_page = 1;
$(function()
{
  Get_FavoriteList(now_page);
}) ;

//全てチェックボタン
$('#all_check').on('change', function() {
    $('input[name=favorite_check]').prop('checked', this.checked);
});


</script>
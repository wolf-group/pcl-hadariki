<!--{*
 * Copyright(c) 2008 PakuReserve, Inc. All Rights Reserved.
 *}-->
<!--▼検索条件ここから-->

<div id="searcharea">
	<h2 class="t_search">
		検索条件
	</h2>

  <!--検索フォーム-->
    <form name="search_form" id="search_form" method="get" action="/products/list.php">

        <p><img src="<!--{$TPL_DIR|escape}-->img/icon/icon_sh.png" alt="商品カテゴリから選ぶ" title="商品カテゴリから選ぶ" />商品カテゴリから選ぶ</p>

        <p><input type="hidden" name="mode" value="search" />
        <select name="category_id" class="box142">
          <option label="すべての商品" value="">全ての商品</option>
          <!--{html_options options=$arrCatList selected=$category_id}-->
        </select>
      </p>

      <p><img src="<!--{$TPL_DIR|escape}-->img/icon/icon_sh.png" alt="商品名を入力" title="商品名を入力" />商品名を入力</p>
      <p><input type="text" name="name" class="box142" maxlength="50" value="<!--{$smarty.get.name|escape}-->" /></p>

      <p><img src="<!--{$TPL_DIR|escape}-->img/icon/icon_sh.png" alt="価格を入力" title="価格を入力" />価格を入力</p>
      <p><input type="text" name="price_min" class="box47" maxlength="6" value="<!--{$smarty.get.price_min|escape}-->" />円～<input type="text" name="price_max" class="box47" value="<!--{$smarty.get.price_max|escape}-->" />円</p>

      <p class="btn_search"><a href="#" onclick="document.search_form.submit();">検 索<input type="hidden" name="search" /></a></p>
    </form>
</div>
<!--▲検索条件ここまで-->



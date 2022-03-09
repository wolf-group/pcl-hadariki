<!--▼商品検索ここから-->
<div id="searcharea">
	<!--検索フォーム-->
	<form name="search_form" id="search_form" method="get" action="<!--{$smarty.const.URL_DIR}-->smp/products/list.php">
		<p><input type="text" name="name" class="box142" maxlength="50" value="<!--{$smarty.get.name|escape}-->" /></p>
		<p><input type="text" name="price_min" class="box47" maxlength="6" value="<!--{$smarty.get.price_min|escape}-->" />円～
		<input type="text" name="price_max" class="box47" maxlength="6" value="<!--{$smarty.get.price_max|escape}-->" />円</p>
		<p style="margin:0 0 10px 0;">
			<input type="hidden" name="mode" value="search" />
			<select name="category_id" class="box142">
				<option label="すべての商品" value="">全てのカテゴリー一覧</option>
				<!--{html_options options=$arrCatList selected=$category_id}-->
			</select>
		</p>
		<ul>
			<li class="sp_btn">
				<a href="javascript:void(0);" onclick="document.search_form.submit();">検索<input type="hidden" name="search" /></a>
			</li>
		</ul>
	</form>
</div>
<!--▲商品検索ここまで-->

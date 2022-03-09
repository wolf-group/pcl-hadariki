<!--現在のカゴの中ここから-->
<div id="bloc_head">
	<h2 class="t_in_cart">
		現在のカゴの中
	</h2>
</div>
<div id="cartarea">
	<p class="item">商品数：<!--{$arrCartList.0.TotalQuantity|number_format|default:0}-->点</p>
	<p>合計：<span class="price"><!--{$arrCartList.0.ProductsTotal|number_format|default:0}-->円</span><br>
	<!-- カゴの中に商品がある場合にのみ表示 -->
	<!--{if $arrCartList.0.TotalQuantity > 0 and $arrCartList.0.free_rule > 0}-->
		<!--{if !$no_normal_fee_flg}-->
			<!--{if $arrCartList.0.deliv_free > 0}-->
				送料手数料無料まであと<!--{$arrCartList.0.deliv_free|number_format|default:0}-->円（税込）です。
			<!--{else}-->
				現在、送料は「<span class="price">無料</span>」です。
			<!--{/if}-->
		<!--{/if}-->
	<!--{/if}-->
	</p>
	<p class="btn_cart">
		<a href="/cart/index.php">
		カゴの中を見る
		</a>
	</p>
</div>
<!--現在のカゴの中ここまで-->
<!--▼カテゴリここから-->
<div id="categoryarea">
	<h2>カテゴリー一覧</h2>
	<ul id="categorytree">
		<!--{assign var=preLev value=1}-->
		<!--{assign var=firstdone value=0}-->
		<!--{section name=cnt loop=$arrTree}-->
			<!--{* 表示フラグがTRUEなら表示 *}-->
			<!--{if $arrTree[cnt].display == 1}-->
				<!--{assign var=level value=`$arrTree[cnt].level`}-->
				<!--{assign var=levdiff value=`$level-$preLev`}-->
				<!--{if $levdiff > 0}-->
					<ul style="margin-left:10px;">
				<!--{elseif $levdiff == 0 && $firstdone == 1}-->
					</li>
				<!--{elseif $levdiff < 0}-->
					<!--{section name=d loop=`$levdiff*-1`}-->
						</li>
						</ul>
					<!--{/section}-->
					</li>
				<!--{/if}-->
				<li class="level<!--{$level}--><!--{if in_array($arrTree[cnt].category_id, $tpl_category_id) }--> onmark<!--{/if}-->">
					<a href="/smp/product/list/<!--{$arrTree[cnt].category_id}-->"
						<!--{if in_array($arrTree[cnt].category_id, $tpl_category_id) }--> class="onlink"<!--{/if}-->>
						<!--{$arrTree[cnt].category_name|escape}--><!--{if $product_count_disp_flg}-->(<!--{$arrTree[cnt].product_count|default:0}-->)<!--{/if}-->
					</a>
				<!--{if $firstdone == 0}-->
					<!--{assign var=firstdone value=1}-->
				<!--{/if}-->
				<!--{assign var=preLev value=`$level`}-->
			<!--{/if}-->
			<!--{* セクションの最後に閉じタグを追加 *}-->
			<!--{if $smarty.section.cnt.last}-->
				<!--{if $preLev-1 > 0 }-->
					<!--{section name=d loop=`$preLev-1`}-->
						</li>
						</ul>
					<!--{/section}-->
						</li>
					<!--{else}-->
						</li>
				<!--{/if}-->
			<!--{/if}-->
		<!--{/section}-->
	</ul>
</div>
<!--▲カテゴリここまで-->
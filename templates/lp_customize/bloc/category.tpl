<!--商品カテゴリーここから-->
<script type="text/javascript">
$(document).ready(function() {
    $('.onmark ').parents('li').addClass('onmark');
    // adjust li height, position
    $('li[class^=level]').css('background-position','0 8px');
    $('li[class^=level]').css('height','auto');
});
</script>

<div id="bloc_head">
	<h2 class="t_category">
		商品カテゴリー
	</h2>
</div>
<div id="categoryarea">
  <ul id="categorytree">
  <!--{assign var=preLev value=1}-->
  <!--{assign var=firstdone value=0}-->
  <!--{section name=cnt loop=$arrTree}-->
    <!--{* 表示フラグがTRUEなら表示 *}-->
    <!--{if $arrTree[cnt].display == 1}-->
    <!--{assign var=level value=`$arrTree[cnt].level`}-->
    <!--{assign var=levdiff value=`$level-$preLev`}-->
      <!--{if $levdiff > 0}-->
          <ul>
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
    
    <a href="/product/list/<!--{$arrTree[cnt].category_id}-->"<!--{if in_array($arrTree[cnt].category_id, $tpl_category_id) }--> class="onlink"<!--{/if}-->>
        <!--▽カテゴリ画像ここから▽-->
            <!--{if $arrTree[cnt].image_file_name_smp|escape}-->
               <img src="<!--{$smarty.const.IMAGE_SAVE_URL}-->category/<!--{$arrTree[cnt].image_file_name_smp|escape}-->">
            <!--{/if}-->
        <!--△カテゴリ画像ここまで△-->
       
        <!--▽カテゴリテキストここから▽-->
            <span><!--{$arrTree[cnt].category_name|escape}--><!--{if $product_count_disp_flg}-->(<!--{$arrTree[cnt].product_count|default:0}-->)<!--{/if}--></span>
        <!--△カテゴリテキストここまで△-->
    </a>

    <!--{if $firstdone == 0}--><!--{assign var=firstdone value=1}--><!--{/if}-->
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
<!--商品カテゴリーここまで-->
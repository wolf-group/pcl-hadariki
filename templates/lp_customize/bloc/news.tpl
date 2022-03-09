<!--▼新着情報ここから-->
<div id="news_all">
	<div id="bloc_head_news">
		<h2>新着情報</h2>
	</div>
	<div id="newsarea">
		<!--{section name=data loop=$arrNews}-->
		<dl class="news_acd">
			<dt><span><!--{$arrNews[data].news_date_disp|date_format:"%Y年%m月%d日"}--></span>
            	<p>		
                    <!--{if $arrNews[data].news_url}-->
                    <a href="<!--{$arrNews[data].news_url}-->"
                        <!--{if $arrNews[data].link_method eq "2"}-->
                        target="_blank"
                        <!--{/if}-->>
                        <!--{/if}-->
                        <!--{$arrNews[data].news_title|escape|nl2br}-->
                        <!--{if $arrNews[data].news_url}-->
                    </a>
                    <!--{/if}-->
                </p>
            </dt>
			<dd>
	
				<!--{$arrNews[data].news_comment|escape|nl2br}-->
			</dd>
		</dl>
		<!--{/section}-->
		<div class="btnbox">
			<a href="/news/index.php">もっと見る</a>
		</div>
	</div>

	<!--{if $arrReviewView == "ON"}-->
	<!--この商品に対するお客様の声-->
	<div id="customervoicearea">
		<div class="title">
			<h2>この商品に対するお客様の声</h2>
		</div>
		<!--{if $reviewWritableFlg}-->
		<!--★新規コメントを書き込む★-->
		<div class="btn_review">
			<a href="./review.php" onclick="win02('/products/review.php?product_id=<!--{$arrProduct.product_id}-->','review','580','640'); return false;">
				新規コメントを書き込む<input type="hidden" name="review" id="review" />
			</a>
		</div>
	<!--{/if}-->

	<!--{if $tpl_linemax > 0}-->
		<div class="head_review">
			<span style="font-weight:bold;color:#ff0000;"><!--{$tpl_linemax}--></span>件のレビューがございます。    
			<!--{$tpl_strnavi}-->
		</div>
	<!--{/if}-->

	<!--{if count($arrReview) > 0}-->
	<ul>
	<!--{section name=cnt loop=$arrReview}-->
		<li>
			<p class="voicedate"><!--{$arrReview[cnt].create_date|sfDispDBDate:false}-->　投稿者：<!--{if $arrReview[cnt].reviewer_url}--><a href="<!--{$arrReview[cnt].reviewer_url}-->" target="_blank"><!--{$arrReview[cnt].reviewer_name|escape}--></a><!--{else}--><!--{$arrReview[cnt].reviewer_name|escape}--><!--{/if}-->　おすすめレベル：<span class="price"><!--{assign var=level value=$arrReview[cnt].recommend_level}--><!--{$arrRECOMMEND[$level]|escape}--></span></p>
			<!--{if $arrReview[cnt].title}-->
			<p class="voicetitle"><!--{$arrReview[cnt].title|escape}--></p>
		<!--{/if}-->
			<p class="voicecomment"><!--{$arrReview[cnt].comment|escape|nl2br}--></p>
		</li>
		<!--{/section}-->
	</ul>
	<!--{/if}-->
	</div>
	<!--お客様の声ここまで-->
	<!--{/if}-->
</div>
<!--▲新着情報ここまで-->
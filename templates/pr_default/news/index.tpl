<!--{*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2007 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *}-->
<div id="news_m_all ">
	<div id="head_newsm">
		<h2>新着情報</h2>
	</div>

	<p class="nw_txt">☆★☆ 新着情報は<a href="<!--{$smarty.const.URL_DIR}-->rss/index.php" target="_blank">RSS</a>で配信しています。★☆★</p>

	<!--{section name=data loop=$arrNews}-->
	<dl class="nw_area">
		<dt class="nw_day"><!--{$arrNews[data].news_date_disp|date_format:"%Y年%m月%d日"}--></dt>
		<dd class="nw_txt">
			<!--{if $arrNews[data].news_url}-->
			<a href="<!--{$arrNews[data].news_url}-->"<!--{if $arrNews[data].link_method eq "2"}--> target="_blank" <!--{/if}-->>
			<!--{/if}-->
				<!--{$arrNews[data].news_title|escape|nl2br}-->
				<!--{if $arrNews[data].news_url}-->
			</a>
				<!--{/if}--><br />
			<!--{$arrNews[data].news_comment|escape|nl2br}-->
		</dd>
	</dl>
	<!--{/section}-->
</div>

<div class="page_info">
	<ul>
		<!--{if $listOff > 0}-->
		<li class="p_prev"><a href="/news/index.php?offset=<!--{$listOff-$listMax}-->&max=<!--{$listMax}-->">前へ</a></li>
			<!--{else}-->
		<li class="p_prev">前へ<!--{/if}--></li>
			<!--{if $listDataCnt > ($listOff+$listMax)}-->
		<li class="p_next"><a href="/news/index.php?offset=<!--{$listOff+$listMax}-->&max=<!--{$listMax}-->">次へ</a></li>
			<!--{else}-->
		<li class="p_next">次へ<!--{/if}--></li>
	</ul>
</div>
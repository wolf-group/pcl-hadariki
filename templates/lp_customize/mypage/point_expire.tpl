<!--{*
/*
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
 */
*}-->
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
			<div class="mycont_head">
				<h3>ポイント有効期限</h3>
			</div>

			<!--{if $tpl_linemax > 0}-->

				<!--{if $active_point_expire == true}-->

					<!--<p><!--{$tpl_linemax}-->件のポイント履歴があります。</p>-->
						<div>
							<!--▼ページナビ-->
							<!--{$tpl_strnavi}-->
							<!--▲ページナビ-->
						</div>

						<table summary="ポイント有効期限">
							<tr>
								<th>有効期限</th>
								<th>対象ポイント</th>
								<th>使用済<br />ポイント</th>
								<th>失効予定<br />ポイント</th>
								<th>失効後<br />ポイント残高</th>
							</tr>
						<!--{section name=cnt loop=$arrPointExpire}-->
							<tr>
								<td class="centertd"><!--{if $arrPointExpire[cnt].no_limit_expire_flg == true}-->無期限<!--{else}--><!--{$arrPointExpire[cnt].expiration_date2}--><!--{/if}--></td>
								<td class="centertd"><!--{$arrPointExpire[cnt].point|number_format|escape}-->pt</td>
								<td class="centertd"><!--{$arrPointExpire[cnt].used_point|number_format|escape}-->pt</td>
								<td class="centertd"><!--{$arrPointExpire[cnt].point2|number_format|escape}-->pt</td>
								<td class="centertd"><!--{$arrPointExpire[cnt].after_point|number_format|escape}-->pt</td>
							</tr>
						<!--{/section}-->
					</table>
				<!--{else}-->
					<div>現在ポイントに有効期限は設定されていません。</div>
				<!--{/if}-->
				<!--{else}-->
					<p class="p_waku">ポイント有効期限情報はありません。</p>
			<!--{/if}-->

		</form>
	</div>
</div>

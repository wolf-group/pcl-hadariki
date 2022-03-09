<!--▼CONTENTS-->
<div id="mypagecolumn">
	<h2>MYページ</h2>
	<!--{if $tpl_navi != ""}-->
		<!--{include file=$tpl_navi}-->
	<!--{else}-->
		<!--{include file=`$smarty.const.S_TEMPLATE_PATH`/mypage/navi.tpl}-->
	<!--{/if}-->
	<!-- 現在のポイント ここから -->
	<!--{if $point_disp !== false}-->
		<p style="padding:5px">
			ようこそ <br />
			<!--{$CustomerName1|escape}--> <!--{$CustomerName2|escape}-->様<br />
			<!--{if $point_flg != 2}-->
				現在の所持ポイントは<em><!--{$CustomerPoint|number_format|escape|default:"0"}-->pt</em>です。
			<!--{/if}-->
		</p>
	<!--{/if}-->
	<!-- 現在のポイント ここまで -->
	<!--{if $active_point_expire == true}-->
	<div class="mypage_inner">
		<form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="order_id" value="" />
			<input type="hidden" name="pageno" value="<!--{$tpl_pageno}-->" />
			<h3>ポイント有効期限</h3>
			<!--{if $tpl_linemax > 0}-->
				<div>
					<!--▼ページナビ-->
					<!--{$tpl_strnavi}-->
					<!--▲ページナビ-->
				</div>
				<table summary="ポイント有効期限" width="310px" >
					<tr>
						<th rowspan="2">有効期限</th>
						<th>対象<br />ポイント</th>
						<th rowspan="2">失効予定<br />ポイント</th>
						<th rowspan="2">失効後<br />ポイント残高</th>
					</tr>
					<tr>
						<th>使用済<br />ポイント</th>
					</tr>
					<!--{section name=cnt loop=$arrPointExpire}-->
						<tr>
							<td rowspan="2"><!--{$arrPointExpire[cnt].expiration_date2}--></td>
							<td><!--{$arrPointExpire[cnt].point|number_format|escape}-->pt</td>							
							<td rowspan="2"><!--{$arrPointExpire[cnt].point2|number_format|escape}-->pt</td>
       						<td rowspan="2"><!--{$arrPointExpire[cnt].after_point|number_format|escape}-->pt</td>
						</tr>
						<tr>
							<td><!--{$arrPointExpire[cnt].used_point|number_format|escape}-->pt</td>
						</tr>
					<!--{/section}-->
				</table>
		<!--{else}-->
			<p style="padding:5px 5px">ポイント有効期限情報はありません。</p>
		<!--{/if}-->
		</form>
	</div>
	<!--{else}-->
	<div>現在ポイントの有効期限は設定されていません。</div>
	<!--{/if}-->
</div>

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
	<!--{include file=$tpl_navi}-->
	<div id="mycontentsarea">
		<div class="mycont_head">
			<h3>退会手続き</h3>
		</div>
		<form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="confirm" />
				<!--{if $regular_deletable}-->
					<p class="pdtb10">
                       ご利用ありがとうございました。<br /><br />
退会手続きをされた場合、これまでに保存されている購入履歴、お届け先などのお客様の情報は<br />全て削除されます。
よろしければ下記の「退会する」のボタンを押して次のページへ進んで下さい。<br /><br />

<span style="color:#C00;">※定期コースをお申込されている方は、定期コースを解約後に退会手続きを行ってください。</span>
                    </p>

					<ul class="mg_btnarea">
						<li class="mg_newbtn">
								<a href="javascript:void(0);" onclick="document.form1.submit();">退会する<input type="hidden" name="refusal" id="refusal" /></a>
						</li>
					</ul>
				<!--{else}-->
					定期購入契約中のため、退会できません。
				<!--{/if}-->
		</form>
	</div>
</div>
<!--▲CONTENTS-->

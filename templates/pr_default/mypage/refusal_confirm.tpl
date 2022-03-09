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
            <input type="hidden" name="mode" value="complete" />
            <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
                    <p class="pdtb10">
                        いままでご利用ありがとうございました。<bR />
                        退会手続きを実行して下さい。
                    </p>
                    
                    
                    <ul class="mg_btnarea">
                        <li class="mg_newbtn">
                            <a href="javascript:void(0);" onclick="document.form1.submit();">退会します<input type="hidden" name="refusal_yes" id="refusal_yes" /></a>
                        </li>
                    </ul>
                    <p class="pdtb10 cl_red">※ 退会手続きが完了した時点で、現在保存されている購入履歴や、お届け先等の情報はすべてなくなりますのでご注意ください。</p>
                    <div class="mypage_back">
                        <div class="refusal_no">
                                <a href="./refusal.php">退会しないで戻る<input type="hidden" name="refusal_no" id="refusal_no" /></a>
                        </div>
                    </div>
                
            
        </form>
    </div>
</div>
<!--▲CONTENTS-->

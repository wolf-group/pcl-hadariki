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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA	02111-1307, USA.
 */
*}-->
<script type="text/javascript">//<![CDATA[

function fnCheckAfterOpenWin(){
	if (<!--{$tpl_linemax}--> >= <!--{$smarty.const.DELIV_ADDR_MAX}-->){
		alert('最大登録数を超えています');
		return false;
	}else{
		win02('./delivery_addr.php','new_deiv','600','640');
	}
}
//]]>
</script>

<!--▼CONTENTS-->
<div id="mypagecolumn">
	<div class="pankuzuarea">
    	<p style="letter-spacing:0.01em;font-size:80%;"><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./delivery.php">お届け先</a></p>
    </div>
    <div class="mypage_inner">
		<h3>お届け先の変更・確認</h3>
		<p class="pd10">
			会員登録住所以外へのご住所へ送付される場合等にご利用いただくことができます。<br />
			主に複数のお届け先ご住所の表示、変更ができます。<br />
			※最大<!--{$smarty.const.DELIV_ADDR_MAX}-->件まで登録できます。
		</p>
        <h4 class="mycont_headttl mg_shadow">▼ 新規 お届け先を追加</h4>
		<ul>
			<li class="mg_newbtn">
			<!--{if $tpl_linemax < 20}-->
				<a href="<!--{$smarty.const.URL_DIR}-->smp/mypage/delivery_addr_smp.php">新しいお届け先を追加する<input type="hidden" name="newadress" /></a>
			<!--{/if}-->
			</li>
		</ul>
		<!--{if $tpl_linemax > 0}-->
			<form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->" >
				<input type="hidden" name="mode" value="" />
				<input type="hidden" name="other_deliv_id" value="" />
				<input type="hidden" name="pageno" value="<!--{$tpl_pageno}-->" />
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$transactionid|escape}-->" />

				<h4 class="mycont_headttl mgt10 mg_shadow">▼ 登録済み お届け先住所一覧</h4>
                <div class="deliv_table">
                    <table summary="お届け先">
                     <!--{section name=cnt loop=$arrOtherDeliv}-->
                         <!--{assign var=OtherPref value="`$arrOtherDeliv[cnt].pref`"}-->
                            <tr>
                                <td class="centertd" style="width:10%;"><!--{$smarty.section.cnt.iteration}--></td>
                                <td class="lefttd">
                                    〒<!--{$arrOtherDeliv[cnt].zip01}-->-<!--{$arrOtherDeliv[cnt].zip02}--><br />
                                    <!--{$arrPref[$OtherPref]|escape}--><!--{$arrOtherDeliv[cnt].addr01|escape}--><!--{$arrOtherDeliv[cnt].addr02|escape}--><br />
                                    <!--{$arrOtherDeliv[cnt].name01|escape}-->&nbsp;<!--{$arrOtherDeliv[cnt].name02|escape}-->
                                </td>
                            </tr>
                            <tr>
                            	<td colspan="2">
                                	<div class="mg_delivbtn">
                                    	<ul>
                                        	<li><a href="./delivery_addr_smp.php?other_deliv_id=<!--{$arrOtherDeliv[cnt].other_deliv_id}-->">変更</a></li>
                                            <li><a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('delete','other_deliv_id','<!--{$arrOtherDeliv[cnt].other_deliv_id}-->'); return false;">削除</a></li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                        <!--{/section}-->
                    </table>
                </div>
			</form>
		<!--{else}-->
        	<h4 class="mycont_headttl mgt10">▼ 登録済み お届け先住所一覧</h4>
			<p class="no_data1">新しいお届け先はありません。</p>
		<!--{/if}-->
        <div class="mypage_back">
            <a href="./index.php">
                <div class="mg_back">戻る<input type="hidden" name="change" id="change" /></div>
            </a>
        </div>
	</div>
</div>
<!--▲CONTENTS-->

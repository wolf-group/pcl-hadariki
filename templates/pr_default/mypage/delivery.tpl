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
	<div class="head">
		<h2 class="t_mypage">マイページ
        <!--{* ポイント表示 *}-->
        <!--{if $tpl_point}--><!--{include file=$tpl_point}--><!--{/if}-->
        </h2>
	</div>
<!--{include file=$tpl_navi}-->
	<div id="mycontentsarea">
		<div class="mycont_head">
			<h3>お届け先の変更・確認</h3>
		</div>
        
        <p class="mgb20">
                会員登録住所以外へのご住所へ送付される場合等にご利用いただくことができます。<br />
                主に複数のお届け先ご住所の表示、変更ができます。<br />
                ※最大<!--{$smarty.const.DELIV_ADDR_MAX}-->件まで登録できます。
            </p>
            
		<div class="deliv_list">
			<div class="mgt10">
                <h3 class="deliv_head mgb10"><span class="pst3">新規 お届け先を追加</span></h3>
                <div class="del_newbox">
                    <p class="fl_l w50 pst5">
                        <span>新規のお届け先を追加したい場合は「新しいお届け先を追加」ボタンを押してください。</span>
                    </p>
                    <p class="deliv_newbt">
                        <!--{if $tpl_linemax < 20}-->
                            <a href="<!--{$smarty.const.URL_DIR}-->mypage/delivery_addr.php" onclick="win03('./delivery_addr.php','delivadd','600','640'); return false;">新しいお届け先を追加<input type="hidden" name="newadress" /></a>
                        <!--{/if}-->
                    </p>
                </div>
            </div>
                
			<hr />
			<!--{if $tpl_linemax > 0}-->
				<form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->" >
					<input type="hidden" name="mode" value="" />
					<input type="hidden" name="other_deliv_id" value="" />
          <input type="hidden" name="pageno" value="<!--{$tpl_pageno|escape}-->" />
          <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$transactionid|escape}-->" />
					
					<div class="deliv_tb">
                    	<h3 class="deliv_head mgb10"><span class="pst3">登録済み お届け先住所一覧</span></h3>
                        <table summary="お届け先">
                            <tr>
                                <th colspan="5">お届け先リスト</th>
                            </tr>
                            <!--{section name=cnt loop=$arrOtherDeliv}-->
                            <!--{assign var=OtherPref value="`$arrOtherDeliv[cnt].pref`"}-->
                            <tr>
                            <td class="centertd">
                                <!--{$smarty.section.cnt.iteration}-->
                            </td>
                            <td>
                                <label for="add<!--{$smarty.section.cnt.iteration}-->">お届け先住所</label>
                            </td>
                            <td>
                                〒<!--{$arrOtherDeliv[cnt].zip01}-->-<!--{$arrOtherDeliv[cnt].zip02}--><br />
                                <!--{$arrPref[$OtherPref]|escape}--><!--{$arrOtherDeliv[cnt].addr01|escape}--><!--{$arrOtherDeliv[cnt].addr02|escape}--><br />
                                <!--{$arrOtherDeliv[cnt].name01|escape}-->&nbsp;<!--{$arrOtherDeliv[cnt].name02|escape}-->
                            </td>
                            <td class="centertd">
                                <div class="del_bt"><a href="./delivery_addr.php" onclick="win02('./delivery_addr.php?other_deliv_id=<!--{$arrOtherDeliv[cnt].other_deliv_id}-->','deliv_disp','600','640'); return false;">変更</a></div>
                            </td>
                            <td class="centertd">
                                <div class="del_bt"><a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('delete','other_deliv_id','<!--{$arrOtherDeliv[cnt].other_deliv_id}-->'); return false;">削除</a></div>
                            </td>
                        </tr>
                        <!--{/section}-->
                    </table>
                </div>
			</form>
			<!--{else}-->
				<p class="delivempty"><strong>新しいお届け先はありません。</strong></p>
		<!--{/if}-->
        </div>
	</div>
</div>
<!--▲CONTENTS-->

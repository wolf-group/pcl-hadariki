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
			<h3>基本会員情報の変更・確認【確認】</h3>
		</div>
		<p class="mgb20">下記の内容で送信してもよろしいでしょうか？<br />
		よろしければ、一番下の「送信」ボタンをクリックしてください。</p>

		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="complete" />
			<input type="hidden" name="customer_id" value="<!--{$arrForm.customer_id|escape}-->" />
			<!--{foreach from=$arrForm key=key item=item}-->
			<!--{if $key ne "mode" && $key ne "subm"}-->
				<input type="hidden" name="<!--{$key|escape}-->" value="<!--{$item|escape}-->" />
			<!--{/if}-->
			<!--{/foreach}-->
            <div class="mg_change">
				<table summary="会員登録内容変更" >
                    <tr>
                        <th width="40%">お名前</th>
                        <td><!--{$arrForm.name01|escape}-->　<!--{$arrForm.name02|escape}--></td>
                    </tr>
                    <tr>
                        <th>お名前（フリガナ）</th>
                        <td><!--{$arrForm.kana01|escape}-->　<!--{$arrForm.kana02|escape}--></td>
                    </tr>
                    <tr>
                        <th>郵便番号</th>
                        <td><!--{$arrForm.zip01|escape}-->-<!--{$arrForm.zip02|escape}--></td>
                    </tr>
                    <tr>
                        <th>住所</th>
                        <td><!--{$arrPref[$arrForm.pref]|escape}--><!--{$arrForm.addr01|escape}--><!--{$arrForm.addr02|escape}--></td>
                    </tr>
                    <tr>
                        <th>電話番号</th>
                        <td><!--{$arrForm.tel01|escape}-->-<!--{$arrForm.tel02|escape}-->-<!--{$arrForm.tel03|escape}--></td>
                    </tr>
                    <tr>
                        <th>FAX</th>
                        <td><!--{if strlen($arrForm.fax01) > 0}--><!--{$arrForm.fax01|escape}-->-<!--{$arrForm.fax02|escape}-->-<!--{$arrForm.fax03|escape}--><!--{else}-->未登録<!--{/if}--></td>
                    </tr>
                    <tr>
                        <th>メールアドレス</th>
                        <td><a href="<!--{$arrForm.email|escape:'hex'}-->"><!--{$arrForm.email|escape:'hexentity'}--></a></td>
                    </tr>
                    <tr>
                        <th>携帯メールアドレス</th>
                        <td>
                            <!--{if strlen($arrForm.email_mobile) > 0}-->
                                <a href="<!--{$arrForm.email_mobile|escape:'hex'}-->"><!--{$arrForm.email_mobile|escape:'hexentity'}--></a>
                            <!--{else}-->
                                未登録
                            <!--{/if}-->
                        </td>
                    </tr>
                    <tr>
                        <th>職業</th>
                        <td><!--{$arrJob[$arrForm.job]|escape|default:"未登録"}--></td>
                    </tr>
                    <tr>
                        <th>パスワード</th>
                        <td><!--{$passlen}--></td>
                    </tr>
                    <!--{if $arrMailCompulsionView eq "OFF"}-->
                    <tr>
                        <th>メールマガジン送付について</th>
                        <td><!--{$arrMAILMAGATYPE_TwoWay[$arrForm.mailmaga_flg]|escape}--></td>
                    </tr>
                    <!--{/if}-->
                    <!--{if $arrForm.year && $arrForm.year !== '----' }-->
                        <tr>
                            <th>生年月日</th>
                            <td><!--{$arrForm.year|escape}-->年<!--{$arrForm.month|escape}-->月<!--{$arrForm.day|escape}-->日</td>
                        </tr>
                    <!--{/if}-->
                </table>
                <!--{if $arrForm.edit_regular_master_deliv_addr}-->
                <div class="p_waku3">
                    <p class="attention">※ 全ての定期注文のお届け先住所も、変更した住所に変更する</p>
                </div>
                <!--{/if}-->
                <div class="btn_rpst3_2">
                    <span class="btn_mgprev"><a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('return', '', ''); return false;">前のページへ<input type="hidden" name="back" id="back" /></a></span>
                </div>
                <ul class="btn_area_n2">
                    <li class="btn">
                        <span class="btn_next"><a href="javascript:void(0);" onclick="document.form1.submit();">送 信<input type="hidden" name="complete" id="complete" /></a></span>
                    </li>
                </ul>
            </div>
		</form>
	</div>
</div>
<!--▲CONTENTS-->

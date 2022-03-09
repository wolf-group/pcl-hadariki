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
<!--▼CONTENTS-->
<div id="guidecolumn">
		<div class="head">
			<h2 class="t_entry">会員登録</h2>
		</div>
    <p>下記の内容で送信してもよろしいでしょうか？<br />
      よろしければ、一番下の「会員登録完了へ」ボタンをクリックしてください。</p>
    <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
      <input type="hidden" name="mode" value="complete">
      <!--{foreach from=$list_data key=key item=item}-->
        <input type="hidden" name="<!--{$key|escape}-->" value="<!--{$item|escape}-->" />
      <!--{/foreach}-->
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />

      <table summary="入力内容確認">
        <tr>
          <th>お名前<span class="attention">※</span></th>
          <td>
            <!--{$list_data.name01|escape}-->&nbsp;
            <!--{$list_data.name02|escape}-->
          </td>
        </tr>
        <tr>
          <th>お名前（フリガナ）<span class="attention">※</span></th>
          <td>
            <!--{$list_data.kana01|escape}-->&nbsp;
            <!--{$list_data.kana02|escape}-->
          </td>
        </tr>
        <tr>
          <th>郵便番号<span class="attention">※</span></th>
          <td>
            〒<!--{$list_data.zip01|escape}--> - <!--{$list_data.zip02|escape}-->
          </td>
        </tr>
        <tr>
          <th>住所<span class="attention">※</span></th>
          <td>
            <!--{$arrPref[$list_data.pref]|escape}--><!--{$list_data.addr01|escape}--><!--{$list_data.addr02|escape}-->
          </td>
        </tr>
        <tr>
          <th>電話番号<span class="attention">※</span></th>
          <td>
            <!--{$list_data.tel01|escape}--> - <!--{$list_data.tel02|escape}--> - <!--{$list_data.tel03|escape}-->
          </td>
        </tr>
        <tr>
          <th>FAX</th>
          <td>
            <!--{if strlen($list_data.fax01) > 0 && strlen($list_data.fax02) > 0 && strlen($list_data.fax03) > 0}-->
              <!--{$list_data.fax01|escape}--> - <!--{$list_data.fax02|escape}--> - <!--{$list_data.fax03|escape}-->
            <!--{else}-->
              未登録
            <!--{/if}-->
          </td>
        </tr>
        <tr>
          <th>メールアドレス<span class="attention">※</span></th>
          <td>
            <a href="mailto:<!--{$list_data.email|escape:'hex'}-->"><!--{$list_data.email|escape:'hexentity'}--></a>
          </td>
        </tr>
        <tr>
          <th>性別<!--{if $req_setting.pc_sex == 'REQUIRED'}--><span class="attention">※</span><!--{/if}--></th>
          <td>
            <!--{if $list_data.sex eq 1}-->
            男性
            <!--{elseif $list_data.sex eq 2}-->
            女性
			<!--{else}-->
			未回答
            <!--{/if}-->
          </td>
        </tr>
        <tr>
          <th>職業</th>
          <td><!--{$arrJob[$list_data.job]|escape|default:"未登録"}--></td>
        </tr>
        <tr>
          <th>生年月日<!--{if $req_setting.pc_birth == 'REQUIRED'}--><span class="attention">※</span><!--{/if}--></th>
          <td>
            <!--{if strlen($list_data.year) > 0 && strlen($list_data.month) > 0 && strlen($list_data.day) > 0}-->
              <!--{$list_data.year|escape}-->年<!--{$list_data.month|escape}-->月<!--{$list_data.day|escape}-->日
            <!--{else}-->
            未回答
            <!--{/if}-->
          </td>
        </tr>
        <tr>
          <th>希望するパスワード<span class="attention">※</span><br />
            <span class="mini">パスワードは購入時に必要です</span>
          </th>
          <td><!--{$passlen}--></td>
        </tr>
        <!--{if $arrMailCompulsionView eq "OFF"}-->
        <tr>
          <th>メールマガジン送付について<span class="attention">※</span></th>
          <td>
            <!--{if $list_data.mailmaga_flg eq 1}-->
            HTMLメール＋テキストメールを受け取る
            <!--{elseif $list_data.mailmaga_flg eq 2}-->
            テキストメールを受け取る
            <!--{else}-->
            受け取らない
            <!--{/if}-->
          </td>
        </tr>
        <!--{/if}-->
      </table>

		<div class="btn_rpst1e">
			<span class="btn_prev"><a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('return', '', ''); return false;">前のページへ<input type="hidden" name="back" id="back" /></a></span>
		</div>
		<div class="btn_rpst2e">
			<span class="btn_next"><a href="javascript:void(document.form1.submit())">登録完了ページへ<input type="hidden" name="send" id="send" /></a></span>
		</div>
    </form>
</div>
<!--▲CONTENTS-->


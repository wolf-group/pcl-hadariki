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

<div id="guidecolumn">
		<div class="head">
			<h2 class="t_contact">お問い合わせ</h2>
		</div>
    <p>下記入力内容で送信してもよろしいでしょうか？<br />
      よろしければ、一番下の「送信」ボタンをクリックしてください。</p>
    <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
      <input type="hidden" name="mode" value="complete" />
      <!--{foreach key=key item=item from=$arrForm}-->
        <!--{if $key ne 'mode'}-->
          <input type="hidden" name="<!--{$key|escape}-->" value="<!--{$item|escape}-->" />
        <!--{/if}-->
      <!--{/foreach}-->
      <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$transactionid|escape}-->" />

      <table summary="お問い合わせ内容確認">
        <tr>
          <th>お名前<span class="attention">※</span></th>
          <td><!--{$arrForm.name01|escape}-->　<!--{$arrForm.name02|escape}--></td>
        </tr>
        <tr>
          <th>お名前（フリガナ）<span class="attention">※</span></th>
          <td><!--{$arrForm.kana01|escape}-->　<!--{$arrForm.kana02|escape}--></td>
        </tr>
        <tr>
          <th>郵便番号</th>
          <td>
             <!--{if strlen($arrForm.zip01) > 0 && strlen($arrForm.zip02) > 0}-->
               〒<!--{$arrForm.zip01|escape}-->-<!--{$arrForm.zip02|escape}-->
             <!--{/if}-->
          </td>
        </tr>
        <tr>
          <th>住所</th>
          <td><!--{$arrPref[$arrForm.pref]}--><!--{$arrForm.addr01|escape}--><!--{$arrForm.addr02|escape}--></td>
        </tr>
        <tr>
          <th>電話番号</th>
          <td>
            <!--{if strlen($arrForm.tel01) > 0 && strlen($arrForm.tel02) > 0 && strlen($arrForm.tel03) > 0}-->
              <!--{$arrForm.tel01|escape}-->-<!--{$arrForm.tel02|escape}-->-<!--{$arrForm.tel03|escape}-->
            <!--{/if}-->
          </td>
        </tr>
        <tr>
          <th>メールアドレス<span class="attention">※</span></th>
          <td><a href="mailto:<!--{$arrForm.email|escape:'hex'}-->"><!--{$arrForm.email|escape:'hexentity'}--></a></td>
        </tr>
        <!--{if $arrForm.contact_type}-->
        <tr>
          <th>お問い合わせ種別<!--{if $contactRequired === $contact_stting_required}--><span class="attention">※</span><!--{/if}--></th>
          <td>
              <!--{$arrForm.contact_type|escape}-->
          </td>
        </tr>
        <!--{/if}-->
        <tr>
          <th>お問い合わせ内容<span class="attention">※</span><br />
             <span class="mini">（全角1000字以下）</span></th>
          <td><!--{$arrForm.contents|escape|nl2br}--></td>
        </tr>
      </table>
		<ul class="btn_area_n2">
			<li class="btn2">
				<span class="btn_prev">
					<a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('return', '', ''); return false;">前のページへ <input type="hidden" name="back02" id="back02" /></a>
				</span>
			</li>
			<li class="btn">
				<span class="btn_next">
					<a href="javascript:void(0);" onclick="document.form1.submit(); return false;">送&nbsp信<input type="hidden" name="send" id="send"/></a>
				</span>
			</li>
		</ul>
     </form>
</div>
<!--▲CONTENTS-->


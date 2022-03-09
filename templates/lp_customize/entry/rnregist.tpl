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
 * This file is for New purchase process. add by kitamura 2012-07-06
 *}-->
<!--▼CONTENTS-->
<div id="guidecolumn">
    <!--{$add_html}-->
    <div class="head">
      <h2 class="t_entry">会員登録</h2>
    </div>
    <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
      <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
      <input type="hidden" name="mode" value="complete" />
      <input type="hidden" name="cr" value="<!--{$arrForm.cr|escape}-->" />
      <table summary="会員登録フォーム">
        <tr>
          <th>お名前<span class="attention">※</span></th>
          <td>
            <span class="attention"><!--{$arrErr.name01}--><!--{$arrErr.name02}--></span>
            姓&nbsp;<input type="text" name="name01" value="<!--{$name01|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name01|sfGetErrorColor}-->; ime-mode: active;" class="box120" />&nbsp;
            名&nbsp;<input type="text" name="name02" value="<!--{$name02|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name02|sfGetErrorColor}-->; ime-mode: active;" class="box120" />
          </td>
        </tr>
        <tr>
          <th>お名前（フリガナ）<span class="attention">※</span></th>
          <td>
            <span class="attention"><!--{$arrErr.kana01}--><!--{$arrErr.kana02}--></span>
            セイ&nbsp;<input type="text" name="kana01" class="box120" value="<!--{$kana01|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana01|sfGetErrorColor}-->; ime-mode: active;" />&nbsp;
            メイ&nbsp;<input type="text" name="kana02" class="box120" value="<!--{$kana02|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana02|sfGetErrorColor}-->; ime-mode: active;" />
          </td>
        </tr>
        <tr>
          <th>郵便番号<span class="attention">※</span></th>
          <td>
            <!--{assign var=key1 value="zip01"}-->
            <!--{assign var=key2 value="zip02"}-->
            <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
            <div class="yuubin">〒&nbsp;<input type="text" name="zip01" value="<!--{if $zip01 == ""}--><!--{$arrOtherDeliv.zip01|escape}--><!--{else}--><!--{$zip01|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.ZIP01_LEN}-->" style="<!--{$arrErr.zip01|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" />&nbsp;-&nbsp;<input type="text" name="zip02" value="<!--{if $zip02 == ""}--><!--{$arrOtherDeliv.zip02|escape}--><!--{else}--><!--{$zip02|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.ZIP02_LEN}-->" style="<!--{$arrErr.zip02|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" />&nbsp;
              <a href="http://www.post.japanpost.jp/zipcode/" target="_blank"><span class="fs10">郵便番号検索</span></a>
            </div><br><br>
                <span class="mini">&nbsp;郵便番号を入力後、クリックしてください。</span>
                <a href="#" onclick="fnCallAddress('<!--{$smarty.const.URL_INPUT_ZIP}-->', 'zip01', 'zip02', 'pref', 'addr01'); return false;" target="_blank"><span class="btn_ad">住所自動入力</span></a>

          </td>
        </tr>
        <tr>
          <th>住所<span class="attention">※</span></th>
          <td><span class="attention"><!--{$arrErr.pref}--><!--{$arrErr.addr01}--><!--{$arrErr.addr02}--></span>
              <select name="pref" style="<!--{$arrErr.pref|sfGetErrorColor}-->">
                <option value="" selected="selected">都道府県を選択</option>
                <!--{html_options options=$arrPref selected=$pref}-->
              </select>
             <p class="mini"><input type="text" name="addr01" class="box380" value="<!--{$addr01|escape}-->" style="<!--{$arrErr.addr01|sfGetErrorColor}-->; ime-mode: active;" /><br />
             <!--{$smarty.const.SAMPLE_ADDRESS1}--></p>
             <p class="mini"><input type="text" name="addr02" value="<!--{$addr02|escape}-->" style="<!--{$arrErr.addr02|sfGetErrorColor}-->; ime-mode: active;" class="box380" /><br />
             <!--{$smarty.const.SAMPLE_ADDRESS2}--></p>
            <p class="mini"><em>住所は2つに分けてご記入いただけます。<br />マンション名は必ず記入してください。</em></p>
          </td>
        </tr>
        <tr>
          <th>電話番号<span class="attention">※</span></th>
          <td>
            <span class="attention"><!--{$arrErr.tel01}--><!--{$arrErr.tel02}--><!--{$arrErr.tel03}--></span>
            <input type="text" name="tel01" value="<!--{$tel01|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" class="box60" style="<!--{$arrErr.tel01|sfGetErrorColor}-->; ime-mode: disabled;" />&nbsp;-&nbsp;<input type="text" name="tel02" value="<!--{$tel02|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel02|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" />&nbsp;-&nbsp;<input type="text" name="tel03" value="<!--{$tel03|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel03|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" />
          </td>
        </tr>
        <tr>
          <th>FAX</th>
          <td><span class="attention"><!--{$arrErr.fax01}--><!--{$arrErr.fax02}--><!--{$arrErr.fax03}--></span>
            <input type="text" name="fax01" value="<!--{$fax01|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->"  style="<!--{$arrErr.fax01|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" />&nbsp;-&nbsp;<input type="text" name="fax02" value="<!--{$fax02|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.fax02|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" />&nbsp;-&nbsp;<input type="text" name="fax03" value="<!--{$fax03|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.fax03|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" />
          </td>
        </tr>
        <tr>
          <th>メールアドレス<span class="attention">※</span></th>
          <td>
            <span class="attention"><!--{$arrErr.email}--><!--{$arrErr.email02}--></span>
            <div><input type="text" name="email" class="box380" value="<!--{$email|escape}-->" style="<!--{$arrErr.email|sfGetErrorColor}-->; ime-mode: disabled;" /></div>
            <div><input type="text" name="email02" class="box380" value="<!--{$email02|escape}-->" style="<!--{$arrErr.email02|sfGetErrorColor}-->; ime-mode: disabled;" /></div>
            <p class="mini"><em>確認のため2度入力してください。</em></p>
          </td>
        </tr>
        <tr>
          <th>性別<!--{if $req_setting.pc_sex == 'REQUIRED'}--><span class="attention">※</span><!--{/if}--></th>
          <td>
            <span class="attention"><!--{$arrErr.sex}--></span>
            <input type="radio" name="sex" id="man" value="1" style="<!--{$arrErr.sex|sfGetErrorColor}-->" <!--{if $sex eq 1}--> checked="checked"<!--{/if}--> /><label for="man">男性</label>
            &nbsp;<input type="radio" name="sex" id="woman" value="2" style="<!--{$arrErr.sex|sfGetErrorColor}-->" <!--{if $sex eq 2}--> checked="checked"<!--{/if}--> /><label for="woman">女性</label>
			<!--{if $req_setting.pc_sex == 'OPTIONAL'}-->
			&nbsp;<input type="radio" name="sex" id="no_sex" value="0" style="<!--{$arrErr.sex|sfGetErrorColor}-->" <!--{if $sex eq 0}--> checked="checked"<!--{/if}--> /><label for="no_sex">未回答</label>
			<!--{/if}-->
          </td>
        </tr>
        <tr>
          <th>職業</th>
          <td>
            <span class="attention"><!--{$arrErr.job}--></span>
            <select name="job" style="<!--{$arrErr.job|sfGetErrorColor}-->">
              <option value="" selected="selected">選択してください</option>
              <!--{html_options options=$arrJob selected=$job}-->
            </select>
          </td>
        </tr>
        <tr>
          <!--{if !$year|is_numeric}-->
          	<!--{assign var=year value=$smarty.const.DEFAULT_BIRTH_YEAR}-->
          <!--{/if}-->
          <th>生年月日<!--{if $req_setting.pc_birth == 'REQUIRED'}--><span class="attention">※</span><!--{/if}--></th>
          <td>
            <span class="attention"><!--{$arrErr.year}--><!--{$arrErr.month}--><!--{$arrErr.day}--></span>
            <select name="year" style="<!--{$arrErr.year|sfGetErrorColor}-->">
              <!--{html_options options=$arrYear selected=$year}-->
            </select><span style="float: left; margin: 2px 3px 0 2px;">年</span>
            <select name="month" style="<!--{$arrErr.year|sfGetErrorColor}-->">
              <option value="">--</option>
              <!--{html_options options=$arrMonth selected=$month}-->
            </select><span style="float: left; margin: 2px 3px 0 2px;">月</span>
            <select name="day" style="<!--{$arrErr.year|sfGetErrorColor}-->">
              <option value="">--</option>
              <!--{html_options options=$arrDay selected=$day}-->
            </select><span style="float: left; margin: 2px 3px 0 2px;">日</span>
          </td>
        </tr>
        <tr>
          <th>希望するパスワード<span class="attention">※</span><br />
            <span class="mini">パスワードは購入時に必要です</span></th>
          <td>
            <span class="attention"><!--{$arrErr.password}--><!--{$arrErr.password02}--></span>
            <div><input type="password" name="password" value="<!--{$arrForm.password|escape}-->" class="box120" style="<!--{$arrErr.password|sfGetErrorColor}-->"/></div>
            <p class="mini attention"><!--{$password_rule.message|escape}--></p>
            <div><input type="password" name="password02" value="<!--{$arrForm.password02|escape}-->" class="box120"  style="<!--{$arrErr.password02|sfGetErrorColor}-->"/></div>
            <p class="mini attention">確認のため2度入力してください。</p>
        </tr>
        <!--{if $arrMailCompulsionView eq "ON"}-->
        	<input type="hidden" name="mailmaga_flg" id="html" value="1">
        <!--{else}-->
	        <tr>
	          <th>メールマガジン送付について<span class="attention">※</span></th>
	          <td>
	            <span class="attention"><!--{$arrErr.mailmaga_flg}--></span>
	            <div>
	              <input type="radio" name="mailmaga_flg" id="html" value="1"
	                     style="<!--{$arrErr.mailmaga_flg|sfGetErrorColor}-->"
	              <!--{if $mailmaga_flg eq 1 || $mailmaga_flg eq ""}--> checked="checked"<!--{/if}--> /><label for="html">HTMLメール＋テキストメールを受け取る</label>
	            </div>
	            <div>
	              <input type="radio" name="mailmaga_flg" id="text" value="2"
	                     style="<!--{$arrErr.mailmaga_flg|sfGetErrorColor}-->"
	              <!--{if $mailmaga_flg eq 2}--> checked="checked"<!--{/if}--> /><label for="text">テキストメールを受け取る</label>
	            </div>
	            <div>
	              <input type="radio" name="mailmaga_flg" id="no" value="3"
	                     style="<!--{$arrErr.mailmaga_flg|sfGetErrorColor}-->"
	              <!--{if $mailmaga_flg eq 3}--> checked="checked"<!--{/if}--> /><label for="no">受け取らない</label>
	            </div>
	          </td>
	        </tr>
	    <!--{/if}-->

      </table>
      <ul class="btn_area_l2">
        <li class="btn" style="background-color:#666666;">
          <span class="btn_next"><a href="javascript:void(0);" onclick="window.open('./kiyaku_popup.php','', 'width=600, height=740, menubar=no, toolbar=no, scrollbars=yes');" style="color:#F60;text-decoration:underline;">会員規約を見る</a></span>
        </li>
      </ul>
      <div style="clear:left;"> </div>
      <div style="height:100px;padding:0 0 0 220px;">
        <div class="btn_rpst1e" style="margin-left:10px;background-color:#ffffff;">
          <span class="btn_prev">
            <a href="/">同意しない</a>
           </span>
        </div>
        <div class="btn_rpst2e" style="margin-right:10px;background-color:#666666;">
          <span class="btn_next">
           <a href="javascript:void(0);" onclick="if(!window.confirm('ご入力された内容で登録します。登録しても宜しいですか。')){return false;}fnModeSubmit('complete','','');">
            送信
           </a>
          </span>
        </div>
       </div>
    </form>
</div>
<!--▲CONTENTS-->

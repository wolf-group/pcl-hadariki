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
<style type="text/css">
<!--
div#under02column_shopping .box60 {
    width: 60px;
    padding: 2px;
    border: 1px solid #ccc;
}

div#under02column_shopping .box120 {
    width: 120px;
    padding: 2px;
    border: 1px solid #ccc;
}
-->
</style>

<script type="text/javascript" src="<!--{$smarty.const.URL_DIR}-->js/mask.js" ></script>
<script type="text/javascript">//<![CDATA[

var done = {};
done.card_no1 = false;
done.card_no2 = false;
done.card_no3 = false;

function next(now, next) {
    if (now.value.length >= now.getAttribute('maxlength') && !done[now.name]) {
        next.focus();
        done[now.name] = true;
    } else if (now.value.length < now.getAttribute('maxlength')) {
        done[now.name] = false;
    }
}

var send = true;
var sm = new ScreenMask($);
var complete_flg = false;
function fnCheckSubmit(mode, key, val) {
	complete_flg = true;
    sm.append();
    if(send) {
    $('input[name="card_save_flg"]').attr('disabled' , false);
        send = false;
        fnModeSubmit(mode, key, val);
        return true;
    } else {
        alert("只今、処理中です。しばらくお待ち下さい。");
        return false;
    }
}

//]]>
</script>
<!--▼CONTENTS-->
<div id="shoppingcolumn">
  <div id="shopping_inner">
    <!--{$add_html}-->

    <h2>
    お支払い方法：<!--{$tpl_payment_method}-->
    </h2>

    <!--{if $arrErr.paygent_err}-->
    <table summary="お支払い方法">
      <tr>
        <td class="lefttd">
          <p class="attention">エラーが発生しました：<!--{$arrErr.paygent_err|escape}--></p>
        </td>
      </tr>
    </table>
    <!--{/if}-->
    <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->" >
    <input type="hidden" name="mode" value="register" />
    <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
    <input type="hidden" name="usecard" value="" />
    <input type="hidden" name="deleteCardSeq" value="" />

    <table summary="決済情報の入力">
      <tr class="new_conveni_info">
        <th>利用コンビニエンスストア選択<span class="attention">※</span></th>
      </tr>
      <tr class="new_conveni_info">
        <td>
          <!--{assign var=key1 value="use_conveni_cd"}-->
          <span class="attention"><!--{$arrErr[$key1]}--></span>
          <select name="<!--{$key1}-->">
          <!--{foreach from=$arrConveniList item=conveni_text key=conveni_cd}--> 
          <option value="<!--{$conveni_cd}-->" <!--{if $conveni_cd == $arrForm[$key1].value|escape}-->selected="selected"<!--{/if}-->><!--{$conveni_text}--></option>
          <!--{/foreach}-->
          </select>
        </td>
      </tr>
      <tr  class="new_conveni_info">
        <th>利用者氏名<span class="attention">※</span></th>
      </tr>
      <tr class="new_conveni_info">
        <td>
          <!--{assign var=key1 value="conveni_customer_name01"}-->
          <!--{assign var=key2 value="conveni_customer_name02"}-->
          <span class="attention"><!--{$arrErr[$key1]}--></span>
          <span class="attention"><!--{$arrErr[$key2]}--></span>
          姓：<input type="text"
                 name="<!--{$key1}-->"
                 value="<!--{$arrForm[$key1].value|escape}-->"
                 maxlength="<!--{$arrForm[$key1].length}-->"
                 style="<!--{$arrErr[$key1]|sfGetErrorColor}-->"
                 onkeyup="next(this, this.form.<!--{$key2}-->)"
                 class="box60" />&nbsp;&nbsp;<br />
          名：<input type="text"
                 name="<!--{$key2}-->"
                 value="<!--{$arrForm[$key2].value|escape}-->"
                 maxlength="<!--{$arrForm[$key2].length}-->" 
                 style="<!--{$arrErr[$key2]|sfGetErrorColor}-->"
                 onkeyup="next(this, this.form.<!--{$key2}-->)"
                 class="box60" /><br />
       <p class="mini" style="text-align:left">
         全角入力(例：山田&nbsp;太郎)</p>
        </td>
      </tr>
      <tr  class="new_conveni_info">
        <th>利用者氏名（カナ）<span class="attention">※</span></th>
      </tr>
      <tr class="new_conveni_info">
        <td>
          <!--{assign var=key1 value="conveni_customer_kana_name01"}-->
          <!--{assign var=key2 value="conveni_customer_kana_name02"}-->
          <span class="attention"><!--{$arrErr[$key1]}--></span>
          <span class="attention"><!--{$arrErr[$key2]}--></span>
            姓：<input type="text"
                          name="<!--{$key1}-->"
                          value="<!--{$arrForm[$key1].value|escape}-->"
                          maxlength="<!--{$arrForm[$key1].length}-->"
                          style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" 
                          class="box60" />&nbsp;&nbsp;<br />
            名：<input type="text"
                          name="<!--{$key2}-->"
                          value="<!--{$arrForm[$key2].value|escape}-->"
                          maxlength="<!--{$arrForm[$key2].length}-->"
                          style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" 
                          class="box60" /><br />
         <p class="mini" style="text-align:left">
            半角ｶﾅ入力(例：ﾔﾏﾀﾞ&nbsp;ﾀﾛｳ)
          </p>
        </td>
      </tr>
      <tr  class="new_conveni_info">
        <th>利用者電話番号<span class="attention">※</span></th>
      </tr>
      <tr class="new_conveni_info">
        <td>
          <!--{assign var=key1 value="conveni_customer_tel01"}-->
          <!--{assign var=key2 value="conveni_customer_tel02"}-->
          <!--{assign var=key3 value="conveni_customer_tel03"}-->
          <span class="attention"><!--{$arrErr[$key1]}--></span>
          <span class="attention"><!--{$arrErr[$key2]}--></span>
          <span class="attention"><!--{$arrErr[$key3]}--></span>
            <input type="text"
                          name="<!--{$key1}-->"
                          value="<!--{$arrForm[$key1].value|escape}-->"
                          maxlength="<!--{$arrForm[$key1].length}-->"
                          style="width:50px;<!--{$arrErr[$key1]|sfGetErrorColor}-->"
                          size="4" 
                          >&nbsp;-&nbsp;
             <input type="text"
                          name="<!--{$key2}-->"
                          value="<!--{$arrForm[$key2].value|escape}-->"
                          maxlength="<!--{$arrForm[$key2].length}-->"
                          size="4" 
                          style="width:50px;<!--{$arrErr[$key2]|sfGetErrorColor}-->"
                          >&nbsp;-&nbsp;
             <input type="text"
                          name="<!--{$key3}-->"
                          value="<!--{$arrForm[$key3].value|escape}-->"
                          maxlength="<!--{$arrForm[$key3].length}-->"    
                          size="4" 
                          style="width:50px;<!--{$arrErr[$key3]|sfGetErrorColor}-->"
                          ><br />
          <p class="mini">
            半角数字入力(例：03-1111-2222)
          </p>
        </td>
      </tr>
      </table>
      
      
      <table>
        <tr>
          <td class="lefttd">以上の内容で間違いなければ、下記「注文を確定する」ボタンをクリックしてください。<br />
          <span class="attention">※&nbsp;画面が切り替るまで少々時間がかかる場合がございますが、そのままお待ちください。</span></td>
        </tr>
      </table>

      <ul class="btn_area"> 
        <li class="prv_btn">
          <a href="javascript:void(0);" onclick="fnModeSubmit('return','',''); return false;">前のページへ戻る</a>
          <input type="hidden" name="back03" id="back03" />
        </li>
        <li class="nx_btn">
          <a href="javascript:void(0);" onclick="fnCheckSubmit('register', '', '');return false;">注文を確定する</a>
          <input type="hidden" name="last" id="last" />
        </li>
      </ul>

    </form>
  </div>
</div>
<!--▲CONTENTS-->
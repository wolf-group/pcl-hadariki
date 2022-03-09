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

<script type="text/javascript" src="<!--{$smarty.const.URL_DIR}-->js/mask.js?<!--{$smarty.const.FRONT_JS_VERSION}-->" ></script>
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

$(document).ready(function() {
	<!--{assign var=key value="use_card_type"}-->
    <!--{if $useable_register_card_info_flg && $tpl_saved_card_info_activity}-->
	  <!--{if $arrForm[$key].value == 2 || !$arrForm[$key].value}-->
	  _disableCardInfo();
	  <!--{else}-->
	  _activateCardInfo();
	  <!--{/if}-->
    <!--{else}-->
    _activateCardInfo();
    <!--{/if}-->

	$('input[name="use_card_type"]').bind('click' , function() {
		if ($(this).attr('checked') == "checked" ||
				$(this).attr('checked') == true  || $(this).prop('checked') == true ) {
					if ($(this).val() == 1) {
						_activateCardInfo();
					}
					else {
						_disableCardInfo();
					}
				}
	});

	$('window').bind('unload' , function() {
		if (complete_flg == false) return true;
		alert('現在処理中です');
		return false;
	});
});

function _disableCardInfo()
{
	$('.new_card_info').hide();
	$('#card_save_flg_2').show();
	$('label[for="card_save_flg_2"]').show();
	$('input[name="card_save_flg"]').each(function() {
		if ($(this).val() == 2)  {
			$(this).prop('checked' , true);
		}
		$(this).attr('disabled' , true);
	});
	$('input[name="use_card_info_id"]').attr('disabled' , false);
}

function _activateCardInfo()
{
	$('.new_card_info').show();
	$('input[name="card_save_flg"]').attr('disabled' , false);
	$('#card_save_flg_1').prop('checked' , true);
	$('#card_save_flg_2').hide();
	$('label[for="card_save_flg_2"]').hide();
	$('input[name="use_card_info_id"]').attr('disabled' , true);
}
//]]>
</script>

<!--▼CONTENTS-->
<div id="shoppingcolumn">
    <!--{$add_html}-->
	<!--Start Flow Area-->
	<div class="flowarea">
         <img src="<!--{$TPL_DIR}-->img/shopping/flow04-1.png" style="margin:0 auto;" />
	</div>
	<!--End Flow Area-->

    <table summary="お支払い方法">
      <tr>
        <td class="lefttd">お支払い方法：<!--{$tpl_payment_method}--><br /></td>
      </tr>
    </table>

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

    <!--{assign var=key1 value="use_card_type"}-->
    <!--{if $useable_register_card_info_flg && $tpl_saved_card_info_activity}-->
    <table >
    	<tr>
    		<td>
    		<input <!--{if $arrForm[$key1].value == 1 }-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="1" id="<!--{$key1}-->_1" /><label for="<!--{$key1}-->_1" >カード情報を入力する</label>
    		<input <!--{if $arrForm[$key1].value == 2  || !$arrForm[$key1].value}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="2" id="<!--{$key1}-->_2" /><label for="<!--{$key1}-->_2" >登録済みカードを使用する</label>
    		</td>
    	</tr>
    </table>
    <!--{else}-->
    <input type="hidden" name="<!--{$key1}-->" value="1" />
    <!--{/if}-->

    <table summary="決済情報の入力">
      <tr class="new_card_info">
        <th>カード番号<span class="attention">※</span></th>
        <td>
          <!--{assign var=key1 value="card_no1"}-->
          <!--{assign var=key2 value="card_no2"}-->
          <!--{assign var=key3 value="card_no3"}-->
          <!--{assign var=key4 value="card_no4"}-->
          <span class="attention"><!--{$arrErr[$key1]}--></span>
          <span class="attention"><!--{$arrErr[$key2]}--></span>
          <span class="attention"><!--{$arrErr[$key3]}--></span>
          <span class="attention"><!--{$arrErr[$key4]}--></span>
          <input type="text"
                 name="<!--{$key1}-->"
                 value="<!--{$arrForm[$key1].value|escape}-->"
                 maxlength="<!--{$arrForm[$key1].length}-->"
                 class="box60"
                 style="ime-mode: disabled; <!--{$arrErr[$key1]|sfGetErrorColor}-->"
                 onkeyup="next(this, this.form.<!--{$key2}-->)"
                 size="6" />&nbsp;-&nbsp;
          <input type="text"
                 name="<!--{$key2}-->"
                 value="<!--{$arrForm[$key2].value|escape}-->"
                 maxlength="<!--{$arrForm[$key2].length}-->"
                 class="box60"
                 style="ime-mode: disabled; <!--{$arrErr[$key2]|sfGetErrorColor}-->"
                 size="6"
                 onkeyup="next(this, this.form.<!--{$key3}-->)" />&nbsp;-&nbsp;
          <input type="text"
                 name="<!--{$key3}-->"
                 value="<!--{$arrForm[$key3].value|escape}-->"
                 maxlength="<!--{$arrForm[$key3].length}-->"
                 class="box60"
                 style="ime-mode: disabled; <!--{$arrErr[$key3]|sfGetErrorColor}-->"
                 size="6"
                 onkeyup="next(this, this.form.<!--{$key4}-->)" />&nbsp;-&nbsp;
          <input type="text"
                 name="<!--{$key4}-->"
                 value="<!--{$arrForm[$key4].value|escape}-->"
                 maxlength="<!--{$arrForm[$key4].length}-->"
                 class="box60"
                 style="ime-mode: disabled; <!--{$arrErr[$key4]|sfGetErrorColor}-->"
                 size="6" />
          <p class="mini">半角入力(例：1234-5678-9012-3456)</p>
        </td>
      </tr>
      <tr  class="new_card_info">
        <th>有効期限<span class="attention">※</span></th>
        <td>
          <!--{assign var=key1 value="card_expiration_month"}-->
          <!--{assign var=key2 value="card_expiration_year"}-->
          <span class="attention"><!--{$arrErr[$key1]}--></span>
          <span class="attention"><!--{$arrErr[$key2]}--></span>
          <div style="float:left;">
            <select name="<!--{$key1}-->"
              value="<!--{$arrForm[$key1].value|escape}-->"
              maxlength="<!--{$arrForm[$key1].length}-->"
              style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" >
              <option value="">--</option>
              <!--{html_options options=$arrMonth selected=$arrForm[$key1].value|escape}-->
            </select><span style="position:relative;top:10px;">　月　/　</span>
          </div>
           <div style="float:left;">
            <select name="<!--{$key2}-->"
              value="<!--{$arrForm[$key2].value|escape}-->"
              maxlength="<!--{$arrForm[$key2].length}-->"
              style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" >
              <option value="">--</option>
              <!--{html_options options=$arrYear selected=$arrForm[$key2].value|escape}-->
            </select>　<span style="position:relative;top:10px;">年</span>
          </div>
        </td>
      </tr>
      <tr  class="new_card_info">
        <th>カード名義(ローマ字氏名)<span class="attention">※</span></th>
        <td>
          <!--{assign var=key1 value="card_holder_name1"}-->
          <!--{assign var=key2 value="card_holder_name2"}-->
          <span class="attention"><!--{$arrErr[$key1]}--></span>
          <span class="attention"><!--{$arrErr[$key2]}--></span>
          <p class="mini">
            名&nbsp;<input type="text"
                          name="<!--{$key1}-->"
                          value="<!--{$arrForm[$key1].value|escape}-->"
                          maxlength="<!--{$arrForm[$key1].length}-->"
                          style="<!--{$arrErr[$key1]|sfGetErrorColor}-->"
                          size="20"
                          class="box120">&nbsp;&nbsp;
             姓&nbsp;<input type="text"
                          name="<!--{$key2}-->"
                          value="<!--{$arrForm[$key2].value|escape}-->"
                          maxlength="<!--{$arrForm[$key2].length}-->"
                          class="box120"
                          style="<!--{$arrErr[$key2]|sfGetErrorColor}-->"
                          size="20"><br />
            半角入力(例：TAROU&nbsp;YAMADA)
          </p>
        </td>
      </tr>
<!--{captcha_form_cc_shopping}-->
      </table>

      <!--{if $useable_register_card_info_flg && $arrSavedCardInfo}-->
      <br />
      <p style="margin-bottom:-10px">■登録済みのカード</p>
      <!--{if $arrErr.use_card_info_id}-->
      <div style="margin-top:10px">
      <span class="attention">※使用するクレジットカードを選択してください</span>
      </div>
      <!--{/if}-->
      <table>
      	<tr>
      		<th>使用カード</th>
      		<th>カード番号</th>
      		<th>有効期限</th>
      		<th>名義</th>
      		<th>カード会社</th>
      	</tr>
      	<!--{foreach from=$arrSavedCardInfo item=card key=idx}-->
      	<tr>
      		<!--{if $card.is_useable}-->
      		<td><input type="radio" name="use_card_info_id" value="<!--{$card.card_info_id}-->" /></td>
      		<!--{else}-->
      		<td><span class="attention">使用不可</span></td>
      		<!--{/if}-->
      		<td><!--{$card.card_number}--></td>
      		<td><!--{$card.expiration_month}-->月/<!--{$card.expiration_year}-->年</td>
      		<td><!--{$card.cardholder_name}--></td>
      		<td><!--{$card.company_name}--></td>
      	</tr>
      	<!--{foreachelse}-->
      	<tr>
      		<td colspan="6">登録済みのカード情報はありません。</td>
      	</tr>
      	<!--{/foreach}-->
      </table>
      <!--{/if}-->

      <table summary="支払区分">
      	<!--{assign var=key1 value="card_save_flg"}-->
      	<!--{if $useable_register_card_info_flg && $tpl_customer_id}-->
      	<tr>
      		<th>カード登録<span class="attention">※</span></th>
      		<td>
      		<input <!--{if $arrForm[$key1].value == 1 || !$arrForm[$key1].value}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="1" id="<!--{$key1}-->_1" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->"  /><label for="<!--{$key1}-->_1" >する</label>
      		<!--{if $arrSavedCardInfo}-->
      		<input <!--{if $arrForm[$key1].value == 2}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="2" id="<!--{$key1}-->_2" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->"  /><label for="<!--{$key1}-->_2" >しない</label><br />
      		<!--{/if}-->
      		<br />
      		<span class="attention">※カードが一枚も登録されていない場合、または「カード情報を入力する」が選択されている場合には強制的にカード登録処理が実行されます。
      		登録可能なカード枚数は2枚までです。<br />
      		また「使用不可」と表示されているカードは有効性チェックNGとなったカードです。
      		</span>
      		</td>
      	</tr>
      	<!--{else}-->
      	<input type="hidden" name="<!--{$key1}-->" value="2" />
      	<!--{/if}-->
      </table>

      <table>
        <tr>
          <td class="lefttd">以上の内容で間違いなければ、下記「注文を確定する」ボタンをクリックしてください。<br />
          <span class="attention">※&nbsp;画面が切り替るまで少々時間がかかる場合がございますが、そのままお待ちください。</span></td>
        </tr>
      </table>

      <!--Start Button Page Movie-->
      <ul class="btn_area_n2">
        <li class="btn2">
          <span class="btn_prev">
            <a href="javascript:void(0);" onclick="fnModeSubmit('return','',''); return false;">前のページへ戻る<input type="hidden" name="back03" id="back03" /></a>
          </span>
        </li>
        <li class="btn">
          <span class="btn_next">
            <a href="javascript:void(0);" onclick="paygent_token_send();return false;">注文を確定する<input type="hidden" name="last" id="last"/></a>
          </span>
        </li>
      </ul>
      <!--End Button Page Movie-->

    </form>
</div>
<!--▲CONTENTS-->

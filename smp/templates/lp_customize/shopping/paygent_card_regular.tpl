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
var sm = null;
var complete_flg = false;
function fnCheckSubmit(mode) {
	sm.append();
	complete_flg = true;
	if(send) {
	    $('input[name="card_save_flg"]').attr('disabled' , false);
	    send = false;
	    fnModeSubmit(mode, '', '');
	    return true;
	} else {
	    alert("只今、処理中です。しばらくお待ち下さい。");
	    return false;
	}
}

$(document).ready(function() {
	<!--{assign var=key value="use_card_type"}-->
	<!--{if $arrForm[$key].value == 2}-->
	_disableCardInfo();
	<!--{else}-->
	_activateCardInfo();
	<!--{/if}-->

	$('input[name="use_card_type"]').bind('click' , function() {
		if ($(this).attr('checked') == "checked" ||
				$(this).attr('checked') == true) {
					if ($(this).val() == 1) {
						_activateCardInfo();
					}
					else {
						_disableCardInfo();
					}
				}
	});

	sm = new ScreenMask($);
	$('#back03').bind('click' , function(e) {
		 e.preventDefault();
		 fnModeSubmit('return','','');
	});

	$('#last').bind('click' , function(e) {
		e.preventDefault();
	    paygent_token_send();
	});
});

function _disableCardInfo()
{
	$('.new_card_info').hide();
	$('#card_save_flg_2').show();
	$('label[for="card_save_flg_2"]').show();
	$('input[name="card_save_flg"]').each(function() {
		if ($(this).val() == 2)  {
			$(this).attr('checked' , 'checked');
		}
		$(this).attr('disabled' , true);
	});
	$('input[name="use_card_info_id"]').attr('disabled' , false);
}

function _activateCardInfo()
{
	$('.new_card_info').show();
	$('input[name="card_save_flg"]').attr('disabled' , false);
	$('#card_save_flg_1').attr('checked' , 'checked');
	$('#card_save_flg_2').hide();
	$('label[for="card_save_flg_2"]').hide();
	$('input[name="use_card_info_id"]').attr('disabled' , true);
}
//]]>
</script>
<!--▼CONTENTS-->
<div id="shoppingcolumn">
	<div class="shopping_inner">
		<!--{$add_html}-->

		<h2>
		お支払い方法：<!--{$tpl_payment_method}-->
		</h2>

		<!--{if $arrErr.paygent_err}-->
    <table>
      <tr>
        <td class="lefttd">
          <p class="attention">エラーが発生しました：<br><!--{$arrErr.paygent_err|escape}--></p>
        </td>
      </tr>
    </table>
    <!--{/if}-->

		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
		<input type="hidden" id="mode" name="mode" value="register" />
		<input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />

		<!--{assign var=key1 value="use_card_type"}-->
	    <!--{if $useable_register_card_info_flg && $tpl_saved_card_info_activity}-->
	    <table >
	    	<tr>
	    		<td>
	    		<input <!--{if $arrForm[$key1].value == 1  || !$arrForm[$key1].value}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="1" id="<!--{$key1}-->_1" /><label for="<!--{$key1}-->_1" >カード情報を入力する</label>
	    		<input <!--{if $arrForm[$key1].value == 2}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="2" id="<!--{$key1}-->_2" /><label for="<!--{$key1}-->_2" >登録済みカードを使用する</label>
	    		</td>
	    	</tr>
	    </table>
	    <!--{else}-->
	    <input type="hidden" name="<!--{$key1}-->" value="1" />
	    <!--{/if}-->

		<table summary="決済情報の入力">
      	<tr class="new_card_info">
        	<th>カード番号<span class="attention">※</span></th>
        </tr>
        <tr class="new_card_info">
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
                 style="<!--{$arrErr[$key1]|sfGetErrorColor}-->"
                 onkeyup="next(this, this.form.<!--{$key2}-->)"
                 size="6"
                 inputmode="numeric" />-
          <input type="text"
                 name="<!--{$key2}-->"
                 value="<!--{$arrForm[$key2].value|escape}-->"
                 maxlength="<!--{$arrForm[$key2].length}-->"
                 class="box60"
                 style="<!--{$arrErr[$key2]|sfGetErrorColor}-->"
                 size="6"
                 inputmode="numeric"
                 onkeyup="next(this, this.form.<!--{$key3}-->)" />-
          <input type="text"
                 name="<!--{$key3}-->"
                 value="<!--{$arrForm[$key3].value|escape}-->"
                 maxlength="<!--{$arrForm[$key3].length}-->"
                 class="box60"
                 style="<!--{$arrErr[$key3]|sfGetErrorColor}-->"
                 size="6"
                 inputmode="numeric"
                 onkeyup="next(this, this.form.<!--{$key4}-->)" />-
          <input type="text"
                 name="<!--{$key4}-->"
                 value="<!--{$arrForm[$key4].value|escape}-->"
                 maxlength="<!--{$arrForm[$key4].length}-->"
                 class="box60"
                 style="<!--{$arrErr[$key4]|sfGetErrorColor}-->"
                 size="6"
                 inputmode="numeric" />
          <p class="mini">半角入力(例：1234-5678-9012-3456)</p>
        </td>
      </tr>
      <tr  class="new_card_info">
        <th>有効期限<span class="attention">※</span></th>
      </tr>
      <tr class="new_card_info">
        <td>
          <!--{assign var=key1 value="card_expiration_month"}-->
          <!--{assign var=key2 value="card_expiration_year"}-->
          <span class="attention"><!--{$arrErr[$key1]}--></span>
          <span class="attention"><!--{$arrErr[$key2]}--></span>
          <select name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" >
          <option value="">--</option>
          <!--{html_options options=$arrMonth selected=$arrForm[$key1].value|escape}-->
          </select>　月　/　
          <select name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" >
          <option value="">--</option>
          <!--{html_options options=$arrYear selected=$arrForm[$key2].value|escape}-->
          </select>　年
        </td>
      </tr>
      <tr  class="new_card_info">
        <th>カード名義(ローマ字氏名)<span class="attention">※</span></th>
      </tr>
      <tr class="new_card_info">
        <td>
          <!--{assign var=key1 value="card_holder_name1"}-->
          <!--{assign var=key2 value="card_holder_name2"}-->
          <span class="attention"><!--{$arrErr[$key1]}--></span>
          <span class="attention"><!--{$arrErr[$key2]}--></span>
            名&nbsp;<input type="text"
                          name="<!--{$key1}-->"
                          value="<!--{$arrForm[$key1].value|escape}-->"
                          maxlength="<!--{$arrForm[$key1].length}-->"
                          style="<!--{$arrErr[$key1]|sfGetErrorColor}-->"
                          class="box60">&nbsp;&nbsp;<br />
             姓&nbsp;<input type="text"
                          name="<!--{$key2}-->"
                          value="<!--{$arrForm[$key2].value|escape}-->"
                          maxlength="<!--{$arrForm[$key2].length}-->"
                          class="box60"
                          style="<!--{$arrErr[$key2]|sfGetErrorColor}-->"
                          >
            半角入力(例：TAROU&nbsp;YAMADA)
        </td>
<!--{captcha_form_cc_shopping}-->
      </tr>
      </table>

      <!--{if $useable_register_card_info_flg && $arrSavedCardInfo}-->
      <br />
      <!--{if $arrErr.use_card_info_id}-->
      <span class="attention">※使用するクレジットカードを選択してください</span>
      <br />
      <!--{/if}-->
      <table>
      	<tr>
      		<th>登録済みのカード情報</th>
      	</tr>
      	<!--{foreach from=$arrSavedCardInfo item=card key=idx}-->
      	<tr>
      		<td>
      		カード番号:<!--{$card.card_number}--><br />
      		有効期限:<!--{$card.expiration_month}-->月/<!--{$card.expiration_year}-->年<br />
      		名義名:<!--{$card.cardholder_name}--><br />
      		カード会社:<!--{$card.company_name}--><br />
      		<!--{if $card.is_useable}-->
      		<input type="radio" name="use_card_info_id" value="<!--{$card.card_info_id}-->" id="use_card_info_id_<!--{$idx}-->" /><label for="use_card_info_id_<!--{$idx}-->" >このカードを使用する</label>
      		<!--{else}-->
      		<span class="attention">このカードは使用できません。</span>
      		<!--{/if}-->
      		</td>
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
      	<!--{if $useable_register_card_info_flg}-->
      	<tr>
      		<th>カード登録<span class="attention">※</span></th>
      	</tr>
      	<tr>
      		<td>
      		<input <!--{if $arrForm[$key1].value == 1 || !$arrForm[$key1].value}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="1" id="<!--{$key1}-->_1" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->"  /><label for="<!--{$key1}-->_1" >する</label>
      		<!--{if $arrSavedCardInfo}-->
      		<input <!--{if $arrForm[$key1].value == 2}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="2" id="<!--{$key1}-->_2" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->"  /><label for="<!--{$key1}-->_2" >しない</label><br />
      		<!--{/if}-->
      		<span class="attention">※カードが一枚も登録されていない場合、または「カード情報を入力する」が選択されている場合には強制的にカード登録処理が実行されます。
      		また「このカードは使用できません」と表示されているカードは有効性チェックNGとなったカードです。</span>
      		</td>
      	</tr>
      	<!--{else}-->
      	<input type="hidden" name="<!--{$key1}-->" value="2" />
      	<!--{/if}-->
      </table>

				<div style="margin:10px 0 0 0">
					<table>
						<tr>
							<td class="lefttd">以上の内容で間違いなければ、下記「注文を確定する」ボタンをクリックしてください。<br />
							※画面が切り替るまで少々時間がかかる場合がございますが、そのままお待ちください。</td>
						</tr>
					</table>
				</div>

      <ul class="btn_area">
        <li class="prv_btn">
          <a href="javascript:void(0);" id="back03">前のページへ戻る</a>
        </li>
        <li class="nx_btn">
          <a href="javascript:void(0);" id="last">注文を確定する</a>
        </li>
      </ul>

		</form>
	</div>
</div>

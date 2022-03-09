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
		<h2 class="t_contact">お問い合わせ</h2>
	</div>

    
    <p>お問い合わせはメールにて承っています。<br />
		内容によっては回答をさしあげるのにお時間をいただくこともございます。また、土日、祝祭日、年末年始、夏季期間は翌営業日以降の対応となりますのでご了承ください。<br/>
		<span><em>※ ご注文に関するお問い合わせには、必ず「ご注文番号」と「お名前」をご記入の上、メール下さいますようお願い致します。</em></span>
	</p>
    
    
  <form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
    <input type="hidden" name="mode" value="confirm" />
    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$transactionid|escape}-->" />

    <!--{$add_html|escape}-->
    <table summary="お問い合わせ">
      <tr>
        <th width="150">お名前</th>
        <th width="60"><span class="required">必須</span></th>
        <td>
          <span class="attention"><!--{$arrErr.name01}--><!--{$arrErr.name02}--></span>
          姓&nbsp;<input type="text"
                         class="box120 ctinpt"
                         name="name01"
                         value="<!--{$name01|default:$arrData.name01|escape}-->"
                         maxlength="<!--{$smarty.const.STEXT_LEN}-->"
                         style="<!--{$arrErr.name01|sfGetErrorColor}-->" 
                         placeholder="山田" />　
          名&nbsp;<input type="text" class="box120 ctinpt" name="name02"
                         value="<!--{$name02|default:$arrData.name02|escape}-->"
                         maxlength="<!--{$smarty.const.STEXT_LEN}-->"
                         style="<!--{$arrErr.name02|sfGetErrorColor}-->" 
                         placeholder="太郎" />
        </td>
      </tr>
      <tr>
        <th>お名前（フリガナ）</th>
        <th><span class="required">必須</span></th>
        <td>
          <span class="attention"><!--{$arrErr.kana01}--><!--{$arrErr.kana02}--></span>
          セイ&nbsp;<input type="text"
                           class="box120 ctinpt"
                           name="kana01"
                           value="<!--{$kana01|default:$arrData.kana01|escape}-->"
                           maxlength="<!--{$smarty.const.STEXT_LEN}-->"
                           style="<!--{$arrErr.kana01|sfGetErrorColor}-->" placeholder="ヤマダ" />　
          メイ&nbsp;<input type="text"
                           class="box120 ctinpt"
                           name="kana02"
                           value="<!--{$kana02|default:$arrData.kana02|escape}-->"
                           maxlength="<!--{$smarty.const.STEXT_LEN}-->"
                           style="<!--{$arrErr.kana02|sfGetErrorColor}-->"placeholder="タロウ" />
        </td>
      </tr>
      <tr>
        <th>郵便番号</th>
        <th><span class="any">任意</span></th>
        <td>
          <span class="attention"><!--{$arrErr.zip01}--><!--{$arrErr.zip02}--></span>
          <div class="yuubin">
            〒&nbsp;
            <input type="text"
                   name="zip01"
                   class="box60 ctinpt"
                   value="<!--{$zip01|default:$arrData.zip01|escape}-->"
                   maxlength="<!--{$smarty.const.ZIP01_LEN}-->"
                   style="<!--{$arrErr.zip01|sfGetErrorColor}-->" 
                   placeholder="123" />&nbsp;-&nbsp;
            <input type="text"
                   name="zip02"
                   class="box60 ctinpt"
                   value="<!--{$zip02|default:$arrData.zip02|escape}-->"
                   maxlength="<!--{$smarty.const.ZIP02_LEN}-->"
                   style="<!--{$arrErr.zip02|sfGetErrorColor}-->" 
                   placeholder="456" />
               <span class="zipimg">
                   <a href="javascript:fnCallAddress('<!--{$smarty.const.URL_INPUT_ZIP}-->', 'zip01', 'zip02', 'pref', 'addr01');">
                    <span class="zip_bt">住所自動入力</span>
                   </a>
               </span>
          </div>
        </td>
      </tr>
      <tr>
        <th>住所</th>
        <th><span class="any">任意</span></th>
        <td>
          <span class="attention"><!--{$arrErr.pref}--><!--{$arrErr.addr01}--><!--{$arrErr.addr02}--></span>
          <div class="custom-selectbox w30">
              <select name="pref" style="<!--{$arrErr.pref|sfGetErrorColor}-->">
              <option value="">都道府県を選択</option>
              <!--{html_options options=$arrPref selected=$pref|default:$arrData.pref|escape}-->
              </select>
          </div>
          <div class="mgt10">
            市区町村・町名<br />
            <input type="text"
                   class="box380 ctinpt"
                   name="addr01"
                   value="<!--{$addr01|default:$arrData.addr01|escape}-->"
                   style="<!--{$arrErr.addr01|sfGetErrorColor}-->"
                   placeholder="<!--{$smarty.const.SAMPLE_ADDRESS_1}-->" />
          </div>
          <div class="mgt10">
           番地・マンション名<br />
            <input type="text"
                   class="box380 ctinpt"
                   name="addr02"
                   value="<!--{$addr02|default:$arrData.addr02|escape}-->"
                   style="<!--{$arrErr.addr02|sfGetErrorColor}-->" 
                    placeholder="<!--{$smarty.const.SAMPLE_ADDRESS_2}-->"/>
          </div>
          <div class="mini"><em>住所は2つに分けてご記入いただけます。マンション名は必ず記入してください。</em></div>
        </td>
      </tr>
      <tr>
        <th>電話番号</th>
        <th><span class="any">任意</span></th>
        <td>
          <span class="attention"><!--{$arrErr.tel01}--><!--{$arrErr.tel02}--><!--{$arrErr.tel03}--></span>
          <input type="text" 
                 class="box60 ctinpt"
                 name="tel01"
                 value="<!--{$tel01|default:$arrData.tel01|escape}-->"
                 maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->"
                 style="<!--{$arrErr.tel01|sfGetErrorColor}-->" 
                 placeholder="090"/>&nbsp;-&nbsp;
          <input type="text" 
                 class="box60 ctinpt"
                 name="tel02"
                 value="<!--{$tel02|default:$arrData.tel02|escape}-->"
                 maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->"
                 style="<!--{$arrErr.tel02|sfGetErrorColor}-->" 
                 placeholder="1234"/>&nbsp;-&nbsp;
          <input type="text" 
                 class="box60 ctinpt"
                 name="tel03"
                 value="<!--{$tel03|default:$arrData.tel03|escape}-->"
                 maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->"
                 style="<!--{$arrErr.tel03|sfGetErrorColor}-->"
                 placeholder="5678" />
        </td>
      </tr>
      <tr>
        <th>メールアドレス</th>
        <th><span class="required">必須</span></th>
        <td>
         <span class="attention"><!--{$arrErr.email}--><!--{$arrErr.email02}--></span>
          <div><input type="text"
                 class="box380 ctinpt"
                 name="email"
                 value="<!--{$email|default:$arrData.email|escape}-->"
                 maxlength="<!--{$smarty.const.MTEXT_LEN}-->"
                 style="<!--{$arrErr.email|sfGetErrorColor}-->"
                 placeholder="sample@example.com" />
           </div>
          <!--{* ログインしていれば入力済みにする *}-->
          <!--{if $smarty.server.REQUEST_METHOD != 'POST' && $smarty.session.customer}-->
          <!--{assign var=email02 value=$arrData.email}-->
          <!--{/if}-->
          <div>
          <input type="text"
                 class="box380 ctinpt"
                 name="email02"
                 value="<!--{$email02|escape}-->"
                 maxlength="<!--{$smarty.const.MTEXT_LEN}-->"
                 style="<!--{$arrErr.email02|sfGetErrorColor}-->"
                 placeholder="sample@example.com" />
          </div>
          <div class="mini"><em>確認のため2度入力してください。</em></div>
        </td>
      </tr>

      <!--{if $contactRequired !== $contact_stting_do_not_use}-->
      <tr>
        <th>お問い合わせ種別</th>
        <th>
          <!--{if $contactRequired === $contact_stting_required}-->
            <span class="required">必須</span>
          <!--{else}-->
            <span class="any">任意</span></th>
          <!--{/if}-->
        <td>
          <span class="attention"><!--{$arrErr.contact_type}--></span><br />
          <select name="contact_type">
          <option value="">選択してください</option>
          <!--{foreach from=$arrContactTypes item=t_contact_type}-->
            <!--{if $t_contact_type}-->
              <option value="<!--{$t_contact_type|escape}-->" <!--{if $t_contact_type == $contact_type}-->selected="selected"<!--{/if}-->><!--{$t_contact_type|escape}--></option>
            <!--{/if}-->
          <!--{/foreach}-->
          </select>
        </td>
      </tr>
      <!--{/if}-->

      <tr>
        <th>お問い合わせ内容</span>
        <th><span class="required">必須</span></th>
        <td>
          <span class="attention"><!--{$arrErr.contents}--></span>
          <textarea name="contents"
                    class="area380 ctinpt"
                    cols="60"
                    rows="20"
                    style="<!--{$arrErr.contents|sfGetErrorColor}-->"><!--{$contents|escape}--></textarea>
          <br /><span class="mini">（全角<!--{$smarty.const.MLTEXT_LEN|escape}-->字以下）</span>
        </td>
      </tr>
    </table>
    
		<ul class="btn_area_l2">
			<li class="btn">
				<span class="btn_next"><a href="javascript.void();" onclick="document.form1.submit(); return false;">確認ページへ<input type="hidden" name="confirm" /></a></span>
			</li>
		</ul>
    </form>
</div>
<!--▲CONTENTS-->
<style type="text/css">
.ctinpt, select, textarea{background-color:#ddd;}
</style>

<script>
$(function(){
  $(".ctinpt, select, textarea").one("focus",function(){
     $(this).css("background","rgba(255,200,200,0.7)");
  }).blur(function(){ /*フォーカスが外れたとき*/
      if($(this).val()==""){ /*何も入力されていないなら*/
        $(this).css("background","#ddd").one("focus",function(){
               $(this).css("background","#ddd");
          });
       }
      else{
        $(this).css("background","#fff").one("focus",function(){
               $(this).css("background","#fff");
          }); 
      }
    });
});
</script>

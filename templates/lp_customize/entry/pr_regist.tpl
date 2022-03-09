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
		<!--{if 'basis-lp_only'|get_option_use_flg == true}-->
			<h2 class="t_entry">お届け先情報入力</h2>
		<!--{else}-->
			<h2 class="t_entry">会員登録</h2>
		<!--{/if}-->
    </div>
    <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
      <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
      <input type="hidden" name="mode" value="complete" />

      <table summary="会員登録フォーム">
        <tr>
          <th width="150">お名前</th>
          <th width="60"><span class="required">必須</span></th>
          <td>
            <span class="attention"><!--{$arrErr.name01}--><!--{$arrErr.name02}--></span>
            姓&nbsp;<input type="text" name="name01" value="<!--{$name01|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name01|sfGetErrorColor}-->; ime-mode: active;" class="box120 entrypt" />&nbsp;
            名&nbsp;<input type="text" name="name02" value="<!--{$name02|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name02|sfGetErrorColor}-->; ime-mode: active;" class="box120 entrypt" />
          </td>
        </tr>
        <tr>
          <th>お名前（フリガナ）</th>
          <th><span class="required">必須</span></th>
          <td>
            <span class="attention"><!--{$arrErr.kana01}--><!--{$arrErr.kana02}--></span>
            セイ&nbsp;<input type="text" name="kana01" class="box120 entrypt" value="<!--{$kana01|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana01|sfGetErrorColor}-->; ime-mode: active;" />&nbsp;
            メイ&nbsp;<input type="text" name="kana02" class="box120 entrypt" value="<!--{$kana02|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana02|sfGetErrorColor}-->; ime-mode: active;" />
          </td>
        </tr>
        <tr>
          <th>郵便番号</th>
          <th><span class="required">必須</span></th>
          <td>
            <!--{assign var=key1 value="zip01"}-->
            <!--{assign var=key2 value="zip02"}-->
            <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
            <div class="yuubin">〒&nbsp;<input type="text" name="zip01" value="<!--{if $zip01 == ""}--><!--{$arrOtherDeliv.zip01|escape}--><!--{else}--><!--{$zip01|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.ZIP01_LEN}-->" style="<!--{$arrErr.zip01|sfGetErrorColor}-->; ime-mode: disabled;" class="box60 entrypt" />&nbsp;-&nbsp;<input type="text" name="zip02" value="<!--{if $zip02 == ""}--><!--{$arrOtherDeliv.zip02|escape}--><!--{else}--><!--{$zip02|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.ZIP02_LEN}-->" style="<!--{$arrErr.zip02|sfGetErrorColor}-->; ime-mode: disabled;" class="box60 entrypt" />&nbsp;

            <span class="zipimg">
                    <a href="#" onclick="fnCallAddress('<!--{$smarty.const.URL_INPUT_ZIP}-->', 'zip01', 'zip02', 'pref', 'addr01'); return false;" target="_blank">
                         <span class="zip_bt">住所自動入力</span>
                    </a>
                </span>
            </div>
          </td>
        </tr>
        <tr>
          <th>住所</th>
          <th><span class="required">必須</span></th>
          <td><span class="attention"><!--{$arrErr.pref}--><!--{$arrErr.addr01}--><!--{$arrErr.addr02}--></span>
              <div class="custom-selectbox w30">
                  <select name="pref" style="<!--{$arrErr.pref|sfGetErrorColor}-->">
                    <option value="" selected="selected">都道府県を選択</option>
                    <!--{html_options options=$arrPref selected=$pref}-->
                  </select>
              </div>
             <div class="mgt10">
                 市区町村・町名<br />
                 <input type="text" name="addr01" class="box380 entrypt" value="<!--{$addr01|escape}-->" style="<!--{$arrErr.addr01|sfGetErrorColor}-->; ime-mode: active;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS_1}-->"/>
             </div>
            <div class="mgt10">
            	番地・マンション名<br />
                 <input type="text" name="addr02" value="<!--{$addr02|escape}-->" style="<!--{$arrErr.addr02|sfGetErrorColor}-->; ime-mode: active;" class="box380 entrypt" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS_2}-->"/>
             </div>

            <p class="mini"><em>住所は2つに分けてご記入いただけます。マンション名は必ず記入してください。</em></p>
          </td>
        </tr>
        <tr>
          <th>電話番号</th>
          <th><span class="required">必須</span></th>
          <td>
            <span class="attention"><!--{$arrErr.tel01}--><!--{$arrErr.tel02}--><!--{$arrErr.tel03}--></span>
            <input type="text" name="tel01" value="<!--{$tel01|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" class="box60 entrypt" style="<!--{$arrErr.tel01|sfGetErrorColor}-->; ime-mode: disabled;" />&nbsp;-&nbsp;<input type="text" name="tel02" value="<!--{$tel02|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel02|sfGetErrorColor}-->; ime-mode: disabled;" class="box60 entrypt" />&nbsp;-&nbsp;<input type="text" name="tel03" value="<!--{$tel03|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel03|sfGetErrorColor}-->; ime-mode: disabled;" class="box60 entrypt" />
          </td>
        </tr>
        <tr>
          <th>FAX</th>
          <th><span class="any">任意</span></th>
          <td><span class="attention"><!--{$arrErr.fax01}--><!--{$arrErr.fax02}--><!--{$arrErr.fax03}--></span>
            <input type="text" name="fax01" value="<!--{$fax01|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->"  style="<!--{$arrErr.fax01|sfGetErrorColor}-->; ime-mode: disabled;" class="box60 entrypt" />&nbsp;-&nbsp;<input type="text" name="fax02" value="<!--{$fax02|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.fax02|sfGetErrorColor}-->; ime-mode: disabled;" class="box60 entrypt" />&nbsp;-&nbsp;<input type="text" name="fax03" value="<!--{$fax03|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.fax03|sfGetErrorColor}-->; ime-mode: disabled;" class="box60 entrypt" />
          </td>
        </tr>
        <tr>
          <th>メールアドレス</th>
          <th><span class="required">必須</span></th>
          <td>
            <span class="attention"><!--{$arrErr.email}--><!--{$arrErr.email02}--></span>
            <div><input type="text" name="email" class="box380 entrypt" value="<!--{$email|escape}-->" style="<!--{$arrErr.email|sfGetErrorColor}-->; ime-mode: disabled;" /></div>
            <div><input type="text" name="email02" class="box380 entrypt" value="<!--{$email02|escape}-->" style="<!--{$arrErr.email02|sfGetErrorColor}-->; ime-mode: disabled;" /></div>
            <p class="mini"><em>確認のため2度入力してください。</em></p>
          </td>
        </tr>
        <tr>
          <th>性別</th>
          <th><!--{if $req_setting.pc_sex == 'REQUIRED'}--><span class="required">必須</span><!--{else}--><span class="any">任意</span><!--{/if}--></th>
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
          <th><span class="any">任意</span></th>
          <td>
            <span class="attention"><!--{$arrErr.job}--></span>
            <div class="custom-selectbox w50">
                <select name="job" style="<!--{$arrErr.job|sfGetErrorColor}-->">
                  <option value="" selected="selected">選択してください</option>
                  <!--{html_options options=$arrJob selected=$job}-->
                </select>
            </div>
          </td>
        </tr>
        <tr>
          <th>生年月日</th>
          <th><!--{if $req_setting.pc_birth == 'REQUIRED'}--><span class="required">必須</span><!--{else}--><span class="any">任意</span><!--{/if}--></th>
          <td>
            <span class="attention"><!--{$arrErr.year}--><!--{$arrErr.month}--><!--{$arrErr.day}--></span>
            <div class="custom-selectbox w15">
                <select name="year" style="<!--{$arrErr.year|sfGetErrorColor}-->">
                  <!--{html_options options=$arrYear selected=$year}-->
                </select>
            </div>
            <span>年</span>
            <div class="custom-selectbox w10">
                <select name="month" style="<!--{$arrErr.year|sfGetErrorColor}-->">
                  <option value="">--</option>
                  <!--{html_options options=$arrMonth selected=$month}-->
                </select>
            </div>
            <span>月</span>
            <div class="custom-selectbox w10">
                <select name="day" style="<!--{$arrErr.year|sfGetErrorColor}-->">
                  <option value="">--</option>
                  <!--{html_options options=$arrDay selected=$day}-->
                </select>
            </div>
            <span>日</span>
          </td>
        </tr>
        <!--{if 'basis-lp_only'|get_option_use_flg == true}-->
        	<input type="hidden" name="password" value="<!--{$def_pas}-->"/>
        	<input type="hidden" name="password02" value="<!--{$def_pas}-->"/>
        <!--{else}-->
        <tr>
          <th>希望するパスワード<br />
            <span class="mini">パスワードは購入時に必要です</span></th>
             <th><span class="required">必須</span></th>
          <td>
            <span class="attention"><!--{$arrErr.password}--><!--{$arrErr.password02}--></span>
            <div><input type="password" name="password" value="<!--{$arrForm.password|escape}-->" class="box120 entrypt" style="<!--{$arrErr.password|sfGetErrorColor}-->"/></div>
            <p class="mini attention"><!--{$password_rule.message|escape}--></p>
            <div><input type="password" name="password02" value="<!--{$arrForm.password02|escape}-->" class="box120 entrypt"  style="<!--{$arrErr.password02|sfGetErrorColor}-->"/></div>
            <p class="mini attention">確認のため2度入力してください。</p>
        </tr>
        <!--{/if}-->
        <!--{if $arrMailCompulsionView eq "ON"}-->
        	<input type="hidden" name="mailmaga_flg" id="html" value="1">
        <!--{else}-->
	        <tr>
	          <th>メールマガジンの送付</th>
	          <th><span class="required">必須</span></th>
              <td>
	            <span class="attention"><!--{$arrErr.mailmaga_flg}--></span>
	            <div>
	              <input type="radio" name="mailmaga_flg" id="html" value="1"
	                     style="<!--{$arrErr.mailmaga_flg|sfGetErrorColor}-->"
	              <!--{if $mailmaga_flg eq 1 || $mailmaga_flg eq ""}--> checked="checked"<!--{/if}--> /><label for="html">受け取る</label>
	            </div>
	            <div style="display:none;">
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
<!--{captcha_form_signup}-->
      </table>

      <ul class="btn_area_l2">
        <li class="btn">
          <!--{if 'basis-lp_only'|get_option_use_flg == true}-->
           <!--{assign var=kiyaku_text value='規約を見る'}-->
          <!--{else}-->
           <!--{assign var=kiyaku_text value='会員規約を見る'}-->
          <!--{/if}-->
          <span class="btn_next"><a href="javascript:void(0)" onclick="window.open('./kiyaku_popup.php','', 'width=600, height=740, menubar=no, toolbar=no, scrollbars=yes');" style="color:#F60;"><!--{$kiyaku_text}--></a></span>
        </li>
      </ul>
     <ul class="btn_area_n2">
        <li class="btn_rpst1e">
          <span class="btn_prev">
            <a href="<!--{$smarty.const.URL_DIR}-->">同意しない<input type="hidden" name="b_noagree" /></a>
         </li>
         <li class="btn_rpst2e">
			<span class="btn_next">
				<input type="submit" id="n_b_entrycomp" name="n_b_entrycomp" value="送信" onclick="if(!window.confirm('ご入力された内容で登録します。登録しても宜しいですか。')){return false;}fnModeSubmit('complete','','');">
			</span>
        </li>
     </ul>
    </form>
</div>
<!--▲CONTENTS-->

<style type="text/css">
.entrypt, select, textarea{background-color: #ddd;}
</style>

<script>
$(function(){
  $(".entrypt, select, textarea").one("focus",function(){
    if($(this).prop("type") != "select-one"){
     $(this).css("background","rgba(255,200,200,0.7)");
    }
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

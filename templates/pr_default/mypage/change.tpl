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
            <h3>基本会員情報の変更・確認</h3>
        </div>

        <p class="mgb20">下記項目にご入力ください。<br />
        入力後、一番下の「確認ページへ」ボタンをクリックしてください。</p>
        <!--{if $empty_str_exist}-->
        <p class="red">※ 住所が<!--{$smarty.const.EMPTY_STR|escape}-->の場合または、都道府県が未選択の場合購入ができません。</p>
        <!--{/if}-->

        <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="confirm" />
        <input type="hidden" name="customer_id" value="<!--{$arrForm.customer_id|escape}-->" />
        <div class="mg_change">
            <table summary="会員登録内容変更 ">
                <tr>
                    <th width="150px">お名前</th>
                    <th width="50px"><span class="required">必須</span></th>
                    <td>
                        姓&nbsp;<input type="text" name="name01" value="<!--{$arrForm.name01|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name01|sfGetErrorColor}-->; ime-mode: active;" size="15" class="box120" placeholder="山田"/>&nbsp;
                        名&nbsp;<input type="text" name="name02" value="<!--{$arrForm.name02|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name02|sfGetErrorColor}-->; ime-mode: active;" size="15" class="box120" placeholder="太郎"/>
                    <div class="attention"><!--{$arrErr.name01}--><!--{$arrErr.name02}--></div></td>
                </tr>
                <tr>
                    <th>お名前（フリガナ）</th>
                    <th width="50px"><span class="required">必須</span></th>
                    <td>
                        セイ&nbsp;<input type="text" name="kana01" value="<!--{$arrForm.kana01|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana01|sfGetErrorColor}-->; ime-mode: active;" size="15" class="box120" placeholder="ヤマダ"/>&nbsp;
                        メイ&nbsp;<input type="text" name="kana02" value="<!--{$arrForm.kana02|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana02|sfGetErrorColor}-->; ime-mode: active;" size="15" class="box120" placeholder="タロウ"/>
                        <div class="attention"><!--{$arrErr.kana01}--><!--{$arrErr.kana02}--></div>
                    </td>
                </tr>
                <tr>
                    <th>郵便番号</th>
                    <th width="50px"><span class="required">必須</span></th>
                    <td>
                        〒&nbsp;<input type="text" name="zip" value="<!--{$arrForm.zip|escape}-->" maxlength="<!--{$smarty.const.ZIP01_LEN+$smarty.const.ZIP02_LEN}-->" style="<!--{$arrErr.zip|sfGetErrorColor}-->; ime-mode: disabled;" size="14" class="box120" placeholder="1234567"/>&nbsp;
                        <span class="zipimg">
                            <a href="<!--{$smarty.const.URL_INPUT_ZIP}-->" onclick="fnCallAddress_ex('<!--{$smarty.const.URL_INPUT_ZIP}-->', 'zip', 'pref', 'addr01'); return false;" target="_blank">
                            <span class="zip_bt">住所自動入力</span></a>
                        </span>
                        <div class="attention"><!--{$arrErr.zip}--></div>
                    </td>
                </tr>
                <tr>
                    <th>住所</th>
                    <th width="50px"><span class="required">必須</span></th>
                    <td>
                        <div class="custom-selectbox w30">
                            <select name="pref" style="<!--{$arrErr.pref|sfGetErrorColor}-->">
                                <option value="" selected="selected">都道府県を選択</option>
                                <!--{html_options options=$arrPref selected=$arrForm.pref}-->
                            </select>
                        </div>
                        <div class="mgt10">
                            <!--{$smarty.const.SAMPLE_ADDRESS1}--><br />
                            <input type="text" name="addr01" value="<!--{$arrForm.addr01|escape}-->" size="60" class="box300" style="<!--{$arrErr.addr01|sfGetErrorColor}-->; ime-mode: active;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS1}-->"/>
                        </div>

                        <div class="mgt10">
                        <!--{$smarty.const.SAMPLE_ADDRESS2}--><br />
                        <input type="text" name="addr02" value="<!--{$arrForm.addr02|escape}-->" size="60" class="box300" style="<!--{$arrErr.addr02|sfGetErrorColor}-->; ime-mode: active;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS2}-->"/>
                        </div>
                        <span class="attention"><!--{$arrErr.pref}--><!--{$arrErr.addr01}--><!--{$arrErr.addr02}--></span>
                        <p class="mini mgt10"><em>住所は2つに分けてご記入いただけます。マンション名は必ず記入してください。</em></p>
                    </td>
                </tr>
                <tr>
                    <th>電話番号</th>
                    <th width="50px"><span class="required">必須</span></th>
                    <td>
                        <input type="text" name="tel" value="<!--{$arrForm.tel|escape}-->" maxlength="<!--{$smarty.const.TEL_LEN}-->" size="40" style="<!--{$arrErr.tel|sfGetErrorColor}-->; ime-mode: disabled;" class="box300" placeholder="09012345678"/>
                        <div class="attention"><!--{$arrErr.tel}--></div>
                    </td>
                </tr>
                <tr>
                    <th>FAX</th>
                    <th width="50px"><span class="any">任意</span></th>
                    <td>
                        <input type="text" name="fax" value="<!--{$arrForm.fax|escape}-->" maxlength="<!--{$smarty.const.TEL_LEN}-->" size="40" style="<!--{$arrErr.fax|sfGetErrorColor}-->; ime-mode: disabled;" class="box300" placeholder="0312345678"/>
                        <div class="attention"><!--{$arrErr.fax}--></div>
                    </td>
                </tr>
                <tr>
                    <th>メールアドレス</th>
                        <th width="50px"><span class="required">必須</span></th>
                        <td>
                            <input type="text" placeholder="sample@example.com" name="email" value="<!--{$arrForm.email|escape}-->" style="<!--{$arrErr.email|sfGetErrorColor}-->; ime-mode: disabled;" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" size="40" class="box300" /><div class="attention"><!--{$arrErr.email}--></div><br />
                            <input type="text" placeholder="sample@example.com" name="email02" value="<!--{if $arrForm.email02 == ""}--><!--{$arrForm.email|escape}--><!--{else}--><!--{$arrForm.email02|escape}--><!--{/if}-->" style="<!--{$arrErr.email02|sfGetErrorColor}-->; ime-mode: disabled;" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" size="40" class="box300" /><div class="attention"><!--{$arrErr.email02}--></div>
                            <p class="mini mgt10"><em>確認のため2度入力してください。</em></p>
                        </td>
                    </tr>
                <!--{* 携帯メールアドレス欄を設置したい場合はコメントアウトを外してください *}-->
                <!--{*
                <tr>
                    <th>携帯メールアドレス</th>
                    <th width="50px"><span class="any">任意</span></th>
                    <td>
                        <input type="text" placeholder="sample@example.com" name="email_mobile" value="<!--{$arrForm.email_mobile|escape}-->" style="<!--{$arrErr.email_mobile|sfGetErrorColor}-->; ime-mode: disabled;" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" size="40" class="box300" /><div class="attention"><!--{$arrErr.email_mobile}--></div><br />
                        <input type="text" placeholder="sample@example.com" name="email_mobile02" value="<!--{if $arrForm.email_mobile02 == ""}--><!--{$arrForm.email_mobile|escape}--><!--{else}--><!--{$arrForm.email_mobile02|escape}--><!--{/if}-->" style="<!--{$arrErr.email_mobile02|sfGetErrorColor}-->; ime-mode: disabled;" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" size="40" class="box300" /><div class="attention"><!--{$arrErr.email_mobile02}--></div>
                        <p class="mini mgt10"><em>確認のため2度入力してください。</em></p>
                    </td>
                </tr>
                *}-->
                <tr>
                    <th>職業</th>
                    <th width="50px"><span class="any">任意</span></th>
                <td>
                    <div class="custom-selectbox w50">
                        <select name="job">
                            <option value="" selected="selected">選択してください</option>
                            <!--{html_options options=$arrJob selected=$arrForm.job}-->
                        </select>
                    </div>
                    <div class="attention"><!--{$arrErr.job}--></div>
                </td>
            </tr>
                <tr>
                    <th>パスワード</th>
                    <th width="50px"><span class="required">必須</span></th>
                    <td>
                        <input type="password" name="password" value="<!--{$arrForm.password|escape}-->" maxlength="<!--{$password_rule.max_length|escape}-->" style="<!--{$arrErr.password|sfGetErrorColor}-->" size="15" class="box120" />
                        <div class="attention"><!--{$arrErr.password}--></div>
                        <p class="mini mgt10"><em><!--{$password_rule.message|escape}--><br />変更されない場合は未入力のままで結構です。</em></p>
                        <input type="password" name="password02" value="<!--{$arrForm.password02|escape}-->" maxlength="<!--{$password_rule.max_length|escape}-->" style="<!--{$arrErr.password02|sfGetErrorColor}-->" size="15" class="box120 mgt10" />
                        <div class="attention"><!--{$arrErr.password02}--></div>
                        <p class="mini mgt10"><em>確認のため2度入力してください。</em></p>
                    </td>
                </tr>
                <!--{if $arrMailCompulsionView eq "ON"}-->
                    <input type="hidden" name="mailmaga_flg" id="html" value="1">
                    <!--{else}-->
                    <tr>
                        <th>メールマガジン</th>
                        <th width="50px"><span class="required">必須</span></th>
                        <td>
                            <input type="radio" name="mailmaga_flg" value="1" id="html" style="<!--{$arrErr.mailmaga_flg|sfGetErrorColor}-->" <!--{if $arrForm.mailmaga_flg eq 1}--> checked="checked" <!--{/if}--> /><label for="html">受け取る</label><br />
                            <!--{* <input type="radio" name="mailmaga_flg" value="2" id="text" style="<!--{$arrErr.mailmaga_flg|sfGetErrorColor}-->" <!--{if $arrForm.mailmaga_flg eq 2}--> checked="checked" <!--{/if}--> /><label for="text">テキストメールを受け取る</label> *}-->
                            <input type="radio" name="mailmaga_flg" value="3" id="no" style="<!--{$arrErr.mailmaga_flg|sfGetErrorColor}-->" <!--{if $arrForm.mailmaga_flg eq 3}--> checked="checked" <!--{/if}--> /><label for="no">受け取らない</label>
                            <div class="attention"><!--{$arrErr.mailmaga_flg}--></div>
                        </td>
                    </tr>
                <!--{/if}-->
                <th>生年月日</th>
                    <th width="50px"></th>
                    <td>
                        <!--{if $arrForm.birth}-->
                            <!--{$arrForm.birth|date_format:"%Y年%m月%d日"|escape}-->
                        <!--{else}-->
                            <ul class="mypage-birthday">
                                <li>
                                    <select name="year" autocomplete="<!--{$arrForm.autocomplete.year|autocomplete|escape}-->">
                                        <!--{html_options options=$arrYear selected=$arrForm.year|default:'----'}-->
                                    </select>
                                    年
                                </li>
                                <li>
                                    <select name="month" autocomplete="<!--{$arrForm.autocomplete.month|autocomplete|escape}-->">
                                        <option value="">--</option>
                                        <!--{html_options options=$arrMonth selected=$arrForm.month}-->
                                    </select>
                                    月
                                </li>
                                <li>
                                    <select name="day" autocomplete="<!--{$arrForm.autocomplete.day|autocomplete|escape}-->">
                                        <option value="">--</option>
                                        <!--{html_options options=$arrDay selected=$arrForm.day}-->
                                    </select>
                                    日
                                </li>
                            </ul>
                            <div class="attention"><!--{$arrErr.year}--><!--{$arrErr.month}--><!--{$arrErr.day}--></div></td>
                        <!--{/if}-->
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div>
                            <div class="p_waku3">
                                <input type="checkbox" id="edit_regular_master_deliv_addr" name="edit_regular_master_deliv_addr" value="1">
                                <label for="edit_regular_master_deliv_addr">全ての定期注文のお届け先住所も変更する</label>
                            </div>
                        </div>

                    </td>
                </tr>
            </table>

            <ul class="btn_area_l2">
                <li class="btn">
                    <span class="btn_next"><a href="javascript:void(0);" onclick="document.form1.submit();">確認ページへ<input type="hidden" name="refusal" id="refusal" /></span>
                </li>
            </ul>
        </div>
        </form>
    </div>
</div>
<!--▲CONTENTS-->

<style type="text/css">
input, select, textarea{background-color: #ddd;}
</style>

<script>
$(function(){
  $("input, select, textarea").one("focus",function(){
    if($(this).prop("type") != "radio"){
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

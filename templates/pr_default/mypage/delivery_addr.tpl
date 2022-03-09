<!--{printXMLDeclaration}--><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<html xmlns="http://www.w3.org/1999/xhtml" lang="ja" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$smarty.const.CHAR_CODE}-->" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<link rel="stylesheet" href="<!--{$TPL_DIR}-->css/common.css?<!--{$smarty.const.FRONT_CSS_VERSION}-->" type="text/css" media="all" />
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/css.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/navi.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/win_op.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/site.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$smarty.const.URL_DIR}-->js/jquery-1.9.1.min.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<title><!--{$arrSiteInfo.shop_name}-->/<!--{$tpl_title|escape}--></title>
</head>

<body onload="preLoadImg('<!--{$TPL_DIR}-->'); <!--{$tpl_onload}-->">
<noscript>
  <p><em>JavaScriptを有効にしてご利用下さい.</em></p>
</noscript>

<a name="top" id="top"></a>

<!--▼CONTENTS-->
<div id="windowcolumn">
	<div id="windowarea">
		<div class="head">
			<h2 class="t_mypage">新しいお届け先の追加・変更</h2>
		</div>

		<div class="p_waku1">下記項目にご入力ください。<br />
		入力後、一番下の「登録する」ボタンをクリックしてください。</div>

		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$transactionid|escape}-->" />
			<input type="hidden" name="mode" value="edit" />
			<input type="hidden" name="other_deliv_id" value="<!--{$smarty.session.other_deliv_id|escape}-->" />
			<input type="hidden" name="ParentPage" value="<!--{$ParentPage|escape}-->" />

			<table summary="お届け先登録">
				<tr>
					<th width="100px">お名前</th>
					<td width="50px"><span class="required">必須</span></td>
                    <td>
						姓&nbsp;<input type="text" name="name01" placeholder="山田" value="<!--{if $name01 == ""}--><!--{$arrOtherDeliv.name01|escape}--><!--{else}--><!--{$name01|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name01|sfGetErrorColor}-->" size="15" class="box120" />&nbsp;
						名&nbsp;<input type="text" name="name02" placeholder="太郎"value="<!--{if $name02 == ""}--><!--{$arrOtherDeliv.name02|escape}--><!--{else}--><!--{$name02|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name02|sfGetErrorColor}-->" size="15" class="box120" />
                        <div class="attention"><!--{$arrErr.name01}--><!--{$arrErr.name02}--></div>
					</td>
				</tr>
				<tr>
					<th>お名前<br />（フリガナ）</th>
					<td><span class="required">必須</span></td>
                    <td>
						セイ&nbsp;<input type="text" placeholder="ヤマダ" name="kana01" value="<!--{if $kana01 == ""}--><!--{$arrOtherDeliv.kana01|escape}--><!--{else}--><!--{$kana01|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana01|sfGetErrorColor}-->" size="15" class="box120" />&nbsp;
						メイ&nbsp;<input type="text" placeholder="タロウ" name="kana02" value="<!--{if $kana02 == ""}--><!--{$arrOtherDeliv.kana02|escape}--><!--{else}--><!--{$kana02|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana02|sfGetErrorColor}-->" size="15" class="box120" />
                        <div class="attention"><!--{$arrErr.kana01}--><!--{$arrErr.kana02}--></div>
					</td>
				</tr>
				<tr>
					<th>郵便番号</th>
					<td><span class="required">必須</span></td>
                    <td>
						〒&nbsp;<input type="text" name="zip" value="<!--{if $zip == ""}--><!--{$arrOtherDeliv.zip|escape}--><!--{else}--><!--{$zip|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.ZIP01_LEN+$smarty.const.ZIP02_LEN}-->" style="<!--{$arrErr.zip|sfGetErrorColor}-->; ime-mode: disabled;" size="14" class="box120" placeholder="1234567" />&nbsp;
						<span class="zipimg">
							<a href="<!--{$smarty.const.URL_INPUT_ZIP}-->" onclick="fnCallAddress_ex('<!--{$smarty.const.URL_INPUT_ZIP}-->', 'zip', 'pref', 'addr01'); return false;" target="_blank">
                            	<span class="zip_bt">住所自動入力</span>
                            </a>
						</span>
                        <div class="attention"><!--{$arrErr.zip}--></div>
					</td>
				</tr>
				<tr>
					<th>住所</th>
					<td><span class="required">必須</span></td>
                    <td>
						<span class="attention"><!--{$arrErr.pref}--></span>
                          <div class="custom-selectbox w40">
                              <select name="pref" style="<!--{$arrErr.pref|sfGetErrorColor}-->">
                                  <option value="" selected="selected">選択してください</option>
                                  <!--{if $pref == ""}-->
                                      <!--{html_options options=$arrPref selected=$arrOtherDeliv.pref|escape}-->
                                  <!--{else}-->
                                      <!--{html_options options=$arrPref selected=$pref|escape}-->
                                  <!--{/if}-->
                              </select>
                          </div>

                            <div class="mgt10">
                                <!--{$smarty.const.SAMPLE_ADDRESS1}--><br />
                                <input type="text" name="addr01" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS1}-->" value="<!--{if $addr01 == ""}--><!--{$arrOtherDeliv.addr01|escape}--><!--{else}--><!--{$addr01|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" style="<!--{$arrErr.addr01|sfGetErrorColor}-->" size="40" class="box300" />
                            <div class="attention"><!--{$arrErr.addr01}--></div>
                            </div>


                            <div class="mgt10">
                                <!--{$smarty.const.SAMPLE_ADDRESS2}--><br />
                                <input type="text" name="addr02" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS2}-->" value="<!--{if $addr02 == ""}--><!--{$arrOtherDeliv.addr02|escape}--><!--{else}--><!--{$addr02|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" style="<!--{$arrErr.addr02|sfGetErrorColor}-->" size="40" class="box300" />
							<div class="attention"><!--{$arrErr.addr02}--></div>
                            </div>
						<div class="mini mgt10"><em>住所は2つに分けてご記入いただけます。マンション名は必ず記入してください。</em></div>
					</td>
				</tr>
				<tr>
					<th>電話番号</th>
                    <td><span class="required">必須</span></td>
					<td>
						<input type="text" name="tel" placeholder="09012345678" value="<!--{if $tel == ""}--><!--{$arrOtherDeliv.tel|escape}--><!--{else}--><!--{$tel|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.TEL_LEN}-->" style="<!--{$arrErr.tel|sfGetErrorColor}-->" size="40" class="box300" />
                        <div class="attention"><!--{$arrErr.tel}--></div>
					</td>
				</tr>
			</table>

			<ul class="btn_area_l2">
                <li class="btn">
                    <span class="btn_next"><a href="javascript:void(0);" onclick="document.form1.submit();">登録する<input type="hidden" name="register" id="register" /></a></span>
                </li>
			</ul>

		</form>
	</div>
</div>
</body>
</html>


<style type="text/css">
input, select, textarea{background-color: #ddd;}
</style>

<script>
$(function(){
  $("input, select, textarea").one("focus",function(){
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

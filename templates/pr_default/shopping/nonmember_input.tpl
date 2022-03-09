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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA02111-1307, USA.
 *}-->
<!--▼CONTENTS-->
<div id="shoppingcolumn">
	<!--{$add_html}-->
	<!--Start Flow Area-->
<!--
	<div class="flowarea">
         <img src="<!--{$TPL_DIR}-->img/shopping/flow01.png" style="margin:0 auto;" />
	</div>-->
	<!--End Flow Area-->
	<div class="head">
		<h2>お客様情報入力</h2>
	</div>
	<p>下記項目にご入力ください。<br />
	入力後、一番下の「確認ページへ」ボタンをクリックしてください。</p>
	<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
		<input type="hidden" name="mode" value="nonmember_confirm" />
		<input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
		<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
		<div class="nomenber_tb">	
            <table summary="お客様情報入力">
				<tr>
					<th width="150">お名前</th>
                    <th width="60"><span class="required">必須</span></th>
					<td>
						<!--{assign var=key1 value="order_name01"}-->
						<!--{assign var=key2 value="order_name02"}-->
						<span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
						姓&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="15" class="box120 nom_form" placeholder="山田"/>&nbsp;
						名&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" size="15" class="box120 nom_form" placeholder="太郎"/>
					</td>
				</tr>
				<tr>
					<th>お名前（フリガナ）</th>
					<th><span class="required">必須</span></th>
                    <td>
						<!--{assign var=key1 value="order_kana01"}-->
						<!--{assign var=key2 value="order_kana02"}-->
						<span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
						セイ&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="15" class="box120 nom_form" placeholder="ヤマダ"/>&nbsp;
						メイ&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" size="15" class="box120 nom_form" placeholder="タロウ"/>
					</td>
				</tr>
				<tr>
					<th>郵便番号</th>
					<th><span class="required">必須</span></th>
                    <td>
						<!--{assign var=key1 value="order_zip01"}-->
						<!--{assign var=key2 value="order_zip02"}-->
						<span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
						<div class="yuubin">
                            〒&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->"size="6" class="box60 nom_form" placeholder="123"/>&nbsp;-&nbsp;<input type="text"name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->"size="6" class="box60 nom_form" placeholder="4567"/>
                            <span class="zipimg">
                                <a href="<!--{$smarty.const.URL_DIR}-->address/index.php" onclick="fnCallAddress('<!--{$smarty.const.URL_INPUT_ZIP}-->', 'order_zip01', 'order_zip02', 'order_pref', 'order_addr01'); return false;" target="_blank">
                                    <span class="zip_bt">住所自動入力</span>
                                </a>
                            </span>
						</div>
					</td>
				</tr>
				<tr>
					<th>住所</th>
					<th><span class="required">必須</span></th>
                    <td>
						<!--{assign var=key value="order_pref"}-->
						<span class="attention"><!--{$arrErr.order_pref}--><!--{$arrErr.order_addr01}--><!--{$arrErr.order_addr02}--></span>
						<div class="custom-selectbox w30">
                            <select name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" class="nom_form">
                                <option value="">都道府県を選択</option>
                                <!--{html_options options=$arrPref selected=$arrForm[$key].value}-->
                            </select>
                        </div>
						<div class="mgt10">市区町村<br />
							<!--{assign var=key value="order_addr01"}-->
							<input type="text" name="<!--{$key}-->" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS1}-->" value="<!--{$arrForm[$key].value|escape}-->" size="40" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" class="box380 nom_form" /><br /></div>
						<div class="mgt10">町名・番地・マンション名<br />
							<!--{assign var=key value="order_addr02"}-->
							<input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|escape}-->" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS2}-->" size="40"maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" class="box380 nom_form" /><br /></div>
					</td>
				</tr>
				<tr>
					<th>電話番号</th>
					<th><span class="required">必須</span></th>
                    <td>
						<!--{assign var=key1 value="order_tel01"}-->
						<!--{assign var=key2 value="order_tel02"}-->
						<!--{assign var=key3 value="order_tel03"}-->
						<span class="attention"><!--{$arrErr[$key1]}--></span>
						<span class="attention"><!--{$arrErr[$key2]}--></span>
						<span class="attention"><!--{$arrErr[$key3]}--></span>
						<input type="text" name="<!--{$arrForm[$key1].keyname}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="6" class="box60 nom_form" placeholder="090"/> -
						<input type="text" name="<!--{$arrForm[$key2].keyname}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->"size="6" class="box60 nom_form" placeholder="1234"/> -
						<input type="text" name="<!--{$arrForm[$key3].keyname}-->" value="<!--{$arrForm[$key3].value|escape}-->" maxlength="<!--{$arrForm[$key3].length}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->" size="6" class="box60 nom_form" placeholder="5678"/>
					</td>
				</tr>
				<tr>
					<th>FAX</th>
					<th><span class="any">任意</span></th>
                    <td>
						<!--{assign var=key1 value="order_fax01"}-->
						<!--{assign var=key2 value="order_fax02"}-->
						<!--{assign var=key3 value="order_fax03"}-->
						<span class="attention"><!--{$arrErr[$key1]}--></span>
						<span class="attention"><!--{$arrErr[$key2]}--></span>
						<span class="attention"><!--{$arrErr[$key3]}--></span>
						<input type="text" name="<!--{$arrForm[$key1].keyname}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="6" class="box60 nom_form" placeholder="03"/> -
						<input type="text" name="<!--{$arrForm[$key2].keyname}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->"size="6" class="box60 nom_form" placeholder="1234"/> -
						<input type="text" name="<!--{$arrForm[$key3].keyname}-->" value="<!--{$arrForm[$key3].value|escape}-->" maxlength="<!--{$arrForm[$key3].length}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->" size="6" class="box60 nom_form" placeholder="5678"/>
					</td>
				</tr>
				<tr>
					<th>メールアドレス</th>
					<th><span class="required">必須</span></th>
                    <td>
						<!--{assign var=key value="order_email"}-->
						<span class="attention"><!--{$arrErr[$key]}--></span>
						<input type="text" name="<!--{$arrForm[$key].keyname}-->" value="<!--{$arrForm[$key].value|escape}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="40" class="box380 nom_form" placeholder="sample@example.com" /><br />
						<!--{assign var=key value="order_email_check"}-->
						<span class="attention"><!--{$arrErr[$key]}--></span>
						<input type="text" name="<!--{$arrForm[$key].keyname}-->" value="<!--{$arrForm[$key].value|escape}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="40" class="box380 nom_form" placeholder="sample@example.com" /><br />
						<p class="mini"><em>確認のため2度入力してください。</em></p>
					</td>
				</tr>
				<tr>
					<th>性別</th>
					
                    <th><!--{if $req_setting.pc_sex == 'REQUIRED'}--><span class="required">必須</span><!--{else}--><span class="any">任意</span><!--{/if}--></th>
                    <td>
						<!--{assign var=key value="order_sex"}-->
						<span class="attention"><!--{$arrErr[$key]}--></span>
						<!--{if $arrErr[$key]}-->
							<!--{assign var=err value="background-color: `$smarty.const.ERR_COLOR`"}-->
						<!--{/if}-->
						<!--{html_radios name="$key" options=$arrSex selected=$arrForm[$key].value style="$err" label_ids=true}-->
					</td>
				</tr>
				<tr>
					<th>職業</th>
					<th><span class="any">任意</span></th>
                    <td>
						<!--{assign var=key value="order_job"}-->
						<!--{if $arrErr[$key]}-->
							<!--{assign var=err value="background-color: `$smarty.const.ERR_COLOR`"}-->
						<!--{/if}-->
						<div class="custom-selectbox w50">
                            <select name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" class="nom_form">
                                <option value="">選択して下さい</option>
                                <!--{html_options options=$arrJob selected=$arrForm[$key].value}-->
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
                            <select name="year" style="<!--{$arrErr.year|sfGetErrorColor}-->" class="nom_form">
                                <!--{html_options options=$arrYear selected=$arrForm.year.value}-->
                            </select>
                        </div>
                        <span>年</span>
						<div class="custom-selectbox w10">
                            <select name="month" style="<!--{$arrErr.year|sfGetErrorColor}-->" class="nom_form">
                                <option value="">--</option>
                                <!--{html_options options=$arrMonth selected=$arrForm.month.value}-->
                            </select>
                        </div>
                        <span>月</span>
						<div class="custom-selectbox w10">
                            <select name="day" style="<!--{$arrErr.year|sfGetErrorColor}-->" class="nom_form">
                                <option value="">--</option>
                                <!--{html_options options=$arrDay selected=$arrForm.day.value}-->
                            </select>
                        </div>
                        <span>日</span>
					</td>
				</tr>
             </table>
           </div>
                
                <div class="deliv_sitei"> 
                	<div class="btn_nomenber"><!--{assign var=key value="deliv_check"}-->
						<input type="checkbox" name="<!--{$key}-->" value="1" onclick="fnCheckInputDeliv();" <!--{$arrForm[$key].value|sfGetChecked:1}--> id="deliv_label" />
						<label for="deliv_label">別の配送先を指定する</label>
                    </div>
                    <p class="txt_center">※上記と同じご住所に送る場合は<b>不要</b>です。</p>
                
               <div id="diss" class="another_deliv" style="display:none;"> 
                <table>
                    <tr>
                        <th width="150">お名前</th>
                        <th width="60"><span class="required">必須</span></th>
                        <td>
                            <!--{assign var=key1 value="deliv_name01"}-->
                            <!--{assign var=key2 value="deliv_name02"}-->
                            <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
                            姓&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="15" class="box120" placeholder="山田"/>&nbsp;
                            名&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" size="15" class="box120" placeholder="太郎"/>
                        </td>
                    </tr>
                    <tr>
                        <th>お名前（フリガナ）</th>
                        <th><span class="required">必須</span></th>
                        <td>
                            <!--{assign var=key1 value="deliv_kana01"}-->
                            <!--{assign var=key2 value="deliv_kana02"}-->
                            <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
                            セイ&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="15" class="box120" placeholder="ヤマダ"/>&nbsp;
                            メイ&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" size="15" class="box120" placeholder="タロウ"/>
                        </td>
                    </tr>
                    <tr>
                        <th>郵便番号</th>
                        <th><span class="required">必須</span></th>
                        <td>
                            <!--{assign var=key1 value="deliv_zip01"}-->
                            <!--{assign var=key2 value="deliv_zip02"}-->
                            <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
                            <div class="yuubin">
                                〒&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->"size="6" class="box60" placeholder="123"/>&nbsp;-&nbsp;<input type="text"name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->"size="6" class="box60" placeholder="4567"/>
                                 <span class="zipimg">
                                    <a href="<!--{$smarty.const.URL_DIR}-->address/index.php" onclick="fnCallAddress('<!--{$smarty.const.URL_INPUT_ZIP}-->', 'deliv_zip01', 'deliv_zip02', 'deliv_pref', 'deliv_addr01'); return false;" target="_blank">
                                        <span class="zip_bt">住所自動入力</span>
                                    </a>
                                </span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>住所</th>
                        <th><span class="required">必須</span></th>
                        <td>
                            <!--{assign var=key value="deliv_pref"}-->
                            <span class="attention"><!--{$arrErr.deliv_pref}--><!--{$arrErr.deliv_addr01}--><!--{$arrErr.deliv_addr02}--></span>
                            <div class="custom-selectbox w30">
                                <select name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
                                    <option value="">都道府県を選択</option>
                                    <!--{html_options options=$arrPref selected=$arrForm[$key].value}-->
                                </select>
                            </div>
                            <div class="mgt10">市区町村・町名<br>
                                <!--{assign var=key value="deliv_addr01"}-->
                                <input type="text" name="<!--{$key}-->" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS1}-->" value="<!--{$arrForm[$key].value|escape}-->" size="40" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" class="box380" /><br />
                            </div>
                            <div class="mgt10">番地・マンション名<br>
                                <!--{assign var=key value="deliv_addr02"}-->
                                <input type="text" name="<!--{$key}-->" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS2}-->" value="<!--{$arrForm[$key].value|escape}-->" size="40"maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" class="box380" /><br />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>電話番号</th>
                        <th><span class="required">必須</span></th>
                        <td>
                            <!--{assign var=key1 value="deliv_tel01"}-->
                            <!--{assign var=key2 value="deliv_tel02"}-->
                            <!--{assign var=key3 value="deliv_tel03"}-->
                            <span class="attention"><!--{$arrErr[$key1]}--></span>
                            <span class="attention"><!--{$arrErr[$key2]}--></span>
                            <span class="attention"><!--{$arrErr[$key3]}--></span>
                            <input type="text" name="<!--{$arrForm[$key1].keyname}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="6" class="box60" placeholder="090"/> -
                            <input type="text" name="<!--{$arrForm[$key2].keyname}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->"size="6" class="box60" placeholder="1234"/> -
                            <input type="text" name="<!--{$arrForm[$key3].keyname}-->" value="<!--{$arrForm[$key3].value|escape}-->" maxlength="<!--{$arrForm[$key3].length}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->" size="6" class="box60" placeholder="5678"/>
                        </td>
                    </tr>
				</table>
            </div>
        </div>

		<!--Start Button Page Movie-->
		<ul class="btn_area_l2">
			<li class="btn">
				<span class="btn_next">
					<a href="javascript:void(0);" onclick="document.form1.submit();">次のページへ<input type="hidden"name="next" id="next" /></a>
				</span>
			</li>
		</ul>
		<!--End Button Page Movie-->

	</form>
</div>
<!--▲CONTENTS-->


<style type="text/css">
.nom_form{background-color: #ddd;}
</style>

<script>
$(function(){
	$(".nom_form").one("focus",function(){
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

<script>
$('#deliv_label').click(function(){
    if($(this).prop('checked')){
        $('#diss').css("display", "");
    }
    else{
        $('#diss').css("display", "none");
    }
});
</script>
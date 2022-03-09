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

<!--3dcredit▼-->
#threed_secure_box{color:#000;margin:0 auto;padding:0;}
#threed_secure_box ul {list-style: none;margin: 20px auto 0 auto;padding: 0;width: 100%;overflow: hidden;}
#threed_secure_box ul li {float: left;}
.step_box {border: 3px solid #ddd;text-align: center;font-weight: 600;letter-spacing: 0.001rem;width: 290px;}
.step_box_text {padding: 10px;height: 70px;line-height: 2rem;}
.step_box_text span {font-size: 12px;padding: 0;margin: 0 auto;position: relative;bottom: 12px;}
.step_left{color:#767676;font-weight:600;}
.step_left span{color:#d14f47;}
#threed_secure_box dl{width:100%;list-style:none;}
#threed_secure_box dl p{color:#767676;font-weight:bold;font-size:14px;padding:10px 0 0 0 ;}
#threed_secure_box dl dd{border:3px solid #ddd;padding:10px;text-align:center;font-weight:600;letter-spacing:0.001rem;}
#threed_secure_box dl dt{width:100%;margin:0 auto;padding:0;font-weight:bold;color:#767676;font-size:16px;}
#threed_secure_box ul li img {margin: 5px;position: relative;top: 45px;}
#threed_secure_box dl dt span{color:#C00;}
#threed_secure_box .threed_subttl{background:#e9e9e9;font-weight:bold;margin:10px auto;padding:5px 10px;font-size:18px;letter-spacing:0.001rem;}
#threed_secure_box .secure_head{color: #fff;text-align: left;margin: 0 auto;padding: 15px;font-size: 20px;font-weight: 500;line-height: 1.6rem;letter-spacing: 0.001rem;background:#b91515 url("/img/3d_lockicon.png") no-repeat 2% 50%;word-break: break-all;}
#threed_secure_box .secure_head span{position:relative;left:45px;padding:0 5px;}
#threed_secure_box .threed_txt1 {margin:20px auto;padding: 0;color: #b91515;text-decoration: underline;text-align: left;font-weight: bold;font-size: 24px;line-height: 3rem;clear: both;}
#threed_secure_box .threed_txt2{background:#ffe933;padding:20px;text-aling:center;font-size:18px;letter-spacing:normal;}
#threed_secure_box .threed_contents{padding:20px 20px 0 20px;margin: 0 auto;}
#threed_secure_box .threed_contents .threed_ft1{font-weight:600;margin:10px 0 0 5px;font-size:20px;letter-spacing:-0.01rem;word-break: break-all;}
#threed_secure_box .threed_contents .threed_ft2{font-weight:600;font-size:20px;background:e9e9e9;padding:10px 5px 5px 5px;letter-spacing:-0.01rem;word-break: break-all;}
#threed_secure_box .threed_contents p {word-break: break-all;letter-spacing: 0.001rem;font-size: 18px;margin: 0 auto 10px auto;padding: 0 5px;line-height: 2rem;}
#threed_secure_box .thd_close {
    position: relative;
    top: 20px;
    left: 92%;
    background: #fff;
    width: 70px;
    text-align: center;
}

<!--accodion▼-->
.displayNone {display: none;}
.threed_accordion {margin: 0 auto;padding: 0;border: 1px solid #ccc;border-bottom-left-radius:5px;border-bottom-right-radius:5px;}
.contentWrap{margin:0;padding:0;height: 580px;}
.threed_switch {font-weight: bold;}
.threed_open {text-decoration: none;}
-->

</style>

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

function fnCheckSubmit(mode, key, val) {
    if (typeof fnCheckGmoTokenSubmit == "function" && key == "" && val == "") {
        fnCheckGmoTokenSubmit("register", "", "", "<!--{$reg_flg|escape}-->");
        return true;
    }
    if(send) {
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

<script type="text/javascript">
	(function($) {
    // 読み込んだら開始
    $(function() {

        // アコーディオン
        var accordion = $(".threed_accordion");
        accordion.each(function () {
            var noTargetAccordion = $(this).siblings(accordion);
            $(this).find(".threed_switch").click(function() {
                $(this).next(".contentWrap").slideToggle();
                $(this).toggleClass("threed_open");
                noTargetAccordion.find(".contentWrap").slideUp();
                noTargetAccordion.find(".threed_switch").removeClass("threed_open");
            });
            $(this).find(".close").click(function() {
                var targetContentWrap = $(this).parent(".contentWrap");
                $(targetContentWrap).slideToggle();
                $(targetContentWrap).prev(".threed_switch").toggleClass("threed_open");
            });
        });

    });
})(jQuery);

</script>

<!--▼CONTENTS-->
   <div id="shoppingcolumn">
     <div class="flowarea">
		<!--{if $reg_flg == 1 || $tpl_login != 1}-->
			<img src="<!--{$smarty.const.PR_TPL_DIR}-->img/shopping/flow04-1.png" style="margin:0 auto;">
		<!--{else}-->
			<img src="<!--{$TPL_DIR}-->img/shopping/m_step3-credit.png" style="margin:0 auto;" />
		<!--{/if}-->
	</div>

    <table summary="お支払い方法">
      <tr>
        <td class="lefttd">お支払い方法：<!--{$tpl_payment_method}--><br /></td>
      </tr>
    </table>

    <!--{if $arrErr.gmo_request}-->
    <table summary="お支払い方法">
      <tr>
        <td class="lefttd">
          <p class="attention">エラーが発生しました：<!--{$arrErr.gmo_request|escape}--></p>
        </td>
      </tr>
    </table>
    <!--{/if}-->

    <table summary="決済情報の入力">
    <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
    <input type="hidden" name="mode" value="register" />
    <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
    <input type="hidden" name="usecard" value="" />
    <input type="hidden" name="deleteCardSeq" value="" />
      <tr>
        <th>カード番号<span class="attention">※</span></th>
        <td>
          <!--{assign var=key1 value="card_no01"}-->
          <!--{assign var=key2 value="card_no02"}-->
          <!--{assign var=key3 value="card_no03"}-->
          <!--{assign var=key4 value="card_no04"}-->
          <span class="attention"><!--{$arrErr[$key1]}--></span>
          <span class="attention"><!--{$arrErr[$key2]}--></span>
          <span class="attention"><!--{$arrErr[$key3]}--></span>
          <span class="attention"><!--{$arrErr[$key4]}--></span>
          <input type="text"
                 name="<!--{$key1}-->"
                 value=""
                 maxlength="<!--{$arrForm[$key1].length}-->"
                 class="box60"
                 style="ime-mode: disabled; <!--{$arrErr[$key1]|sfGetErrorColor}-->"
                 onkeyup="next(this, this.form.<!--{$key2}-->)"
                 size="6" />&nbsp;-&nbsp;
          <input type="text"
                 name="<!--{$key2}-->"
                 value=""
                 maxlength="<!--{$arrForm[$key2].length}-->"
                 class="box60"
                 style="ime-mode: disabled; <!--{$arrErr[$key2]|sfGetErrorColor}-->"
                 size="6"
                 onkeyup="next(this, this.form.<!--{$key3}-->)" />&nbsp;-&nbsp;
          <input type="text"
                 name="<!--{$key3}-->"
                 value=""
                 maxlength="<!--{$arrForm[$key3].length}-->"
                 class="box60"
                 style="ime-mode: disabled; <!--{$arrErr[$key3]|sfGetErrorColor}-->"
                 size="6"
                 onkeyup="next(this, this.form.<!--{$key4}-->)" />&nbsp;-&nbsp;
          <input type="text"
                 name="<!--{$key4}-->"
                 value=""
                 maxlength="<!--{$arrForm[$key4].length}-->"
                 class="box60"
                 style="ime-mode: disabled; <!--{$arrErr[$key4]|sfGetErrorColor}-->"
                 size="6" />
          <p class="mini">半角入力(例：1234-5678-9012-3456)</p>
        </td>
      </tr>
      <tr>
        <th>有効期限<span class="attention">※</span></th>
        <td>
          <!--{assign var=key1 value="card_month"}-->
          <!--{assign var=key2 value="card_year"}-->
          <span class="attention"><!--{$arrErr[$key1]}--></span>
          <span class="attention"><!--{$arrErr[$key2]}--></span>
          <select name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->float:none;" >
          <option value="">--</option>
          <!--{html_options options=$arrMonth selected=$arrForm[$key1].value|escape}-->
          </select>　月　/　
          <select name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->float:none;" >
          <option value="">--</option>
          <!--{html_options options=$arrYear selected=$arrForm[$key2].value|escape}-->
          </select>　年
        </td>
      </tr>
      <tr>
        <th>カード名義(ローマ字氏名)<span class="attention">※</span></th>
        <td>
          <!--{assign var=key1 value="card_name01"}-->
          <!--{assign var=key2 value="card_name02"}-->
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
      <tr>
        <th>お支払い方法<span class="attention">※</span></th>
        <td>
          <!--{assign var=key value="paymethod"}-->
          <span class="attention"><!--{$arrErr[$key]}--></span>
          <select name="<!--{$key}-->" value="<!--{$arrForm[$key].value|escape}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" >
          <!--{html_options options=$arrPayMethod selected=$arrForm[$key].value|escape}-->
          </select>
        </td>
      </tr>
<!--{captcha_form_cc_shopping}-->
      <!--{if $enable_customer_regist}-->
      <!--{assign var=key value="register_card"}-->
      <!--{if $reg_flg != 1}-->
      <tr>
        <th>このカード情報を登録する</th>
        <td>
            <input type="checkbox"
                   name="<!--{$key}-->"
                   value="1"
                   class="button" <!--{if $arrForm[$key].value}--> checked=checked <!--{/if}-->/>　カード情報を登録する<br />
            <p class="mini">
            ※カード情報を登録すると、次回以降、下の「登録済みのカード情報を呼び出す」ボタンで<br />登録したカードを利用することができます。(最大5件まで登録できます)</p>

        </td>
      </tr>
	  <!--{/if}-->
      </table>
      <!--{/if}-->

      <!--▼3Dセキュア説明文▼-->
      <!--{if $tds_flg}-->
      <div id="threed_secure_box" class="threed_accordion">
        <p class="threed_switch threed_open secure_head"><span>この後、各カード会社の3Dセキュア(本人認証)画面に遷移します。</span></p>
        <div class="contentWrap">

        	<div class="threed_contents">
                <!--3Dセキュアとは?-->
                <div class="threed_ft1">3Dセキュアとは?</div>
                <p style="word-break: break-all;">
                    オンラインショッピングにおいて、クレジットカード決済時の第三者によるカードの不正利用（なりすまし）の最大限防止を目的とした、無料で登録できる「本人認証サービス」です。
                </p>
                <!--簡単・安心・安全なクレジットカード決済-->
                <div class="threed_ft2">簡単・安心・安全なクレジットカード決済</div>
                <p style="word-break: break-all;">事前にカード発行会社へ登録し、取得したパスワード（4桁の暗証番号以外のもの）を決済時に入力する事で、お客様のご本人確認を行うことにより、安心・安全なオンラインショッピングをお楽しみいただけます。
               </p>

               <!--利用方法-->
               <div class="threed_subttl">3Dセキュアご利用方法</div>
                   <ul>
                       <li>
                         <div class="step_left">Step<span>1</span></div>
                         <div class="step_box">
                              <div class="step_box_text">カード発行会社が3Dセキュア<br />に対応している</div>
                         </div>
                       </li>
                       <li><img src="/img/3d_rightarrow.png" width="24" height="40" longdesc="3d_rightarrow.png" /></li>
                       <li>
                         <div class="step_left">Step<span>2</span></div>
                         <div class="step_box">
                              <div class="step_box_text">カード発行会社へ必要情報を登録し<BR />パスワードを取得<br /><span>(4桁の暗証番号以外のもの）</span></div>
                         </div>
                        </li>
                        <li><img src="/img/3d_rightarrow.png" width="24" height="40" longdesc="3d_rightarrow.png" /></li>
                        <li>
                           <div class="step_left">Step<span>3</span></div>
                           <div class="step_box">
                            <div class="step_box_text">3Dセキュアに対応している<BR />オンラインショップでご利用可能</div>
                           </div>
                       </li>
                   </ul>
           		 <div class="threed_txt1">詳しくはお手持ちのカードの発行会社にお問い合わせください。</div>
                 <div class="threed_txt2">
                     ※パスワードはカード発行会社に直接送信され、弊社では取得できない仕組みになっているため、ハッキングなどによって情報漏洩が発生する心配がありません。
                 </div>
        	</div><!--threed_contents▲-->
            <p class="close thd_close">閉じる×</p>
        </div> <!--contentWrap▲-->
	  </div><!--threed_secure_box▲-->
      <!--{/if}-->

      <table>
        <tr>
          <td class="lefttd">以上の内容で間違いなければ、下記「注文を確定する」ボタンをクリックしてください。<br />
         <span class="attention">※画面が切り替るまで少々時間がかかる場合がございますが、そのままお待ちください。</span></td>
        </tr>
      </table>



      <ul class="btn_area_n2">
        <li class="btn2">
            <span class="btn_prev">
            	<a href="javascript:void(0);" onclick="fnModeSubmit('return','',''); return false;" >前のページへ戻る<input type="hidden" name="back03" id="back03" /></a>
			</span>
        </li>
        <li class="btn">
          <span class="btn_next">
            <a href="javascript::void();" onclick="fnCheckSubmit('register', '', '');return false;">注文を確定する<input type="hidden" name="last" id="last"/></a>
          </span>
        </li>
      </ul>

      <!--{if $enable_customer_regist}-->
      <table>
        <tr><td class="centertd" colspan="5">
            <input type="image"
                   onclick="fnModeSubmit('getcard','',''); return false;"
                   onmouseover="chgImgImageSubmit('<!--{$smarty.const.URL_DIR}--><!--{$smarty.const.USER_DIR}-->gmo_id_on.gif',this)"
                   onmouseout="chgImgImageSubmit('<!--{$smarty.const.URL_DIR}--><!--{$smarty.const.USER_DIR}-->gmo_id.gif',this)"
                   src="<!--{$smarty.const.URL_DIR}--><!--{$smarty.const.USER_DIR}-->gmo_id.gif">
            </td>
        </tr>
        <!--{if $cardNum}-->
        <tr>
            <td>選択<!--{if $arrErr.CardSeq}--><br /><span class="attention mini">使用するカードを選択して下さい</span><!--{/if}--></td>
            <td>カード番号</td>
            <td>有効期限</td>
            <td>名義人</td>
            <td>削除</td>
        </tr>
        <!--{foreach name=cardloop from=$arrCardInfo item=card}-->
        <!--{if $card.DeleteFlag == 0}-->
        <tr>
            <td><input type="radio" name="CardSeq" value="<!--{$card.CardSeq}-->"></td>
            <td><!--{$card.CardNo}--></td>
            <td><!--{$card.Expire|substr:2:4}-->月 / <!--{$card.Expire|substr:0:2}-->年</td>
            <td><!--{$card.HolderName}--></td><!--{* 名義人 *}-->
            <td><input type="button" onClick="return fnCheckSubmit('deletecard', 'deleteCardSeq', '<!--{$card.CardSeq}-->')" value="削除"></td>
        </tr>
        <!--{/if}-->
        <!--{/foreach}-->
        <!--{/if}-->
      </table>
      <!--{if $cardNum}-->
      <table>
      <tr>
        <th>お支払い方法<span class="attention">※</span></th>
        <td>
          <!--{assign var=key value="paymethod_usecard"}-->
          <span class="attention"><!--{$arrErr[$key]}--></span>
          <select name="<!--{$key}-->" value="<!--{$arrForm[$key].value|escape}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" >
          <!--{html_options options=$arrPayMethod selected=$arrForm[$key].value|escape}-->
          </select>
        </td>
      </tr>
      </table>

      <table>
        <tr>
          <td class="lefttd">以上の内容で間違いなければ、下記「注文を確定する」ボタンをクリックしてください。<br />
          <span class="attention">※画面が切り替るまで少々時間がかかる場合がございますが、そのままお待ちください。</span></td>
        </tr>
      </table>

      <ul class="btn_area_n2">
       <li class="btn2">
        	<span class="btn_prev">
                <a href="javascript:void(0);" onclick="fnModeSubmit('return','',''); return false;"> 前のページへ戻る<input type="hidden" name="back03" id="back03" /></a>
			</span>
        </li>
        <li class="btn">
        	<span class="btn_next">
              <a href="javascript::void();" onclick="fnCheckSubmit('register', 'usecard', '1');return false;"> 注文を確定する<input type="hidden" name="last" id="last"/></a>
			</span>
        </li>
      </ul>
      <!--{/if}-->
      <!--{/if}-->

    </form>
  </div>
<!--▲CONTENTS-->

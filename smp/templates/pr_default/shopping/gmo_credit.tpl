<style	>
input,select {
	padding:8px;
	font-size: 1.2em;
}

div#shoppingcolumn_shopping .box60 {
	width: 60px;
	padding: 2px;
	border: 1px solid #ccc;
}

div#shoppingcolumn_shopping .box120 {
	width: 120px;
	padding: 2px;
	border: 1px solid #ccc;
}

.displayNone {
    display: none;
}

.threed_accordion {
    margin: 0 auto 20px auto;
    padding: 0;
    border: 1px solid #ccc;
	border-bottom-left-radius:5px;
	border-bottom-right-radius:5px;
}

.threed_switch {
    font-weight: bold;
}

.threed_open{
    text-decoration: none;
}
</style>
<link href="/css/shopping.css" type="text/css" rel="stylesheet" />

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
	<div class="shopping_inner">
		<!--{$add_html}-->
		<h2>お支払い方法：<!--{$tpl_payment_method}--></h2>
		<!--{if $arrErr.gmo_request}-->
		<table summary="お支払い方法">
			<tr>
				<td class="lefttd">
					<p class="attention">エラーが発生しました：<!--{$arrErr.gmo_request|escape}--></p>
				</td>
			</tr>
		</table>

		<!--{/if}-->
		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="register" />
			<input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
			<input type="hidden" name="usecard" value="" />
			<input type="hidden" name="deleteCardSeq" value="" />
			<table summary="決済情報の入力">
				<tr>
					<th>カード番号<span class="attention">※</span></th>
				</tr>
				<tr>
					<td>
						<!--{assign var=key1 value="card_no01"}-->
						<!--{assign var=key2 value="card_no02"}-->
						<!--{assign var=key3 value="card_no03"}-->
						<!--{assign var=key4 value="card_no04"}-->
						<span class="attention"><!--{$arrErr[$key1]}--></span>
						<span class="attention"><!--{$arrErr[$key2]}--></span>
						<span class="attention"><!--{$arrErr[$key3]}--></span>
						<span class="attention"><!--{$arrErr[$key4]}--></span>
						<input class="inout_tx" type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="5" inputmode="numeric"/>&nbsp;-
						<input class="inout_tx" type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" size="5" inputmode="numeric"/>&nbsp;-
						<input class="inout_tx" type="text" name="<!--{$key3}-->" value="<!--{$arrForm[$key3].value|escape}-->" maxlength="<!--{$arrForm[$key3].length}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->" size="5" inputmode="numeric"/>&nbsp;-
						<input class="inout_tx" type="text" name="<!--{$key4}-->" value="<!--{$arrForm[$key4].value|escape}-->" maxlength="<!--{$arrForm[$key4].length}-->" style="<!--{$arrErr[$key4]|sfGetErrorColor}-->" size="5" inputmode="numeric"/>
						<p>半角入力(例：1234-5678-9012-3456)</p>
					</td>
				</tr>
				<tr>
					<th>有効期限<span class="attention">※</span></th>
				</tr>
				<tr>
					<td>
						<!--{assign var=key1 value="card_month"}-->
						<!--{assign var=key2 value="card_year"}-->
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
				<tr>
					<th>カード名義(ローマ字氏名)<span class="attention">※</span></th>
				</tr>
				<tr>
					<td>
						<!--{assign var=key1 value="card_name01"}-->
						<!--{assign var=key2 value="card_name02"}-->
						<span class="attention"><!--{$arrErr[$key1]}--></span>
						<span class="attention"><!--{$arrErr[$key2]}--></span>
						名&nbsp;<input class="inout_tx" type="text" autocorrect="off" autocapitalize="off" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="10">&nbsp;&nbsp;
						姓&nbsp;<input class="inout_tx" type="text" autocorrect="off" autocapitalize="off" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" size="10"><br />
						<p>半角入力(例：TAROU&nbsp;YAMADA)</p>
					</td>
				</tr>
				<tr>
					<th>お支払い方法<span class="attention">※</span></th>
				</tr>
				<tr>
					<td>
						<!--{assign var=key value="paymethod"}-->
						<span class="attention"><!--{$arrErr[$key]}--></span>
						<select name="<!--{$key}-->" value="<!--{$arrForm[$key].value|escape}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" >
						<!--{html_options options=$arrPayMethod selected=$arrForm[$key].value|escape}-->
						</select>
					</td>
				</tr>
<!--{captcha_form_cc_shopping}-->
			</table>
			<table>
				<!--{if $enable_customer_regist}-->
				<!--{assign var=key value="register_card"}-->
					<!--{if $reg_flg != 1}-->
					<tr>
						<th>このカード情報を登録する</th>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="<!--{$key}-->" value="1" class="button" <!--{if $arrForm[$key].value}--> checked=checked <!--{/if}-->/>　カード情報を登録する<br />
							<p class="mini">
							<span class="attention">※&nbsp;カード情報を登録すると、次回以降、下の「登録済みのカード情報を呼び出す」ボタンで<br />
							登録したカードを利用することができます。(最大5件まで登録できます)</span></p>
						</td>
					</tr>
					<!--{/if}-->
				<!--{/if}-->
			</table>
			<div style="margin:10px 0 0 0">
				<table>
					<tr>
						<td class="lefttd">以上の内容で間違いなければ、下記「注文を確定する」ボタンをクリックしてください。<br />
						<span class="attention">※&nbsp;画面が切り替るまで少々時間がかかる場合がございますが、そのままお待ちください。</span></td>
					</tr>
				</table>
			</div>
           <!--{if $tds_flg}-->
           <div class="threed_accordion">
            <div id="threed_secure_box">
            	<div class="threed_switch threed_open secure_head"><span>この後、各カード会社の3Dセキュア<Br />(本人認証)画面に遷移します。</span></div>

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
                       <dl>
                           <dt><div class="step1">Step<span>1</span></div></dt>
                           <dd>カード発行会社が3Dセキュア<br />に対応している</dd>

                           <dt><div class="step_left">Step<span>2</span></div><div class="step_right"><img src="/img/3d_downarrow.png"/></div></dt>
                           <dd>カード発行会社へ必要情報を登録しパスワードを取得(4桁の暗証番号以外のもの）</dd>

                           <dt><div class="step_left">Step<span>3</span></div><div class="step_right"><img src="/img/3d_downarrow.png"/></div></dt>
                           <dd>3Dセキュアに対応しているオンライン<br />ショップでご利用可能</dd>
                       </dl>
                       <div class="threed_txt1">詳しくはお手持ちのカードの発行会社に<br />お問い合わせください。</div>

                       <div class="threed_txt2">
                           ※パスワードはカード発行会社に直接送信され、弊社では取得できない仕組みになっているため、ハッキングなどによって情報漏洩が発生する心配がありません。
                       </div>
                    </div>
                    <p class="close thd_close">閉じる×</p>

                </div>
            </div>
           </div>
           <!--{/if}-->
			<ul class="btn_area">
				<li class="prv_btn">
					<a href="javascript:void(0);" onclick="fnModeSubmit('return','',''); return false;">前のページへ戻る<input type="hidden" name="back03" id="back03" /></a>
				</li>
				<li class="nx_btn">
					<a href="javascript:void(0);" onclick="fnCheckSubmit('register', '', '');return false;">注文を確定する<input type="hidden" name="last" id="last" border="0" /></a>
				</li>
			</ul>
				<!--{if $enable_customer_regist}-->
					<table>
						<tr>
							<td class="centertd" colspan="5">
								<input type="image" onclick="fnModeSubmit('getcard','',''); return false;" src="<!--{$smarty.const.URL_DIR}--><!--{$smarty.const.USER_DIR}-->gmo_id.gif">
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
						<!--{if $cardNum}-->
							<tr>
								<th>お支払い方法<span class="attention">※</span></th>
							</tr>
							<tr>
								<td>
									<!--{assign var=key value="paymethod_usecard"}-->
									<span class="attention"><!--{$arrErr[$key]}--></span>
									<select name="<!--{$key}-->" value="<!--{$arrForm[$key].value|escape}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" >
									<!--{html_options options=$arrPayMethod selected=$arrForm[$key].value|escape}-->
									</select>
								</td>
							</tr>
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
							<a href="javascript:void(0);" onclick="fnModeSubmit('return','',''); return false;">前のページへ戻る<input type="hidden" name="back03" id="back03" /></a>
						</li>
						<li class="nx_btn">
							<a href="javascript:void(0);" onclick="fnCheckSubmit('register', 'usecard', '1');return false;">注文を確定する<input type="hidden" name="last" id="last" /></a>
						</li>
					</ul>
			<!--{/if}-->
		</form>
	</div>

</div>


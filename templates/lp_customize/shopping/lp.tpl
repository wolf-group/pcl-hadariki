<!--{* updated_at 2014.12.15 *}-->
<!--{if $lp_content != false}--><!--{include file=$lp_content layout='lp_header'}--><!--{/if}-->
<!--{* ↑編集しないでください↑ *}-->

<!--▼CONTENTS-->
<div id="lpshoppingcolumn" class="p-lp">
    <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->" class="js-efo">
      <div class="products_dt">
        <table>
            <tr>
                <td>
                	<h3 class="no_bdr">商品</h3>
                    <div class="custom-select w98">
                      <select id="product_id" name="product_id">
                      <!--{* ↓編集しないでください↓ *}-->
                      <!--{if $lp_content != false}--><!--{include file=$lp_content layout='lp_product' select=$arrForm.product_id}--><!--{/if}-->
                      <!--{* ↑編集しないでください↑ *}-->
                      </select>
                    </div>
                </td>
                <!--{* 数量は適宜編集してください。*}-->
                <td style="display: none;">
                	<h3 class="no_bdr">数量</h3>
                	<div class="custom-select w100">
                      <select id="quantity" name="quantity">
                          <!--{assign var=key1 value="quantity"}-->
                          <option value="1" selected="selected">1</option>
                      </select>
                    </div>
                </td>
               </tr>
               <tr>
                 <td colspan="2" id="class_category" style="display:none;">
                    <!--{* 各規格 商品を選択すると、自動的に表示されます。 *}-->
                        <!--{* ↓このdiv内に規格用のセレクトボックスが表示されます↓ *}-->
                        <div class="lp-classcategory" id="class_category_select">
                        </div>
                        <!--{* ↑このdiv内に規格用のセレクトボックスが表示されます↑ *}-->
                  </td>
               </tr>
          </table>
		</div>
        <div class="mgt20" summary="ログインチェック" <!--{if $register == 2}-->style="display: none;"<!--{/if}-->>
          <!--<h1>過去に購入したことがある方</h1>-->
          <p class="register_btn"><input type="checkbox" name="register" id="register" value="1" <!--{if $register == 1}-->checked="checked"<!--{/if}-->/> <label for="register">入力を省略する<span class="annotation">&nbsp;(当サイトで購入したことがある方のみ)</span></label></p>
        </div>

        <div summary="既存会員" id="lp-login" <!--{if $register != 1}--> style="display:none;"<!--{/if}--> class="p-lp__already">
          <p class="p-lp__already-title">前回の購入時または会員登録時に入力したメールアドレスとパスワードを入力し、 ログインボタンをクリックしてください。</p>
          <div class="p-lp__already-section p-form p-form--horizontal">
            <div class="p-form-section">
              <div class="p-form-item">
                  <!--{assign var=key1 value="login_email"}-->
                  <input type="text" id="login_email" name="login_email" size="40" value="<!--{$arrForm[$key1]|escape}-->" placeholder="abc@example.com" class="w100 lpinput"/>
                  <p class="attention"><!--{$arrErr[$key1]}--></p>
              </div>
              <div class="p-form-item">
                <!--{assign var=key1 value="login_pass"}-->
                <input type="password" id="login_pass" name="login_pass" size="40" value="" placeholder="パスワード" class="w100 lpinput"/>
                <p class="attention"><!--{$arrErr[$key1]}--></p>
              </div>
            </div>
            <div class="p-form__submit">
              <button class="lp_button w80" onclick="fnModeSubmit('login', '', '');">ログイン</button>
              <p class="pdt20"><a href="/forgot/index.php"><img src="<!--{$TPL_DIR}-->img/common/arrow_right.png" width="19" height="19" alt="" align="top" />パスワードを忘れた方はこちら</a></p>
            </div>
            <!--{captcha_form_login}-->
          </div>
          <!--
          <!--{if 'basis-line_app'|get_option_use_flg}-->
          <div class="p-lp__already-section p-form">
            <div class="p-form-item p-form-item--center">
              <img src="/img/line/line_button081_m.png" alt="LINEでログイン" style="cursor: pointer;" />
            </div>
            <p class="p-lp__already-text">
              ※ 会員登録済みのお客様で、既にLINEと連携済みのお客様は『LINEでログイン』リンクからログインして下さい。<br>
              ※ LINEログインすることにより、LINEアカウントが友だち追加されてお知らせがLINEで受け取れます。
            </p>
          </div>
          <!--{/if}-->
          -->
        </div>
        <!--{if $loginerror}--><p class="attention"><!--{$loginerror}--></p><!--{/if}-->

        <!--{* こちらはAmazonPayV1(旧型)用です *}-->
        <!--{if $amazon_pay_v1_enabled}-->
        <div style="clear:both;"></div>
        <div id="amazon_button_area" style="width:836px;">
            <div style="float:left;padding-top:5px;">
                <p style="padding-bottom:3px"><span id="amazon_h">Amazonアカウントで決済できます</span></p>
                Amazon.co.jp に登録している情報を使って簡単にお支払いができるサービスです。<br />
                ※Amazonギフト券はご使用いただけません。
            </div>
            <div style="float:right"><!--{amazon_pay_button type="PwA" color="Gold" size="large" lp="1" parallel="yes"}--></div>
            <div style="clear:both;"></div>
        </div>
        <!--{/if}-->

        <!--{* こちらはAmazonPayV2用です  *}-->
        <!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable}-->
        <div style="clear:both;"></div>
        <div id="amazon_button_area_v2" style="width:836px; display:none;">
            <div style="float:left;padding-top:5px;" id="amazon_pay_v2_area">
                <p style="padding-bottom:3px"><span id="amazon_h">Amazonアカウントで決済できます</span></p>
                Amazon.co.jp に登録している情報を使って簡単にお支払いができるサービスです。<br />
                ※Amazonギフト券はご使用いただけません。
                <!--{if $return_back_from_amazon_pay_v2 === true}-->
                <br><br><span class="lp_red">現在アマゾンログイン中です。カードを変更し直す場合は再度ボタンのクリックをお願いします。</span>
                <!--{/if}-->
                <!--{if $is_amazon_pay_v2_tos_check_required}-->
                <br><br>
                <input type="checkbox" id="amazon_v2_agree" style="display:inline-block;">
                <span>
                    <label for="amazon_v2_agree">利用する場合は、<a href="javascript:void(0)" onclick="window.open('/entry/kiyaku_popup.php','', 'width=600, height=740, menubar=no, toolbar=no, scrollbars=yes');" style="color:#F60;">利用規約</a>に同意して会員登録する(必須)</label>
                </span>
                <!--{/if}-->
                <!--{if $register != 2}-->
                <br>
                <span>
                    <label for="amazon_v2_mailmaga_flg">
                        <input type="checkbox" name="amazon_v2_mailmaga_flg" id="amazon_v2_mailmaga_flg" value="1" style="display:inline-block;">&nbsp;お得な情報を受け取る
                    </label>
                </span>
                <!--{/if}-->
                <!--{if $precs_login_required_flg}-->
                <div class="red02">
                <br><br>
                    ※ 既に当サイトにて会員登録されております。<br>AmazonPay決済をご利用いただく場合は、ログインを行なった後、お手続きにお進みください。
                </div>
                <!--{/if}-->
            </div>
            <div id="amazon_pay_button_v2" style="float:right">
                <div id="amazon_pay_button_v2_click_area">
                    <!--{* ↓ AmazonPay V2 のダミーボタンです。適宜変更してください *}-->
                    <span id="amazon_dummy_btn">
                        <img src="/img/icons/amazon_v2.png">
                    </span>
                    <!--{* ↑ AmazonPay V2 のダミーボタンです。適宜変更してください *}-->
                    <!--{*下記のamazon_pay_button_v2において「popup_type='time' popup_time='30' lp='1'」とパラメータを追加することでLPの商品選択30秒後にポップアップが表示されます。*}-->
                    <span id="amazon_onetime_btn" style="display:none;"><!--{amazon_pay_button_v2 chargePermissionType='OneTime' button_id='AmazonPayButtonV2_OneTime' color='Gold'}--></span>
                    <span id="amazon_recurring_btn" style="display:none;"><!--{amazon_pay_button_v2 chargePermissionType='Recurring' button_id='AmazonPayButtonV2_Recurring' color='Gold'}--></span>
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>
        <!--{/if}-->

        <!--{if $register == 2}-->
        <div><h3 class="pdt20">お届け先</h3></div>
        <table summary="ログイン済みユーザー">
            <tr>
                <th width="183">お名前</th>
                <td colspan="2"><!--{$arrCustomer.order_name01}-->　<!--{$arrCustomer.order_name02}-->　(<!--{$arrCustomer.order_kana01}-->　<!--{$arrCustomer.order_kana02}-->)</td>
            </tr>
            <tr>
				<th>郵便番号</th>
				<td colspan="2">〒<!--{$arrCustomer.order_zip01}-->-<!--{$arrCustomer.order_zip02}--></td>
			</tr>
			<tr>
				<th>住所</th>
				<td colspan="2"><!--{$arrPref[$arrCustomer.order_pref]}--><!--{$arrCustomer.order_addr01}--><!--{$arrCustomer.order_addr02}--></td>
			</tr>
			<tr>
				<th>電話番号</th>
				<td colspan="2"><!--{$arrCustomer.order_tel01}-->-<!--{$arrCustomer.order_tel02}-->-<!--{$arrCustomer.order_tel03}--></td>
			</tr>
			<!--{if $arrOtherCustomer}-->
			<tr>
				<th width="200" colspan="2">別のお届け先を指定</th>
				<td>
					<div class="custom-select">
                      <select name="other_deliv_id" id="other_deliv_id">
                          <option value="">配送先を選択してください</option>
                          <!--{html_options options=$arrOtherCustomer selected=$arrForm.other_deliv_id}-->
                      </select>
                    </div>
				</td>
			</tr>
			<!--{/if}-->
		</table>
		<!--{/if}-->

		<!--{if $register != 2}-->
		<table summary="会員登録" class="doregister" id="lp-not-login">
            <tr>
               <td colspan="3" style="border-bottom-style:none;">
                <!--<h2>初めてのお客様は以下フォームよりご入力下さい。</h2>-->
                <h3>お客様情報</h3>
              </td>
            </tr>
            <tr>
                <th width="172" style="border-top-style:none;">お名前<span class="required">必須</span></th>
				<td>
					<!--{assign var=key1 value="order_name01"}-->
					<!--{assign var=key2 value="order_name02"}-->
					<span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
					姓&nbsp;<input type="text" name="<!--{$key1}-->" id="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" autocomplete="<!--{$arrForm.autocomplete[$key1]|autocomplete|escape}-->" size="15" placeholder="山田" class="w120 lpinput" />&nbsp;
					名&nbsp;<input type="text" name="<!--{$key2}-->" id="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" autocomplete="<!--{$arrForm.autocomplete[$key2]|autocomplete|escape}-->" size="15" placeholder="太郎" class="w120 lpinput" />
				</td>
			</tr>
			<tr>
				<th>フリガナ<span class="required">必須</span></th>
				<td>
					<!--{assign var=key1 value="order_kana01"}-->
					<!--{assign var=key2 value="order_kana02"}-->
					<span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
					セイ&nbsp;<input type="text" name="<!--{$key1}-->" id="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" size="15" placeholder="ヤマダ" class="w120 lpinput" />&nbsp;
					メイ&nbsp;<input type="text" name="<!--{$key2}-->" id="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" size="15" placeholder="タロウ" class="w120 lpinput" />
				</td>
			</tr>
			<tr>
				<th>郵便番号<span class="required">必須</span></th>
				<td>
					<span class="attention"><!--{$arrErr.order_zip}--></span>
					<div class="lp-zipcode">
                      <div class="fl30">〒&nbsp;<input type="text" name="order_zip" value="<!--{$arrForm.order_zip|escape}-->" autocomplete="<!--{$arrForm.autocomplete.order_zip|autocomplete|escape}-->" id="order_zip" placeholder="1300000" class="w80 lpinput"/></div><span class="nohyphen">※ハイフンなしで入力</span>
                      <!--<div class="fl40"><button class="zip_button w50" type="button" id="order_zip_button">住所自動入力</button></div>-->
                    </div>
                    <div style="clear:both"></div>
				</td>
			</tr>
			<tr>
				<th>住所</th>
				<td>
					<span class="attention"><!--{$arrErr.order_pref}--><!--{$arrErr.order_addr01}--><!--{$arrErr.order_addr02}--></span>
					<p class="mgt10">都道府県名<span class="required">必須</span></p>
                    <div class="custom-select w30">
                      <select name="order_pref" id="order_pref" autocomplete="<!--{$arrForm.autocomplete.order_pref|autocomplete|escape}-->">
                          <option value="">都道府県を選択</option>
                          <!--{html_options options=$arrPref selected=$arrForm.order_pref}-->
                      </select>
                    </div>
                    	<p class="mgt10">市区町村名<span class="required">必須</span></p>
						<p class="mini">
                            <!--{assign var=key value="order_addr01"}-->
                                <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key]|escape}-->" autocomplete="<!--{$arrForm.autocomplete[$key]|autocomplete|escape}-->" size="40" class="box380 lpinput" id="<!--{$key}-->" placeholder="市区町村名 (<!--{$smarty.const.SAMPLE_ADDRESS_1}-->)" />
						</p>
						<p class="mgt10">番地・マンション名<span class="required">必須</span></p>
						<p class="mini"><!--{assign var=key value="order_addr02"}-->
						<input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key]|escape}-->" autocomplete="<!--{$arrForm.autocomplete[$key]|autocomplete|escape}-->" size="40" class="box380 lpinput" id="<!--{$key}-->" placeholder="番地・マンション名 (<!--{$smarty.const.SAMPLE_ADDRESS_2}-->)" />
						</p>
                         <p class="lp_red">部屋番号が記入されているかをご確認ください。記入がないとお届けできないことがあります。</p>
				</td>
			</tr>
            <tr>
                <th>電話番号<span class="required">必須</span></th>
                <td>
                    <span class="attention"><!--{$arrErr.order_tel}--></span>
                    <input type="text" name="order_tel" value="<!--{$arrForm.order_tel|escape}-->" autocomplete="<!--{$arrForm.autocomplete.order_tel|autocomplete|escape}-->" class="box380 lpinput" placeholder="09011112222" /><span class="nohyphen" style="margin-left: 1.5em;">※ハイフンなしで入力</span>
                </td>
            </tr>
			<tr>
				<th>メールアドレス<span class="required">必須</span></th>
				<td>
					<!--{assign var=key value="order_email"}-->
					<span class="attention"><!--{$arrErr[$key]}--></span>
					<input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key]|escape}-->" autocomplete="<!--{$arrForm.autocomplete[$key]|autocomplete|escape}-->" id="<!--{$key}-->" size="40" class="box380 lpinput" placeholder="abc@example.com" /><br />
					<!--{assign var=key value="order_email_check"}-->
					<!--{if $arrPageLayout.confirm_email != 1}-->
                    <!--{* ↓上のメールアドレスを入力すると確認用欄に自動入力されます。自動入力を避けたい場合は id="order_email_check" を削除してください。 *}-->
					<span class="attention"><!--{$arrErr[$key]}--></span>
					<input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key]|escape}-->" autocomplete="<!--{$arrForm.autocomplete[$key]|autocomplete|escape}-->" id="order_email_check" size="40" class="box380 lpinput" /><br />
					<p class="mini"><em>確認のため2度入力してください。</em></p>
					<!--{/if}-->
					<div class="lp_red">携帯のアドレスを入力される方は、携帯のメール受信ドメインの設定を行なってください。
				<!--{* ▼指定受信の解除方法の案内を表示させる場合はコメントアウトを外してください
						<dl id="slidetoggle_menu">
							<dt>設定方法</dt>
							<dd>
							<a href="http://www.softbank.jp/mobile/support/iphone/antispam/email_i/white/">softbankの場合</a><br>
							<a href="http://www.au.kddi.com/support/mobile/trouble/forestalling/mail/anti-spam/fillter/function-11/">auの場合</a><br>
							<a href="https://www.nttdocomo.co.jp/info/spam_mail/measure/domain/">docomoの場合</a>
							</dd>
						</dl>
				▲指定受信の解除方法の案内ここまで *}-->
					</div>
				</td>
			</tr>
			<tr>
				<th>パスワード<span class="required">必須</span></th>
				<td>
				<span class="attention"><!--{$arrErr.password}--><!--{$arrErr.password02}--></span>
				<div><input type="password" name="password" value="<!--{$arrForm.password|escape}-->" autocomplete="<!--{$arrForm.autocomplete.password|autocomplete|escape}-->" id="password" class="box380 lpinput" placeholder="パスワード" /></div>
				<p class="lp_red">購入履歴の確認などに使用します。<!--{$password_rule.message|escape}--></p>
				<!--{if $arrPageLayout.confirm_password != 1}-->
				<br />
                <!--{* メールアドレス同様、確認欄に自動入力させたい場合は id="password02" を追記してください。 *}-->
				<div><input type="password" name="password02" value="<!--{$arrForm.password02|escape}-->" autocomplete="<!--{$arrForm.autocomplete.password02|autocomplete|escape}-->" class="box380 lpinput" /></div>
				<span class="attention">確認のため2度入力してください。</span>
				<!--{/if}-->
			</tr>

            <tr>
				<th>性別<!--{if $req_setting.pc_sex == 'REQUIRED'}--><span class="required">必須</span><!--{else}--><span class="any">任意</span><!--{/if}--></th>
				<td>
					 <!--{assign var=key value="order_sex"}-->
                        <div id="order_sex_group">
                           <input type="radio" name="order_sex" value="1" class="order_sex_radio" id="order_sex_male" <!--{if $arrForm.order_sex == 1}--> checked="checked"<!--{/if}-->　/><label for="order_sex_male" class="sex_male">男</label>
                            <input type="radio" name="order_sex" value="2" class="order_sex_radio" id="order_sex_female" <!--{if $arrForm.order_sex == 2}--> checked="checked"<!--{/if}-->　/><label for="order_sex_female" class="sex_female">女</label>
                        </div>
				</td>
			</tr>

			<tr>
				<th>生年月日<!--{if $req_setting.pc_birth == 'REQUIRED'}--><span class="required">必須</span><!--{else}--><span class="any">任意</span><!--{/if}--></th>
				<td>
					<span class="attention"><!--{$arrErr.year}--><!--{$arrErr.month}--><!--{$arrErr.day}--></span>
					<ul class="lp-birthday">
                    <li>
                       <div class="birth-select">
                        <select name="year" autocomplete="<!--{$arrForm.autocomplete.year|autocomplete|escape}-->">
                            <!--{html_options options=$arrYear selected=$arrForm.year}-->
                        </select>
                      </div>
                      年
                    </li>
					<li>
                      <div class="birth-select">
                        <select name="month" autocomplete="<!--{$arrForm.autocomplete.month|autocomplete|escape}-->">
                            <option value="">--</option>
                            <!--{html_options options=$arrMonth selected=$arrForm.month}-->
                        </select>
                      </div>
                      月
                    </li>
					<li>
                      <div class="birth-select">
                        <select name="day" autocomplete="<!--{$arrForm.autocomplete.day|autocomplete|escape}-->">
                            <option value="">--</option>
                            <!--{html_options options=$arrDay selected=$arrForm.day}-->
                        </select>
                      </div>
                      日
                    </li>
                    </ul>
				</td>
			</tr>
        </table>
            <!--{/if}-->

        <table summary="別のお届け先" class="doregister" id="deliv_check_area">
            <tr>
                <th colspan="3">
                    <div class="deliv_btn">
                        <input type="checkbox" name="deliv_check" value="1" id="deliv_check"<!--{if $deliv_check == 1}--> checked="checked"<!--{/if}--> />
                        <label for="deliv_check" style="font-weight: 100;">上記と別の住所へお届けする</label>
                    </div>
                    <p class="pdt10 ft_s">※同じ住所へお届けする場合はチェック不要です。</p>
                </th>
            </tr>
            <tr class="deliv_other"<!--{if $deliv_check != 1}--> style="display:none;"<!--{/if}-->>
                <th style="border-top-style:none;">お名前<span class="required">必須</span></th>
                <td>
                    <!--{assign var=key1 value="deliv_name01"}-->
                    <!--{assign var=key2 value="deliv_name02"}-->
                    <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
                    姓&nbsp;<input type="text" id="deliv_name01" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" autocomplete="<!--{$arrForm.autocomplete[$key1]|autocomplete|escape}-->" size="15" class="w120 lpinput" placeholder="山田" />&nbsp;
                    名&nbsp;<input type="text" id="deliv_name02" name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" autocomplete="<!--{$arrForm.autocomplete[$key2]|autocomplete|escape}-->" size="15" class="w120 lpinput" placeholder="太郎" />
                </td>
            </tr>
            <tr class="deliv_other"<!--{if $deliv_check != 1}--> style="display:none;"<!--{/if}-->>
                <th>フリガナ<span class="required">必須</span></th>
                <td>
                    <!--{assign var=key1 value="deliv_kana01"}-->
                    <!--{assign var=key2 value="deliv_kana02"}-->
                    <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
                    セイ&nbsp;<input type="text" id="deliv_kana01" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" size="15" class="w120 lpinput" placeholder="ヤマダ"/>&nbsp;
                    メイ&nbsp;<input type="text" id="deliv_kana02" name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" size="15" class="w120 lpinput" placeholder="タロウ"/>
                </td>
            </tr>
            <tr class="deliv_other"<!--{if $deliv_check != 1}--> style="display:none;"<!--{/if}-->>
                <th>郵便番号<span class="required">必須</span></th>
                <td>
                    <span class="attention"><!--{$arrErr.deliv_zip}--></span>
                    <div class="lp-zipcode">
                        <div class="fl30">〒&nbsp;<input type="text" name="deliv_zip" value="<!--{$arrForm.deliv_zip|escape}-->" autocomplete="<!--{$arrForm.autocomplete.deliv_zip|autocomplete|escape}-->" id="deliv_zip" placeholder="1300000" class="w80 lpinput"/></div><span class="nohyphen">※ハイフンなしで入力</span>
                        <!--<div class="fl40"><button class="zip_button w50" type="button" id="deliv_zip_button">住所自動入力</button></div>-->
                    </div>
                    <div style="clear:both"></div>
                </td>
            </tr>
            <tr class="deliv_other"<!--{if $deliv_check != 1}--> style="display:none;"<!--{/if}-->>
                <th>住所</th>
                <td>
                    <span class="attention"><!--{$arrErr.deliv_pref}--><!--{$arrErr.deliv_addr01}--><!--{$arrErr.deliv_addr02}--></span>
                    <p class="mgt10">都道府県名<span class="required">必須</span></p>
                    <div class="custom-select w30">
                        <select name="deliv_pref" id="deliv_pref" autocomplete="<!--{$arrForm.autocomplete.deliv_pref|autocomplete|escape}-->">
                            <option value="">都道府県を選択</option>
                            <!--{html_options options=$arrPref selected=$arrForm.deliv_pref}-->
                        </select>
                    </div>
                    <p class="mgt10">市区町村名<span class="required">必須</span></p>
                    <p class="mini">
                        <!--{assign var=key value="deliv_addr01"}-->
                        <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key]|escape}-->" autocomplete="<!--{$arrForm.autocomplete[$key]|autocomplete|escape}-->" size="40" class="box380 lpinput" id="<!--{$key}-->" placeholder="市区町村名 (<!--{$smarty.const.SAMPLE_ADDRESS_1}-->)" /><br />
                    </p>
                    <p class="mgt10">番地・マンション名<span class="required">必須</span></p>
                    <p class="mini">
                        <!--{assign var=key value="deliv_addr02"}-->
                        <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key]|escape}-->" autocomplete="<!--{$arrForm.autocomplete[$key]|autocomplete|escape}-->" size="40" class="box380 lpinput" id="<!--{$key}-->"  placeholder="番地・マンション名 (<!--{$smarty.const.SAMPLE_ADDRESS_2}-->)" />
                    </p>

                    <p class="lp_red">部屋番号まで記入されているかをご確認ください。記入がないと配達できないことがあります。</p>
                </td>
            </tr>
            <tr class="deliv_other"<!--{if $deliv_check != 1}--> style="display:none;"<!--{/if}-->>
                <th>電話番号<span class="required">必須</span></th>
                <td>
                    <span class="attention"><!--{$arrErr.deliv_tel}--></span>
                    <input type="text" name="deliv_tel" value="<!--{$arrForm.deliv_tel|escape}-->" autocomplete="<!--{$arrForm.autocomplete.deliv_tel|autocomplete|escape}-->" class="box380 lpinput" placeholder="09011112222"/><span class="nohyphen" style="margin-left: 1.5em;">※ハイフンなしで入力</span>
                </td>
            </tr>
        </table>

        <!--{* クーポンを使わせない場合はコメントアウトしてください *}-->
        <!--{if 'code_coupon'|get_option_use_flg == true && $view_coupon_form}-->
        <div id="coupon_area" style="display:none;">
        <div><h3 class="pdt20">クーポン</h3></div>
        <table summary="クーポン用" style="background:#f2fafe;margin:10px auto;">
            <tr>
                <th width="160" style="border-bottom:none;">クーポンコード</th>
                <td colspan="2" id="entry_coupon_td" style="border-bottom:none;">
                    <input type="text" name="coupon_code" value="" id="coupon_code" placeholder="クーポンを入力" class="lpinput"/>
                    <button type="button" id="check_coupon_code" class="cupon_btn">適用</button>
                    <img src="<!--{$TPL_DIR|escape}-->img/ajax/loading2.gif" width="24" style="display:none;" />
                    <span style="font-size:14px;">※クーポンコードを入力して適用ボタンを押して下さい</span>
                    <p id="coupon_code_error" style="color:red;line-height:1.5rem;"></p>

                </td>
                <td colspan="2" id="view_coupon_td" style="display:none;border-bottom:none;">
                    <span id="code_coupon_code"></span>
                    <button type="button" id="remove_coupon_code" class="cupon_btn">解除</button>
                    <img src="<!--{$TPL_DIR|escape}-->img/ajax/loading2.gif" width="24" style="display:none;" />
                </td>
            </tr>
            <tr id="coupon_discount_tr" style="display:none;">
                <th style="border-bottom:none;">値引金額</th>
                <td colspan="2" style="border-bottom:none;"><span id="discount"></span>円</td>
            </tr>
        </table>
        </div>
        <!--{/if}-->

        <!--{* お支払方法は、商品選択されると表示されます *}-->
        <div id="payment_area" class="p-lp__payment" style="display:none;">
            <!--{* ↓このspan内にお支払方法のラジオボタン群が表示されます↓ *}-->
            <span id="payment_methods"></span>
            <!--{* ↑このspan内にお支払方法のラジオボタン群が表示されます↑ *}-->
        </div>

        <!--{* 汎用決済用クレジットカードフォーム一括出力 *}-->
        <!--{get_token_payment_system_form_tag_card_info_area dump="true"}-->

        <!--{* 商品が選択された状態で、それが定期商品であれば、以下が自動的に表示されます。未選択や非定期商品選択時は消えます *}-->
        <div id="regular_product_area" style="border-bottom-style: none; padding-top: 10px; display: table-cell;<!--{if !$regular_product }--> display: none;<!--{/if}-->">
            <h2>
            <input type="checkbox" name="regular" value="1" id="regular"<!--{if ($regular_product && $reg_flg == 1) || ($regular_product && $no_regular == 0)}--> checked="checked" <!--{/if}-->/>
            </h2>
        </div>
        <!--{if $arrErr.product_id}--><p class="attention"><!--{$arrErr.product_id}--></p><!--{/if}-->
        <!--{if $arrErr.quantity}--><p class="attention"><!--{$arrErr.quantity}--></p><!--{/if}-->
        <!--{if $arrErr.time_sale_err}--><p class="attention"><!--{$arrErr.time_sale_err}--></p><!--{/if}-->
        <!--{if $arrErr.time_disp_err}--><p class="attention"><!--{$arrErr.time_disp_err}--></p><!--{/if}-->
		<!--{if $arrErr.product_err}--><p class="attention"><!--{$arrErr.product_err}--></p><!--{/if}-->

        <!--{* 上記の「定期購入を希望する」をチェックしてる場合のみ表示されます。それ以外は消えます *}-->
        <div class="delivery_calendar" id="regular-deliv_area" style="display:none;">
            <!--{* ↓定期配送間隔がこちらに表示されます↓ *}-->
            <span id="regular_cycle_area"></span>
            <!--{* ↑定期配送間隔がこちらに表示されます↑ *}-->
        </div>

        <!--{* ↓このdiv内にお届け時間関連が表示されます。デザイン変更はlp_ajax.tplを編集してください。↓ *}-->
        <div id="deliv_datetime_area"><div id="deliv_time_area"></div></div>
        <!--{* ↑このdiv内にお届け時間関連が表示されます。デザイン変更はlp_ajax.tplを編集してください。↑ *}-->

		<!--{* お問い合わせ欄を設置したい場合はコメントアウトを外してください *}-->
        <!--<div><h3 class="pdt20">その他お問い合わせ</h3></div>
		<table summary="お問い合わせ">
			<tr>
				<td>
					<!--{assign var=key value="message"}-->
					<span class="attention"><!--{$arrErr[$key]}--></span>
					<textarea name="<!--{$key}-->" cols="80" rows="8" placeholder="ご質問、ご要望などございましたらご自由にご入力ください。"><!--{$arrForm[$key]|escape}--></textarea>
					<p class="pdt5 attention">(<!--{$smarty.const.LTEXT_LEN}-->文字まで)</p>
				</td>
			</tr>
		</table>
        -->

        <!--{* ポイント使用欄は、ログイン済の状態で商品選択(規格ありの場合は規格も選択)されると表示されます *}-->
        <!--{if $register == 2 && $point_flg != 2}-->
        <div class="shopping_inner" id="point_area" style="display:none;">
            <h3 class="pdt20">ポイント使用の指定</h3>
            <p>
                <span class="attention">1ポイントを1円</span>として使用する事ができます。<br />
                使用する場合は、「ポイントを使用する」にチェックを入れた後、使用するポイントをご記入ください。
            </p>
            <div class="pointbox">
                <p class="left"><!--{$CustomerName1|escape}--> <!--{$CustomerName2|escape}-->様の、現在の所持ポイントは「<em><!--{$CustomerPoint|default:0}-->Pt</em>」です。</p>
                <p class="left">今回ご購入合計金額：<br /><span class="price" id="price"></span><span class="attention">（送料、手数料を含みません。）</span></p>
                <ul>
                    <li><em>使用可能ポイント: <!--{$tpl_available_point|default:0}-->Pt</em></li>
                    <li><input type="radio" id="point_on" name="point_check" value="1" <!--{$arrForm.point_check|sfGetChecked:1}--> onclick="fnCheckInputPoint();" /><label for="point_on">ポイントを使用する</label></li>
                    <!--{assign var=key value="use_point"}-->
                    <li class="underline">今回のお買い物で、<input class="input_tx lpinput" type="text" name="<!--{$key}-->" value="0" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="6" />&nbsp;ポイントを使用する。<span class="attention"><!--{$arrErr[$key]}--></span></li>
                    <li><input type="radio" id="point_off" name="point_check" value="2" <!--{$arrForm.point_check|sfGetChecked:2}--> onclick="fnCheckInputPoint();" /><label for="point_off">ポイントを使用しない</label></li>
                </ul>
            </div>
        </div>
        <!--{/if}-->

		<!--{* 個人情報のお取り扱いについて *}-->
        <div><h3 class="pdt20">個人情報のお取り扱いについて</h3></div>
        <table summary="利用規約">
            <!--{if $register != 2}--><!--{* 非ログイン時のみ表示されます *}-->
            <!--{if $arrMailCompulsionView eq "ON"}-->
            <input type="hidden" name="mailmaga_flg" value="1">
            <!--{else}-->
            <tr style="display: none;">
                <td>
                    <p class="ft_s04">
                      <input type="checkbox" name="mailmaga_flg" id="mailmaga_flg" value="1" <!--{if $arrForm.no_mailmaga_flg != 1}-->checked="checked" <!--{/if}-->/><label for="mailmaga_flg">お得な情報を受け取る</label>
                      <input type="hidden" name="no_mailmaga_flg" value="0" id="no_mailmaga_flg" />
                      <br /><span class="annotation">希望しない場合はチェックを外してください。</span>
                    </p>
                    <p class="attention"><!--{$arrErr.mailmaga_flg}--></p>
                </td>
            </tr>
            <!--{/if}-->
            <!--{/if}-->
            <tr>
                <td>
                    <p style="margin-bottom: 10px; display:none;" id="rule_text_area"><textarea class="kiyaku" readonly="readonly"><!--{$tpl_kiyaku_text}--></textarea></p>
                    <p class="ft_s04">
                      <span class="annotation">ご購入前に<a href="#" id="rule_text_link">利用規約</a>を必ずお読み下さい。</span><br />
                      <div style="display: none;">
                            <input type="checkbox" name="agree" value="1" id="agree" checked="checked"/><label for="agree">利用規約に同意する</label>
                        </div>
                    </p>
                    <p class="attention"><!--{$arrErr.agree}--></p>
                </td>
            </tr>
        </table>

        <img src="<!--{$TPL_DIR}-->img/common/lp_step.png" alt="LPのステップ" class="lp_submit_area" style="margin-left:auto; margin-right:auto;" />
        <ul class="lp_submit_area">
            <li class="lp-error lp-confirm" id="alert_errors" <!--{if !$arrErr}-->style="display:none;"<!--{/if}-->>
            <!--{if $arrErr}-->
                <!--{foreach from=$arrErr key=key item=item}-->
                    <!--{$item}--><br/>
                <!--{/foreach}-->
            <!--{/if}-->
            </li>
            <!-- li><a class="lp_button_submit" href="javascript:void(0);" id="confirm_submit" onclick="return false;">&nbsp;</a></li -->

            <li id="confirm_submit">
                <input type="button" id="confirm_submit_image" value="購入確認画面へ" onclick="return false;" style="outline:none;">
            </li>
        </ul>

        <!--{* ↓編集しないでください↓ *}-->
        <!--{foreach from=$arrHiddens key="key_h" item="val_h"}-->
        <input type="hidden" name="<!--{$key_h|escape}-->" value="<!--{$val_h.value|escape}-->" class="<!--{$val_h.class|escape}-->" id="<!--{$val_h.class|escape}--><!--{$key_h|escape}-->" />
        <!--{/foreach}-->
        <!--{foreach from=$arrErr key="key_e" item="val_e"}-->
        <input type="hidden" name="errors_<!--{$key_e}-->" value="<!--{$val_e}-->" class="errors" id="errors_<!--{$key_e}-->" />
        <!--{/foreach}-->
        <input type="hidden" name="ajax_url" value="<!--{$ajax_url}-->" id="ajax_url" />
        <!--{* ↑編集しないでください↑ *}-->
    </form>
</div>
<!--▲CONTENTS-->

<!--{* ↓編集しないでください↓ *}-->
<!--{if $lp_content != false}--><!--{include file=$lp_content layout='lp_footer'}--><!--{/if}-->
<script type="text/javascript" src="/js/lp.compress.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<!--{* ↑編集しないでください↑ *}-->
<link rel="stylesheet" href="<!--{$TPL_DIR}-->css/lp.css?<!--{$smarty.const.FRONT_CSS_VERSION}-->" type="text/css" media="all" />



<script type="text/javascript">
<!--{* スクロール関連ここから *}-->
$(window).load(function(){
<!--{if $login_success}--> <!--{* ログイン成功時 *}-->
    lp.adjustScroll(
       '#product_id', <!--{* 基準となる位置のidを指定してください *}-->
       -20,           <!--{* この数値は適宜修正してください *}-->
       true           <!--{* スクロールアニメーションが不要の場合は false にしてください。 *}-->
    );
<!--{elseif $loginerror}--> <!--{* ログイン失敗時 *}-->
    lp.adjustScroll(
       '#lp-login',   <!--{* 基準となる位置のidを指定してください *}-->
       -20,           <!--{* この数値は適宜修正してください *}-->
       true           <!--{* スクロールアニメーションが不要の場合は false にしてください。 *}-->
    );
<!--{elseif $return_from_confirm}--> <!--{* 確認画面からの戻り時 *}-->
    lp.adjustScroll(
       '#product_id', <!--{* 基準となる位置のidを指定してください *}-->
       -20,           <!--{* この数値は適宜修正してください *}-->
       true           <!--{* スクロールアニメーションが不要の場合は false にしてください。 *}-->
    );
<!--{else}--> <!--{* 上記以外 ファーストアクセスなど *}-->
<!--{* 上記を参考に適宜指定してください *}-->
<!--{/if}-->
});
<!--{* スクロール関連ここまで *}-->

$('#rule_text_link').click(function(){
   $('#rule_text_area').toggle();
});


$('#mailmaga_flg').click(function(){
    if($(this).prop('checked')){
        $('#no_mailmaga_flg').val(0);
    }
    else{
        $('#no_mailmaga_flg').val(1);
    }
});

function lpChangeCalendar() {
	var regular = $("input[name='regular']:checked").val();
	if(regular) {
		$('.delivery_calendar').show();
		$('.classcategory_extra').hide();
	} else {
		$('.delivery_calendar').hide();
		$('.classcategory_extra').show();
	}
}

$(function() {
	// 未入力フォーム背景指定
    /*
	$("#form1 :input").each(function() {
		if (!$(this).val()) {
			$(this).css("background", "rgb(255,255,255)");
		}
	});*/
	// エラーフォーム背景指定
	valid = new Array("dummy"<!--{foreach from=$arrErr key="key" item="item"}-->,"<!--{$key}-->"<!--{/foreach}-->);
	for (var i = 0; i < valid.length; i++) {
		$('*[name=' + valid[i] + ']').css("background", "rgb(255,160,160)");
	}
	// 入力フォーム背景指定
	$('.lpinput, select').focus(function(){ $(this).css("background", "") });
	$('.lpinput, select').blur(function(){ !$(this).val() ? $(this).css("background", "rgb(255,255,255)") : $(this).css("background", "") });

    $('a[href=#]').click(function(){
        return false;
    });
});

$(function(){
  $(".lpinput, select, textarea, option, .custom-select, #product_id").one("focus",function(){
     $(this).css("background","rgba(255,200,200,0.7)");
  }).blur(function(){ /*フォーカスが外れたとき*/
      if($(this).val()==""){ /*何も入力されていないなら*/
        $(this).css("background-color","#ddd").one("focus",function(){
               $(this).css("background","#ddd");
          });
       }
      else{
        $(this).css("background-color","#fff").one("focus",function(){
               $(this).css("background","#fff");
          });
      }
/*何か入力されているなら*/
    });

  // Ajaxで動的に生成される要素のフォーカス/アンフォーカス時色設定
  $('#payment_area, #deliv_time_area').on('focus', '.custom-select select, .payinput', function() {
    $(this).css("background","rgba(255,200,200,0.7)");
    $(this).on('blur', function() {
      if ($(this).val() == '') { /*何も入力されていないなら*/
        $(this).css('background-color', '#ddd');
      } else {
        $(this).css('background-color', '#fff');
      }
    });
  });
});

$(function(){	// トグル 携帯メールの指定受信解除の案内でしか使用していない
    $("#slidetoggle_menu dt").on("click", function() {
        $(this).next().slideToggle("fast");
        $(this).toggleClass("active");
    });
});


// autoKana.js
// Copyright (c) 2013 Keith Perhac @ DelfiNet (http://delfi-net.com)
//
// Based on the AutoRuby library created by:
// Copyright (c) 2005-2008 spinelz.org (http://script.spinelz.org/)
//
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
(function(e){e.fn.autoKana=function(t,n,r){function p(){f=true}function d(){f=false}function v(e){var t=e||window.event;if(e){var n=Event.element(e);if(n.checked){f=true}else{f=false}}else{f=!f}}function m(e){if(!c){if(Math.abs(values.length-e.length)>1){var t=e.join("").replace(o,"").split("");if(Math.abs(values.length-t.length)>1){L()}}else{if(values.length==h.length&&values.join("")!=h){L()}}}}function g(){var e,t;e=u.val();if(e==""){C();N()}else{e=x(e);if(h==e){return}else{h=e;if(!c){t=e.replace(s,"").split("");m(t);N(t)}}}}function y(){clearInterval(l)}function b(e){y()}function w(e){k();T()}function E(e){if(c){k()}}function S(e){return e>=12353&&e<=12435||e==12445||e==12446}function x(e){if(e.match(ignoreString)){return e.replace(ignoreString,"")}else{var t,n,r;n=ignoreString.split("");r=e.split("");for(t=0;t<n.length;t++){if(n[t]==r[t]){r[t]=""}}return r.join("")}}function T(){var e=this;l=setInterval(g,30)}function N(e){if(!c){if(e){values=e}if(f){var t=A(baseKana+values.join(""));a.val(t)}}}function C(){baseKana="";c=false;ignoreString="";h="";values=[]}function k(){baseKana=a.val();c=false;ignoreString=u.val()}function L(){baseKana=baseKana+values.join("");c=true;values=[]}function A(e){if(i.katakana){var t,n,r;r=new String;for(n=0;n<e.length;n++){t=e.charCodeAt(n);if(S(t)){r+=String.fromCharCode(t+96)}else{r+=e.charAt(n)}}return r}else{return e}}var i=e.extend({katakana:false},r);var s=new RegExp("[^ 　ぁあ-んー]","g");var o=new RegExp("[ぁぃぅぇぉっゃゅょ]","g");var u,a,f=false,l=null,c=true,h;u=e(t);a=e(n);f=true;C();u.blur(b);u.focus(w);u.keydown(E);}})(jQuery)
$.fn.autoKana('input[name="order_name01"]', 'input[name="order_kana01"]', {katakana:true});
$.fn.autoKana('input[name="order_name02"]', 'input[name="order_kana02"]', {katakana:true});
$.fn.autoKana('input[name="deliv_name01"]', 'input[name="deliv_kana01"]', {katakana:true});
$.fn.autoKana('input[name="deliv_name02"]', 'input[name="deliv_kana02"]', {katakana:true});
</script>

<link rel="stylesheet" href="/assets/css/pc/style.css?<!--{$smarty.const.FRONT_CSS_VERSION}-->">
<!--{* LPフォーム入力アシスト機能 パーツカラーの上書き *}-->
<!--{*
<style>
:root {
  --efo-message-textColor: ;
  --efo-message-backgroundColor: ;
  --efo-progress-textColor: ;
  --efo-progress-accentColor: ;
  --efo-progress-backgroundColor: ;
  --efo-error-form-borderColor: ;
  --efo-error-form-textColor: ;
  --efo-error-form-backgroundColor: ;
  --efo-success-form-borderColor: ;
  --efo-success-form-textColor: ;
  --efo-success-form-backgroundColor: ;
}
</style>
*}-->

<script>
var EFO = {};
EFO.SITE_CONFIG = {
  password: {
    min: <!--{$password_rule.min_length|escape:javascript}-->,
    max: <!--{$password_rule.max_length|escape:javascript}-->
  }
}
</script>
<script src="/assets/js/common/efo_config.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script>
EFO.page.config = {
};
EFO.page.classes = {
}
EFO.page.validation = {
}
</script>
<script src="/assets/js/vendor.min.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script src="/assets/js/pc/app.min.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>

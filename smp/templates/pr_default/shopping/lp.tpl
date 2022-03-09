<!--{* updated_at 2014.12.15 *}-->
<!--{if $lp_content != false}--><!--{include file=$lp_content layout='lp_header'}--><!--{/if}-->
<!--{* ↑編集しないでください↑ *}-->

<div id="smp-lpshoppingcolumn" class="p-lp">
    <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->" autocomplete="off" class="js-efo">
        <div class="smp-lp-section">
            <dl>
                <dd>
                   <div class="lp_detail">
                    　<ul>
                        <li class="w70">
                            <p class="sp_ftb">商品名</p>
                            <div class="custom-select w100">
                                <select name="product_id" class="custom-select" id="product_id" style="width:100%;">
                                <!--{* ↓編集しないでください↓ *}-->
                                <!--{if $lp_content != false}--><!--{include file=$lp_content layout='lp_product' select=$arrForm.product_id}--><!--{/if}-->
                                <!--{* ↑編集しないでください↑ *}-->
                                </select>
                            </div>
                        </li>
                        <!--{* 数量は適宜編集してください。*}-->
                        <li class="w30">
                            <p class="sp_ftb">数量</p>
                            <div class="custom-select w100">
                                <select name="quantity" id="quantity" class="w90p" style="text-align:center;">
                                    <!--{assign var=key1 value="quantity"}-->
                                    <option value="1"<!--{if $arrForm[$key1] == '1'}--> selected="selected"<!--{/if}-->>1</option>
                                    <option value="2"<!--{if $arrForm[$key1] == '2'}--> selected="selected"<!--{/if}-->>2</option>
                                    <option value="3"<!--{if $arrForm[$key1] == '3'}--> selected="selected"<!--{/if}-->>3</option>
                                    <option value="4"<!--{if $arrForm[$key1] == '4'}--> selected="selected"<!--{/if}-->>4</option>
                                    <option value="5"<!--{if $arrForm[$key1] == '5'}--> selected="selected"<!--{/if}-->>5</option>
                                    <option value="6"<!--{if $arrForm[$key1] == '6'}--> selected="selected"<!--{/if}-->>6</option>
                                    <option value="7"<!--{if $arrForm[$key1] == '7'}--> selected="selected"<!--{/if}-->>7</option>
                                    <option value="8"<!--{if $arrForm[$key1] == '8'}--> selected="selected"<!--{/if}-->>8</option>
                                    <option value="9"<!--{if $arrForm[$key1] == '9'}--> selected="selected"<!--{/if}-->>9</option>
                                    <option value="10"<!--{if $arrForm[$key1] == '10'}--> selected="selected"<!--{/if}-->>10</option>
                                </select>
                            </div>
                        </li>
                      </ul>
                      <span class="smp-lp-error clear"><!--{$arrErr.product_id}--><!--{$arrErr.time_sale_err}--><!--{$arrErr.time_disp_err}--><!--{$arrErr.product_err}--></span>
                      <span class="smp-lp-error"><!--{$arrErr.quantity}--></span>
                    </div>
                </dd>

                <!--{* 各規格 商品を選択すると、自動的に表示されます。 *}-->
                <dd id="class_category" style="display:none;" class="clear">
                    <div class="bg_ct sp_ftb">規格</div>
                    <!--{* ↓このdiv内に規格用のセレクトボックスが表示されます↓ *}-->
                    <div class="smp-lp-classcategory" id="class_category_select"></div>
                    <!--{* ↑このdiv内に規格用のセレクトボックスが表示されます↑ *}-->
                </dd>
			</dl>
        </div>

        <!--{* こちらはAmazonPayV1(旧型)用です *}-->
        <!--{if $amazon_pay_v1_enabled}-->
        <div style="clear:both;"></div>
        <div id="amazon_button_area">
            <div id="hwrap">
                <span id="amazon_h">Amazonアカウントでお申込み</span>
            </div>
            <div id="amazon_button_in">
                Amazonに登録しているお支払い情報、お届け先情報を使用して簡単にお申込みいただけます。<br>
                （Amazonポイント・ギフト券はご利用いただけません）
                <div>
                    <!--{amazon_pay_button type="PwA" color="Gold" size="medium" lp="1" parallel="yes"}-->
                </div>
            </div>
        </div>
        <!--{/if}-->

        <!--{if 'amazon_pay_v2_usable'|amazon_pay_v2_usable}-->
        <div style="clear:both;"></div>
        <div id="amazon_button_area_v2" style="display:none;">
            <div id="hwrap">
                <span id="amazon_h">Amazonアカウントでお申込み</span>
            </div>
            <div id="amazon_button_in">
                <div id="amazon_pay_v2_area">
                    Amazonに登録しているお支払い情報、お届け先情報を使用して簡単にお申込みいただけます。<br>
                    （Amazonポイント・ギフト券はご利用いただけません）
                    <!--{if $return_back_from_amazon_pay_v2 === true}-->
                    <br><br><span class="smp_lp_red">現在アマゾンログイン中です。カードを変更し直す場合は再度ボタンのクリックをお願いします。</span>
                    <!--{/if}-->
                    <!--{if $is_amazon_pay_v2_tos_check_required}-->
                    <br><br>
                    <input type="checkbox" id="amazon_v2_agree" style="display:inline-block;">
                    <span>
                        <label for="amazon_v2_agree">利用する場合は<a href="/smp/entry/kiyaku_smp.php">利用規約</a>に同意して会員登録する(必須)</label>
                    </span>
                    <!--{/if}-->
                    <!--{if $register != 2}-->
                    <br>
                    <span>
                        <label for="amazon_v2_mailmaga_flg">
                            <input type="checkbox" name="amazon_v2_mailmaga_flg" id="amazon_v2_mailmaga_flg" value="1" style="display:inline-block;">&nbsp;お得な情報を受け取る
                        </label>
                    </span>
                    <br><br>
                    <!--{/if}-->
                    <!--{if $precs_login_required_flg}-->
                    <em>
                    <br><br>
                        ※ 既に当サイトにて会員登録されております。<br>AmazonPay決済をご利用いただく場合は、ログインを行なった後、お手続きにお進みください。
                    </em>
                    <!--{/if}-->
                </div>
                <div id="amazon_pay_button_v2">
                    <div id="amazon_pay_button_v2_click_area">
                        <span id="amazon_dummy_btn"><img src="/img/icons/amazon_v2.png"></span>
                        <!--{*下記のamazon_pay_button_v2において「popup_type='time' popup_time='30' lp='1'」とパラメータを追加することでLPの商品選択30秒後にポップアップが表示されます。*}-->
                        <span id="amazon_onetime_btn" style="display:none;"><!--{amazon_pay_button_v2 chargePermissionType='OneTime' button_id='AmazonPayButtonV2_OneTime' color='Gold'}--></span>
                        <span id="amazon_recurring_btn" style="display:none;"><!--{amazon_pay_button_v2 chargePermissionType='Recurring' button_id='AmazonPayButtonV2_Recurring' color='Gold'}--></span>
                    </div>
                </div>
            </div>
        </div>
        <!--{/if}-->

        <!--{* ↓ログイン状態の場合にのみ表示されます *}-->
        <!--{if $register == 2}-->
        <div class="smp-lp-section">
            <h3>お届け先</h3>
            <dl>
                <dt>お名前</dt>
                <dd><!--{$arrCustomer.order_name01}--> <!--{$arrCustomer.order_name02}--> (<!--{$arrCustomer.order_kana01}--> <!--{$arrCustomer.order_kana02}-->)</dd>
                <dt  class="smp-lp-bottomline">郵便番号</dt>
                <dd>〒<!--{$arrCustomer.order_zip01}--><!--{$arrCustomer.order_zip02}--></dd>
                <dt  class="smp-lp-bottomline">住所</dt>
                <dd><!--{$arrPref[$arrCustomer.order_pref]}--><!--{$arrCustomer.order_addr01}--><!--{$arrCustomer.order_addr02}--></dd>
                <dt  class="smp-lp-bottomline">電話番号</dt>
                <dd><!--{$arrCustomer.order_tel01}-->-<!--{$arrCustomer.order_tel02}-->-<!--{$arrCustomer.order_tel03}--></dd>
                <!--{if $arrPageLayout.needs_completion == 1}-->
                <!--{if !$arrCustomer.order_sex}-->
                <dt class="smp-lp-bottomline"><span class="mgs">性別<!--{if $req_setting.pc_sex == 'REQUIRED'}--><span class="smp-req">必須</span><!--{else}--><span class="smp-any">任意</span><!--{/if}--></span></dt>
                    <dd>
                        <!--{assign var=key value="order_sex"}-->
                        <div id="order_sex_group">
                            <input type="radio" name="order_sex" value="1" class="order_sex_radio" id="order_sex_male" <!--{if $arrForm.order_sex == 1}--> checked="checked"<!--{/if}-->　/><label for="order_sex_male" class="sex_male">男</label>
                            <input type="radio" name="order_sex" value="2" class="order_sex_radio" id="order_sex_female" <!--{if $arrForm.order_sex == 2}--> checked="checked"<!--{/if}-->　/><label for="order_sex_female" class="sex_female">女</label>
                        </div>
                        <span class="smp-lp-error"><!--{$arrErr[$key]}--></span>
                    </dd>
                <!--{/if}-->
                <!--{if !$arrCustomer.order_birth}-->
                    <dt class="smp-lp-bottomline">生年月日<!--{if $req_setting.pc_birth == 'REQUIRED'}--><span class="smp-req">必須</span><!--{else}--><span class="smp-any">任意</span><!--{/if}--></dt>
                    <dd>
                        <ul class="smp-lp-birthday">
                            <li class="w40"><div class="birth-select w100"><select name="year"><!--{html_options options=$arrYear selected=$arrForm.year}--></select></div></li>
                            <li class="w30"><div class="birth-select w100"><select name="month"><option value="">月</option><!--{html_options options=$arrMonth selected=$arrForm.month}--></select></div></li>
                            <li class="w30"><div class="birth-select w100"><select name="day"><option value="">日</option><!--{html_options options=$arrDay selected=$arrForm.day}--></select></div></li>
                        </ul>
                        <span class="smp-lp-error"><!--{$arrErr.year}--><!--{$arrErr.month}--><!--{$arrErr.day}--></span>
                    </dd>
                <!--{/if}-->
                <!--{/if}-->
                <!--{if $arrOtherCustomer}-->
                <dt  class="smp-lp-bottomline">別のお届け先を指定</dt>
                <dd>
                    <div class="custom-select">
                        <select name="other_deliv_id" id="other_deliv_id">
                            <option value="">配送先を選択してください</option>
                          <!--{html_options options=$arrOtherCustomer selected=$arrForm.other_deliv_id}-->
                        </select>
                    </div>
                </dd>
                <!--{/if}-->
            </dl>
        </div>
        <!--{/if}-->

    <!--{* ↓ログインしてない、もしくは非会員の場合 *}-->
    <!--{if $register != 2}-->
    <div class="smp-lp-section clear">
    <div class = "step-area">
        <div class="step-section active">
            <section class = "step-circle ">
                <span class = "step-circle-text">STEP<br>1</span>
            </section>
            <span class = "step-caption">入力</span>
        </div>
        <span class="step-dot">・・・</span>
        <div class="step-section">
            <section class = "step-circle">
                <span class = "step-circle-text">STEP<br>2</span>
            </section>
            <span class = "step-caption">確認</span>
        </div>
        <span class="step-dot">・・・</span>
        <div class="step-section">
            <section  class = "step-circle">
                <span class = "step-circle-text">STEP<br>3</span>
            </section>
            <span class = "step-caption">注文完了</span>
        </div>
    </div>
    <h3>お客様情報の入力</h3>
    <!--過去に購入したことがある方-->
    <div id="lp-login-wrap">
    <div id="lp-shop-name">会員の方はこちら</div>
        <dl>
            <dt>
                <div class="register_btn">
                    <input type="checkbox" class="chbox" name="register" value="1" id="register" <!--{if $register == 1}-->checked="checked"<!--{/if}-->/>
                    <label for="register" class="mgl-15"<!--{if $amazon_pay_usable}--> style="width: 85%;"<!--{/if}-->>入力を省略する</label>
                </div>
            </dt>
        </dl>

        <div class="lp-login" id="lp-login"<!--{if $register != 1}--> style="display:none;"<!--{/if}-->>
                <div class="lp-login_area">
                    <ul>
                        <li>
                            <h3>メールアドレス</h3>
                            <input type="text" id="login_email" name="login_email"  value="<!--{$arrForm.login_email|escape}-->" placeholder="メールアドレス"  class="w100"/>
                        </li>
                        <li>
                      		<h3>パスワード</h3>
                      		<input type="password" id="login_pass" name="login_pass"  value="" placeholder="パスワード" class="w100"/>
                        </li>
                    </ul>
                </div>
                <p class="ft_s01">会員登録時に入力したメールアドレスとパスワードを入力しログインしてください。</p>
                <span class="smp-lp-error"><!--{$arrErr.login_pass}--></span>
                <span class="smp-lp-error"><!--{$loginerror}--></span>
                <div class="lp-login_bottom">
                    <button class="lp_button" onclick="fnModeSubmit('login', 'register', '1');">ログイン</button>
                </div>
                <div id="lp-login-forget">
                    <img src="<!--{$TPL_DIR|escape}-->img/common/arrow_right.png" width="19" height="19" alt="" align="middle" />
                    <span class="lp_pst5 ft_s02"><a href="/smp/forgot/index.php" target="_blank">パスワードを忘れた方はこちら</a></span>
                </div>
            <!--
            <!--{if 'basis-line_app'|get_option_use_flg}-->
            <div style="text-align:center;">
                <span class="line_lp_btn_smp">
                    <img src="/img/line/line_button081_m.png" alt="LINEでログイン" style="cursor: pointer;" />
                </span>
            </div>
            <div>
                <span>※ 会員登録済みのお客様で、既にLINEと連携済みのお客様は『LINEでログイン』リンクからログインしてください。</span><br />
                <span>※ LINEログインすることにより、LINEアカウントが友だち追加されてお知らせがLINEで受け取れます。</span><br />
            </div>
            <!--{/if}-->
            -->
        </div>
    </div>

        <dl class="lp-not-login" id="lp-not-login"<!--{if $register == 1}--> style="display:none;"<!--{/if}-->>
            <!--初めてのお客様は以下よりご入力ください-->
            <h3 style="border-bottom:none;padding:0;"></h3>
            <dt>お名前<span class="smp-req">必須</span></dt>
                <dd>
                    <ul class="smp-lp-username">
                        <!--{assign var=key1 value="order_name01"}-->
                        <!--{assign var=key2 value="order_name02"}-->
                        <li><input type="text" name="<!--{$key1}-->" id="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" autocomplete="<!--{$arrForm.autocomplete[$key1]|autocomplete|escape}-->" placeholder="山田" class="w98"/></li>
                        <li><input type="text" name="<!--{$key2}-->" id="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" autocomplete="<!--{$arrForm.autocomplete[$key2]|autocomplete|escape}-->" placeholder="太郎" class="w100"/></li>
                    </ul>
                    <span class="smp-lp-error"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
                </dd>
                <dt>フリガナ<span class="smp-req">必須</span></dt>
                <dd>
                    <ul class="smp-lp-username">
                        <!--{assign var=key1 value="order_kana01"}-->
                        <!--{assign var=key2 value="order_kana02"}-->
                        <li><input type="text" name="<!--{$key1}-->" id="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" placeholder="ヤマダ" class="w98" /></li>
                        <li><input type="text" name="<!--{$key2}-->" id="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" placeholder="タロウ" class="w100"/></li>
                    </ul>
                    <span class="smp-lp-error"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
                </dd>
                <dt>
                    <div class="smp-lp-bottomline"></div>
                        <p class="mgb10">住所</p>
                    </dt>
                <dd>
                    <span class="ft_s02">郵便番号</span><span class="smp-req">必須</span><span class="nohyphen">ハイフンなしで入力</span>
                    <div class="smp-lp-zipcode">
                        <ul>
                            <li class="w60"><span>〒</span><input type="tel" name="order_zip" value="<!--{$arrForm.order_zip|escape}-->" autocomplete="<!--{$arrForm.autocomplete.order_zip|autocomplete|escape}-->" placeholder="1300000" maxlength="8" id="order_zip" class="w50"/></li>
                            <!-- <li class="w40"><button type="button" class="zip_button" id="order_zip_button">住所自動入力</button></li> -->
                     	</ul>
                    </div>

                    <span class="smp-lp-error"><!--{$arrErr.order_zip}--></span>
                </dd>
                <dt>
                    <p class="ft_s02">都道府県名</span><span class="smp-req">必須</span></p>
                </dt>
                <dd>
                    <div class="smp-lp-order_pref">
                        <div class="custom-select ps01">
                            <select name="order_pref" id="order_pref" class="w180p">
                            <div class="custom-select"><option value="">都道府県を選択</option>
                            <!--{html_options options=$arrPref selected=$arrForm.order_pref}-->
                            </div>
                            </select>
                        </div>
                    </div>
                    <span class="smp-lp-error clear"><!--{$arrErr.order_pref}--></span>
                </dd>
                <dt>
                    <p class="add_comment">市区町村名<span class="smp-req">必須</span></p>
                </dt>
                <dd>
                    <input type="text" name="order_addr01" value="<!--{$arrForm.order_addr01|escape}-->" autocomplete="<!--{$arrForm.autocomplete.order_addr01|autocomplete|escape}-->" id="order_addr01" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS_1|escape}-->"  class="w90" />
                    <span class="smp-lp-error"><!--{$arrErr.order_addr01}--></span>
                </dd>
                <dt>
                    <p class="add_comment">番地・マンション名<span class="smp-req">必須</span></p>
                </dt>
                <dd>
                    <input type="text" name="order_addr02" value="<!--{$arrForm.order_addr02|escape}-->" autocomplete="<!--{$arrForm.autocomplete.order_addr02|autocomplete|escape}-->" id="order_addr02" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS_2|escape}-->" class="w100" />
                   <span class="smp-lp-error"><!--{$arrErr.order_addr02}--></span>
                    <p class="smp_lp_red">※部屋番号が記入されているかをご確認ください。記入がないとお届けできないことがあります。</p>
                </dd>
                <dt>
                    <div class="smp-lp-bottomline"></div>
                    電話番号<span class="smp-req">必須</span><span class="nohyphen">ハイフンなしで入力</span>
                </dt>
                <dd>
                    <input type="tel" name="order_tel" value="<!--{$arrForm.order_tel|escape}-->" autocomplete="<!--{$arrForm.autocomplete.order_tel|autocomplete|escape}-->" maxlength="14" placeholder="09011112222" class="w80" />
                    <span class="smp-lp-error"><!--{$arrErr.order_tel}--></span>
                </dd>
                <dt>メールアドレス<span class="smp-req">必須</span></dt>
                <dd>
                    <input type="email" name="order_email" value="<!--{$arrForm.order_email|escape}-->" autocomplete="<!--{$arrForm.autocomplete.order_email|autocomplete|escape}-->" id="order_email" placeholder="sample@example.com" class="w100" />
                    <span class="smp-lp-error"><!--{$arrErr.order_email}--></span>
                </dd>
                <!--{if $arrPageLayout.confirm_email != 1}-->
                    <dt>
                        <span class="reinput">確認のためもう一度入力してください</span><span class="smp-req">必須</span>
                    </dt>
                	<!--{* ↓上のメールアドレスを入力すると確認用欄に自動入力されます。自動入力を避けたい場合は id="order_email_check"を削除してください。 *}-->
                    <dd>
                        <input type="email" name="order_email_check" value="<!--{$arrForm.order_email_check|escape}-->" autocomplete="<!--{$arrForm.autocomplete.order_email_check|autocomplete|escape}-->" id="order_email_check" placeholder="sample@example.com"  class="w100" />
                        <span class="smp-lp-error"><!--{$arrErr.order_email_check}--></span>
                    </dd>
                <!--{/if}-->
                <dt>パスワード<span class="smp-req">必須</span><span class="psw_comment"><b><!--{$password_rule.min_length|escape}--></b>～<b><!--{$password_rule.max_length|escape}--></b>文字の<!--{$password_format_list[$password_rule.rules]|escape}--></span>
                </dt>
                <dd>
                    <!--{assign var=key value="password"}-->
                    <input type="password" name="password" value="<!--{$arrForm.password|escape}-->" autocomplete="<!--{$arrForm.autocomplete.password|autocomplete|escape}-->" id="password" placeholder="" class="w60" />
                    <div class="psw_comment2"><em>※購入履歴の確認などに使用します。</em></div>
                    <span class="smp-lp-error"><!--{$arrErr[$key]}--></span>
                </dd>
                <!--{if $arrPageLayout.confirm_password != 1}-->
                    <dt>
                        <span class="reinput">確認のためもう一度入力してください</span><span class="smp-req">必須</span>
                    </dt>
                    <dd>
                        <input type="password" name="password02" value="<!--{$arrForm.password02|escape}-->" autocomplete="<!--{$arrForm.autocomplete.password02|autocomplete|escape}-->" id="password02" placeholder="" class="w60" />
                        <span class="smp-lp-error"><!--{$arrErr.password02}--></span>
                    </dd>
                <!--{/if}-->
                <dt>
                	<div class="smp-lp-bottomline"></div>
                    <span class="mgs">性別<!--{if $req_setting.pc_sex == 'REQUIRED'}--><span class="smp-req">必須</span><!--{else}--><span class="smp-any">任意</span><!--{/if}--></span>
                </dt>
                <dd>
                        <!--{assign var=key value="order_sex"}-->
                        <div id="order_sex_group">
                            <input type="radio" name="order_sex" value="1" class="order_sex_radio" id="order_sex_male" <!--{if $arrForm.order_sex == 1}--> checked="checked"<!--{/if}-->　/><label for="order_sex_male" class="sex_male">男</label>
                            <input type="radio" name="order_sex" value="2" class="order_sex_radio" id="order_sex_female" <!--{if $arrForm.order_sex == 2}--> checked="checked"<!--{/if}-->　/><label for="order_sex_female" class="sex_female">女</label>
                        </div>
                  <span class="smp-lp-error"><!--{$arrErr[$key]}--></span>
                </dd>
                <dt>生年月日<!--{if $req_setting.pc_birth == 'REQUIRED'}--><span class="smp-req">必須</span><!--{else}--><span class="smp-any">任意</span><!--{/if}--></dt>
                <dd>
                    <ul class="smp-lp-birthday">
                        <li class="w40"><div class="birth-select w100"><select name="year"><!--{html_options options=$arrYear selected=$arrForm.year}--></select></div></li>
                        <li class="w30"><div class="birth-select w100"><select name="month"><option value="">月</option><!--{html_options options=$arrMonth selected=$arrForm.month}--></select></div></li>
                        <li class="w30"><div class="birth-select w100"><select name="day"><option value="">日</option><!--{html_options options=$arrDay selected=$arrForm.day}--></select></div></li>
                    </ul>
                    <span class="smp-lp-error"><!--{$arrErr.year}--><!--{$arrErr.month}--><!--{$arrErr.day}--></span>
                </dd>
            </dl>
            <!--{/if}-->
            <dl id="deliv_check_area">
                <dt class="smp-lp-bottomline">
                    <div class="deliv_btn button">
                        <input type="checkbox" class="chbox" name="deliv_check" id="deliv_check" value="1" <!--{if $deliv_check == 1}-->checked="checked"<!--{/if}--> />
                        <label for="deliv_check" class="mgl-15">上記と別の住所へお届けする</label>
                    </div>
                    <p class="deliv_check_comment">※上記の住所へお届けする場合はチェック不要</p>
                </dt>
            </dl>

            <dl class="lp-not-login lp-deliv" id="lp-deliv"<!--{if $deliv_check != 1}--> style="display:none;"<!--{/if}-->>
                <dt>お名前<span class="smp-req">必須</span></dt>
                <dd>
                    <ul class="smp-lp-username">
                        <!--{assign var=key1 value="deliv_name01"}-->
                        <!--{assign var=key2 value="deliv_name02"}-->
                        <li><input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" autocomplete="<!--{$arrForm.autocomplete[$key1]|autocomplete|escape}-->" placeholder="山田" class="w98" /></li>
                        <li><input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" autocomplete="<!--{$arrForm.autocomplete[$key2]|autocomplete|escape}-->" placeholder="太郎" class="w98" /></li>
                    </ul>
                    <span class="smp-lp-error"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
                </dd>
                <dt>フリガナ<span class="smp-req">必須</span></dt>
                <dd>
                    <ul class="smp-lp-username">
                        <!--{assign var=key1 value="deliv_kana01"}-->
                        <!--{assign var=key2 value="deliv_kana02"}-->
                        <li><input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" placeholder="ヤマダ" class="w98" /></li>
                        <li><input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" placeholder="タロウ" class="w98" /></li>
                    </ul>
                    <span class="smp-lp-error"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
                </dd>
                <dt>
                    <div class="smp-lp-bottomline"></div>
                        <p class="mgb10">住所</p>
                    </dt>
                <dd>
                	<p class="ft_s02">郵便番号<span class="smp-req">必須</span><span class="nohyphen">ハイフンなしで入力</span></p>
					<div class="smp-lp-zipcode">
                        <div class="add_fl"><span class="pd_r">〒</span><input type="tel" name="deliv_zip" value="<!--{$arrForm.deliv_zip|escape}-->" autocomplete="<!--{$arrForm.autocomplete.deliv_zip|autocomplete|escape}-->" placeholder="1300000" maxlength="8" id="deliv_zip" class="w80" /></div>
                        <!-- <div class="add_fr"><button class="zip_button" type="button" id="deliv_zip_button">住所自動入力</button></div> -->
					</div>
                    <span class="smp-lp-error"><!--{$arrErr.deliv_zip}--></span>
				</dd>
				<dt>
                    <p class="ft_s02">都道府県名<span class="smp-req">必須</span></p>
                </dt>
                <dd>
                    <div class="smp-lp-order_pref">
                        <div class="custom-select ps01">
                            <select name="deliv_pref" id="deliv_pref" class="w180p">
                                <div class="custom-select"><option value="">都道府県を選択</option>
                                <!--{html_options options=$arrPref selected=$arrForm.deliv_pref}-->
                                </div>
                          	</select>
                        </div>
                        <span class="smp-lp-error clear"><!--{$arrErr.deliv_pref}--></span>
                    </div>
                </dd>
                <dt>
                    <p class="add_comment">市区町村名<span class="smp-req">必須</span></p>
                </dt>
                <dd>
                    <!--{assign var=key value="deliv_addr01"}-->
                    <input type="text" name="<!--{$key|escape}-->" value="<!--{$arrForm[$key]|escape}-->" autocomplete="<!--{$arrForm.autocomplete[$key]|autocomplete|escape}-->" id="<!--{$key|escape}-->" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS_1|escape}-->" class="w90" />
                    <span class="smp-lp-error"><!--{$arrErr[$key]}--></span>
                </dd>
                <dt>
                    <p class="add_comment">番地・マンション名<span class="smp-req">必須</span></p>
                </dt>
                <dd>
                    <!--{assign var=key value="deliv_addr02"}-->
                    <input type="text" name="<!--{$key|escape}-->" value="<!--{$arrForm[$key]|escape}-->" autocomplete="<!--{$arrForm.autocomplete[$key]|autocomplete|escape}-->" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS_2|escape}--> " class="w100"/>
                    <span class="smp-lp-error"><!--{$arrErr[$key]}--></span>
                    <p class="smp_lp_red">※部屋番号が記入されているかをご確認ください。記入がないとお届けできないことがあります。</p>
                </dd>
                <dt>
                    <div class="smp-lp-bottomline"></div>
                    電話番号<span class="smp-req">必須</span><span class="nohyphen">ハイフンなしで入力</span>
                </dt>
                <dd>
                    <input type="tel" name="deliv_tel" value="<!--{$arrForm.deliv_tel|escape}-->" autocomplete="<!--{$arrForm.autocomplete.deliv_tel|autocomplete|escape}-->" id="deliv_tel" maxlength="14" placeholder="09011112222" class="w80" />
                    <span class="smp-lp-error"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--><!--{$arrErr[$key3]}--></span>
                </dd>
            </dl>

            <!--{* クーポンを使わせない場合はコメントアウトしてください *}-->
            <!--{if 'code_coupon'|get_option_use_flg == true && $view_coupon_form}-->
            <div class="smp-lp-section" id="coupon_area" style="display:none;">
                <h3>クーポン</h3>
                <dl id="entry_coupon_td">
                    <dt>
                        <p>クーポンコードを入力してください</p>
                        <input type="text" name="coupon_code" value="" id="coupon_code" class="w60"/>
                        <button type="button" id="check_coupon_code" class="cupon_btn">クーポン適用</button>
                        <span class="smp-lp-error" style="display:none;">クーポン適用中...</span>
                    </dt>
                    <span class="smp-lp-error" id="coupon_code_error"></span>
                </dl>
                <dl id="view_coupon_td" style="display:none;">
                    <dt>
                        <div id="coupon_discount_tr" style="display:none;">
                            <span id="discount"></span>円値引
                        </div>
                        <button type="button" id="remove_coupon_code" class="cupon_rebtn">解除</button>
                        <span class="smp-lp-error" style="display:none;">クーポン解除中...</span>
                    </dt>
                </dl>
            </div>
            <!--{/if}-->

            <!--{* お支払方法は、商品選択されると表示されます *}-->
            <div id="payment_area" class="smp-lp-section" style="display:none;">
                <h3>お支払方法</h3>
                <!--{* ↓このspan内にお支払方法のチェックボックス群が表示されます↓ *}-->
                <div id="payment_methods"></div>
                <!--{* ↑このspan内にお支払方法のチェックボックス群が表示されます↑ *}-->

                <!--{* 汎用決済用クレジットカードフォーム一括出力 *}-->
                <!--{get_token_payment_system_form_tag_card_info_area dump="true"}-->
          </div>

          <div class="smp-lp-section">
        <!--{* 商品が選択された状態で、それが定期商品であれば、以下が自動的に表示されます。未選択や非定期商品選択時は消えます *}-->
                <div style="display: none;"><!--{* 定期選択時に定期購入チェックボックスを表示させたい場合は消してください。 *}-->
                <dd id="regular_product_area" style="display:none;" class="lp-regular clear">
                    <h2>
                        <input type="checkbox" name="regular" value="1" class="chbox" id="regular"<!--{if ($regular_product && $reg_flg == 1) || ($regular_product && $no_regular == 0)}--> checked="checked" <!--{/if}--> />
                        <label for="regular" style="margin-left: 5px;">定期購入を希望する</label>
                    </h2>
                </dd>
                </div>
            </dl>

            <!--{* 上記の「定期購入を希望する」をチェックしてる場合のみ表示されます。それ以外は消えます *}-->
            <div class="lp-regular smp-lp-bottomline" id="regular-deliv_area" style="display:none; border-top:none; margin-top: 0; padding-top: 0;">
              <h3>お届け間隔の指定</h3>
                <dl>
                    <!--{* ↓定期配送間隔がこちらに表示されます↓ *}-->
                    <span id="regular_cycle_area"></span>
                    <!--{* ↑定期配送間隔がこちらに表示されます↑ *}-->
			    </dl>
            <div class="clear"></div>
        </div>
        <!--{* 定期関連ここまで *}-->
		</div>

        <div class="smp-lp-section" id="deliv_datetime_area" style="display:none;">
            <h3>お届け希望日時</h3>
            <!--{* ↓このspan内にお届け時間関連が表示されます。デザイン変更はlp_ajax.tplを編集してください。↓ *}-->
            <div id="deliv_time_area"></div>
            <!--{* ↑このspan内にお届け時間関連が表示されます。デザイン変更はlp_ajax.tplを編集してください。↑ *}-->
        </div>

        <!--{* お問い合わせ欄を設置したい場合はコメントアウトを外してください *}-->
        <!--<div class="smp-lp-section" id="smp_lpmessage">
            <h3>その他お問い合わせ</h3>
            <dl>
                <!--{assign var=key value="message"}-->
                <dd><textarea name="<!--{$key}-->" rows="4" placeholder="ご質問・ご要望などはこちらにご入力ください。"><!--{$arrForm[$key]|escape}--></textarea>
                <em>(<!--{$smarty.const.LTEXT_LEN}-->文字まで)</em>
                <span class="smp-lp-error"><!--{$arrErr[$key]}--></span>
               </dd>
            </dl>
        </div>-->

        <!--{* ポイント使用欄は、ログイン済の状態で商品選択(規格ありの場合は規格も選択)されると表示されます *}-->
        <!--{if $register == 2 && $point_flg != 2}-->
        <div id="point_area" class="smp-lp-section" style="display:none;">
            <h3>ポイント使用の指定</h3>
            <p class="mini2">
                1ポイントを1円として使用する事ができます。<br />
                使用する場合は、「ポイントを使用する」にチェックを入れた後、使用するポイントをご記入ください。
            </p>
            <div class="pointbox">
                <p>所持ポイント:<br>
                    <em class ="point"><!--{$CustomerPoint|default:0|number_format}-->Pt</em>
                </p>
                <p>ご購入合計：<br>
                    <span class="price" id="price"></span><span class="attention">（送料、手数料を含みません。）</span>
                </p>
                <p>使用可能ポイント:<br>
                    <em class ="point"><!--{$tpl_available_point|default:0|number_format}-->Pt</em>
                </p>
                <ul>
                    <li>
                        <input type="radio" id="point_on" name="point_check" value="1" <!--{$arrForm.point_check|sfGetChecked:1}--> onclick="fnCheckInputPoint();" /><label for="point_on">ポイントを使用する</label>
                        <!--{assign var=key value="use_point"}-->
                        <p>
                            <input type="text" name="<!--{$key}-->" value="0" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="6" class="box60" />&nbsp;ptを使用<span class="attention"><!--{$arrErr[$key]}--></span>
                        </p>
                    </li>
                    <li><input type="radio" id="point_off" name="point_check" value="2" <!--{$arrForm.point_check|sfGetChecked:2}--> onclick="fnCheckInputPoint();" /><label for="point_off">ポイントを使用しない</label></li>
                </ul>
            </div>
        </div>
        <!--{/if}-->

        <div class="smp-lp-section">
            <h3>個人情報のお取り扱いについて</h3>
            <dl>
                <!--{if $register != 2}--><!--{* 非ログイン時のみ表示されます *}-->
                <dd class="ft_bold">
                    <!--{if $arrMailCompulsionView eq "ON"}-->
                    <input type="hidden" name="mailmaga_flg" value="1" />
                    <!--{else}-->
                    <input type="checkbox" name="mailmaga_flg" id="mailmaga_flg" value="1" class="chbox ft_bold" <!--{if $arrForm.no_mailmaga_flg != 1}-->checked="checked" <!--{/if}--> /><label for="mailmaga_flg" style="margin-left: 5px;">お得な情報を受け取る</label>
                    <input type="hidden" name="no_mailmaga_flg" value="0" id="no_mailmaga_flg" />
                    <!--{/if}-->
                    <span class="smp-lp-error"><!--{$arrErr.mailmaga_flg}--></span>
                </dd>
                <!--{/if}-->
                <dd>
                	<p class="ft_s03">ご購入前に<strong><a href="../entry/kiyaku_smp.php?rfr=lp" target="_blank">利用規約</a></strong>をお読みください</p>
                    <div class="ft_bold">
                      <input type="checkbox" name="agree" value="1" id="agree" class="chbox" />
                      <label for="agree" style="margin-left: 5px;">利用規約に同意する</label>
                    </div>
                </dd>
                <span class="smp-lp-error"><!--{$arrErr.agree}--></span>
            </dl>
        </div>


        <!--購入確認画面-->
        <div class="smp-lp-bottomline">
            <div class="smp-lp-section">
                <div class = "step-area">
                    <div class="step-section active">
                        <section class = "step-circle ">
                            <span class = "step-circle-text">STEP<br>1</span>
                        </section>
                        <span class = "step-caption">入力</span>
                    </div>
                    <span class="step-dot">・・・</span>
                    <div class="step-section">
                        <section class = "step-circle">
                            <span class = "step-circle-text">STEP<br>2</span>
                        </section>
                        <span class = "step-caption">確認</span>
                    </div>
                    <span class="step-dot">・・・</span>
                    <div class="step-section">
                        <section  class = "step-circle">
                            <span class = "step-circle-text">STEP<br>3</span>
                        </section>
                        <span class = "step-caption">注文完了</span>
                    </div>
                </div>
                <span class="smp-lp-error smp-lp-confirm" id="alert_errors" <!--{if !$arrErr}-->style="display:none;"<!--{/if}-->>
                <!--{if $arrErr}-->
                    <!--{foreach from=$arrErr key=key item=item}-->
                        <!--{$item}--><br/>
                    <!--{/foreach}-->
                <!--{/if}-->
                </span>
                <div style="text-align:center;" id="confirm_submit">
                    <input type="button" id="confirm_submit_image" value = "購入確認画面へ" onclick="return false;" style="outline:none;"/>
                </div>
            </div>
        </div>
        <!--{* ↓編集しないでください↓ *}-->
        <!--{foreach from=$arrHiddens key="key_h" item="val_h"}-->
        <input type="hidden" name="<!--{$key_h}-->" value="<!--{$val_h.value}-->" class="<!--{$val_h.class}-->" id="<!--{$val_h.class}--><!--{$key_h}-->" />
        <!--{/foreach}-->
        <!--{foreach from=$arrErr key="key_e" item="val_e"}-->
        <input type="hidden" name="errors_<!--{$key_e}-->" value="<!--{$val_e}-->" class="errors" id="errors_<!--{$key_e}-->" />
        <!--{/foreach}-->
        <input type="hidden" name="ajax_url" value="<!--{$ajax_url}-->" id="ajax_url" />
        <!--{* ↑編集しないでください↑ *}-->
    </form>
</div>

<!--{* ↓編集しないでください↓ *}-->
<!--{if $lp_content != false}--><!--{include file=$lp_content layout='lp_footer'}--><!--{/if}-->
<script type="text/javascript" src="/js/lp.compress.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<!--{* ↑編集しないでください↑ *}-->

<link rel="stylesheet" href="<!--{$TPL_DIR}-->css/lp.css?<!--{$smarty.const.FRONT_CSS_VERSION}-->" type="text/css" media="all" />
<script>

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


$(function() {
	// エラーフォーム背景指定
	var valid = new Array("dummy"<!--{foreach from=$arrErr key="key" item="item"}-->,"<!--{$key}-->"<!--{/foreach}-->);
	for (var i = 0; i < valid.length; i++){
		$('*[name=' + valid[i] + ']').css("background", "rgb(255,160,160)");
	}
	// 入力フォーム背景指定
	$('input, select').focus( function () { $(this).css("background", "") } );
	$('input, select').blur( function () { !$(this).val() ? $(this).css("background", "rgb(255,255,255)") : $(this).css("background", "") } );
});

$('#mailmaga_flg').click(function(){
    if($(this).prop('checked')){
        $('#no_mailmaga_flg').val(0);
    }
    else{
        $('#no_mailmaga_flg').val(1);
    }
});
</script>

<link rel="stylesheet" href="/assets/css/sp/style.css?<!--{$smarty.const.FRONT_CSS_VERSION}-->">
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
  },
  birthday: {
    selected: <!--{if $req_setting.pc_birth == 'REQUIRED'}-->true<!--{else}-->false<!--{/if}-->
  },
  sex: {
    selected: <!--{if $req_setting.pc_sex == 'REQUIRED'}-->true<!--{else}-->false<!--{/if}-->
  }
}
</script>
<script src="/assets/js/common/efo_config.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script src="/assets/js/sp/efo_config.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script>
EFO.page.config = {
};
EFO.page.classes = {
}
EFO.page.validation = {
}
</script>
<script src="/assets/js/vendor.min.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script src="/assets/js/sp/app.min.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>

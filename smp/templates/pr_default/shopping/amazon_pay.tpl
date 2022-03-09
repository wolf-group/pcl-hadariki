<script type="text/javascript" src="/js/mask.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->" ></script>
<script type="text/javascript">
function objectopen(){
    showobj('btm');
    return false;
}
function showobj(obj) {
    var box = document.getElementById(obj);
    var btn1 = document.getElementById('topbtn');
    if( box.style.display != "block" ) {
        box.style.display = "block";
        btn1.style.visibility = "hidden";
    } else {
        box.style.display = "none";
        btn1.style.visibility = "visible";
    }
}
</script>

   <!--{if $billing_agreement_ids}-->
    <style type="text/css">
        #amazon_widget_area{display: none;}
        #consentWidgetDiv{
            height: 135px;
            border: solid 1px #ddd;
            overflow: hidden;
            margin-bottom: -3em;
            border-radius: 4px 4px 0 0 / 4px 4px 0 0;
            background-image: url(../img/shopping/ap_com.gif);
        }
    </style>
<!--{/if}-->

<link rel="stylesheet" type="text/css" href="<!--{$TPL_DIR|escape}-->css/amazon_payform.css">
<!--▼CONTENTS-->
<div class="apheader"><img src="<!--{$TPL_DIR|escape}-->img/shopping/amazonpay-logo.png"><span class="aph_txt">利用確認</span></div>


<div id="shoppingcolumn_ap">
    <div class="shopping_inner_ap">
        <!--{if $error_message}--><span class="required"><!--{$error_message|escape}--></span><br /><!--{/if}-->
        <!--{if $billing_agreement_ids}-->
        <h2 class="result">配送先の選択</h2>
        <table id="exist_deliv" summary="配送先の選択">
            <!--{foreach from=$billing_agreement_ids key=key item=val}-->
            <tr>
                <td class="centertd">
                    <input type="radio" name="customer_billing_agreement_id" class="customer_billing_agreement_ids" id="bid_<!--{$val.amazon_billing_agreement_id|escape}-->" value="<!--{$val.amazon_billing_agreement_id|escape}-->" <!--{if $key == 0}-->checked="checked"<!--{/if}--> />
                </td>
                <td>
                    <label for="bid_<!--{$val.amazon_billing_agreement_id|escape}-->">
                        <!--{$val.state_or_region|escape}--><!--{$val.city|escape}--><!--{$val.address_line_1|escape}--><!--{$val.address_line_2|escape}--> <!--{$val.name|escape}-->様
                    </label>
                </td>
            </tr>
            <!--{/foreach}-->
            <tr>
                <td class="centertd">
                    <input type="radio" name="customer_billing_agreement_id" id="new_billing_agreement_id" value="" />
                </td>
                <td>
                    <label for="new_billing_agreement_id">お届け先または使用するカードを変更する</label>
                </td>
            </tr>
        </table>
        <!--{/if}-->

        <!--{if $billing_agreement_ids}-->
        <div id="amazon_widget_area">
            <!--{* Amazon Pay をお支払方法に設定する *}-->
            <div id="consentWidgetDiv"></div>

			<div class="tgcon" style="top: -23px;">
				<div class="top">
					<p id="topbtn"><a href="javascript:void(0)" onclick="objectopen(); return false;">詳しくはこちら</a></p>
				</div>
				<div id="btm" style="float: left; margin-bottom: -121px;">
			        <p>Amazon Payと、この出品者に対する購入と支払い用に選択したお支払い方法が自動的に使用されます。アクセスして設定をキャンセルまたは変更してください<a href="https://payments.amazon.co.jp/jr/your-account/ba">アカウントの設定</a>.</p>
			        <div id="btmfaq"><a href="https://pay.amazon.com/jp/help/202072110">FAQ</a></div>
					<div id="btmbtn"><a href="javascript:void(0)" onclick="objectopen(); return false;">終了</a></div>
				</div>
			</div>
            <div id="addressBookWidgetDiv" style="border-top: none; border-radius: 0;"></div>
            <div id="walletWidgetDiv"></div>
        </div>
        <div id="consentWidgetAlertDiv" style="display:none; font-weight:bold; color:red;"></div>
        <!--{else}-->
        <div id="amazon_widget_area">
            <!--{* Amazon Pay をお支払方法に設定する *}-->
            <div id="consentWidgetDiv" class="widget_in"></div>
            <div class="tgcon">
                <div class="top">
                    <p id="topbtn"><a href="javascript:void(0)" onclick="objectopen(); return false;">詳しくはこちら</a></p>
                </div>
                <div id="btm">
                    <p>Amazon Payと、この出品者に対する購入と支払い用に選択したお支払い方法が自動的に使用されます。アクセスして設定をキャンセルまたは変更してください<a href="https://payments.amazon.co.jp/jr/your-account/ba">アカウントの設定</a>.</p>
                    <div id="btmfaq"><a href="https://pay.amazon.com/jp/help/202072110">FAQ</a></div>
                    <div id="btmbtn"><a href="javascript:void(0)" onclick="objectopen(); return false;">終了</a></div>
                </div>
            </div>
        </div>
        <!--{/if}-->
        <div id="amazonLoginButton" style="display:none;"></div>

        <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
            <input type="hidden" name="mode" value="confirm" />
            <input type="hidden" name="uniqid" id="uniqid" value="<!--{$tpl_uniqid|escape}-->" />
            <input type="hidden" name="access_token" id="amazon_access_token" value="" />
            <input type="hidden" name="re_billing_agreement_id" id="re_billing_agreement_id" value="" />
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$transactionid|escape}-->" />

                <!--{* 非会員なら登録させます *}-->
                <!--{if !$customer}-->
                    <div id="amazon_agree">
                        <label for="c_agree" class="lbl">
                            <input type="checkbox" name="agree" value="1" id="c_agree" checked="checked">
                            <span class="c_agree-parts"><a href="/smp/entry/kiyaku_smp.php" id="rule_text_link" target="n">利用規約</a>に同意して会員登録する</span><span class="apreq">必須</span>
                        </label>
                        <br />
                        <label for="mailmaga_flg" class="lbl">
                            <input type="checkbox" name="mailmaga_flg" id="mailmaga_flg" value="1"/>
                            <span class="mailmaga_flg-parts">お得な情報を受け取る</span><span class="apany">任意</span>
                        </label>
                    </div>
                <!--{else}-->
                    <input type="checkbox" name="agree" value="1" id="c_agree" checked="checked" style="display:none;" />
                <!--{/if}-->

            <!--{if $reg_get == 1}-->
                <div class="hreq"><h2 class="resultreq">お届けサイクル</h2><span class="apreq">必須</span></div>
                <table summary="お届けサイクル" class="delivname">
                    <tbody>
                        <tr>
                            <tr>
                                <td>
                                    <!--{assign var=key1 value="cycle_date:monthly"}-->
                                    <!--{assign var=key2 value="cycle_date:day"}-->
                                    <!--{if $regular_product.$key1 && $regular_product.$key2}-->
                                    <div class="btn_area">
                                        <label><input type="radio" name="cycle_type" class="cycle_type" id="cycle_type1" value="1">日付で指定</label><br />
                                        <select name="cycle_date_monthly" class="cycle_select" id="cycle_date_monthly">
                                            <!--{foreach from=$regular_product.$key1 key=key item=val}-->
                                            <option value="<!--{$val|escape}-->"><!--{$common_regular_param.cycle_monthly.$val|escape}--></option>
                                            <!--{/foreach}-->
                                        </select>
                                        <select name="cycle_date_day" class="cycle_select" id="cycle_date_day">
                                            <!--{foreach from=$regular_product.$key2 key=key item=val}-->
                                            <option value="<!--{$val|escape}-->"><!--{$common_regular_param.cycle_date_day.$val|escape}--></option>
                                            <!--{/foreach}-->
                                        </select>にお届け
                                    </div>
                                    <!--{/if}-->

                                    <!--{assign var=key1 value="cycle_week:monthly"}-->
                                    <!--{assign var=key2 value="cycle_week:ordinal"}-->
                                    <!--{assign var=key3 value="cycle_week:week"}-->
                                    <!--{if $regular_product.$key1 && $regular_product.$key2 && $regular_product.$key3}-->
                                    <div class="btn_area">
                                        <label><input type="radio" name="cycle_type" class="cycle_type" id="cycle_type2" value="2">曜日で指定</label><br />
                                        <select name="cycle_week_monthly" class="cycle_select" id="cycle_week_monthly">
                                            <!--{foreach from=$regular_product.$key1 key=key item=val}-->
                                            <option value="<!--{$val|escape}-->"><!--{$common_regular_param.cycle_monthly.$val|escape}--></option>
                                            <!--{/foreach}-->
                                        </select>
                                        <select name="cycle_week_ordinal" class="cycle_select" id="cycle_week_ordinal">
                                            <!--{foreach from=$regular_product.$key2 key=key item=val}-->
                                            <option value="<!--{$val|escape}-->"><!--{$common_regular_param.cycle_week_ordinal.$val|escape}--></option>
                                            <!--{/foreach}-->
                                        </select>
                                        <select name="cycle_week_week" class="cycle_select" id="cycle_week_week">
                                            <!--{foreach from=$regular_product.$key3 key=key item=val}-->
                                            <option value="<!--{$val|escape}-->"><!--{$common_regular_param.cycle_week.$val|escape}--></option>
                                            <!--{/foreach}-->
                                        </select>にお届け
                                    </div>
                                    <!--{/if}-->

                                    <!--{assign var=key1 value="cycle_interval:interval"}-->
                                    <!--{if $regular_product.$key1}-->
                                    <div class="btn_area">
                                        <label><input type="radio" name="cycle_type" class="cycle_type" id="cycle_type3" value="3">間隔で指定</label><br />
                                        初回お届け日
                                        <select name="cycle_interval_start_date" class="cycle_select" id="cycle_interval_start_date">
                                            <!--{section name=cnt start=0 loop=$regular_config.interval_range}-->
                                            <!--{assign var=time_ts value="+`$smarty.section.cnt.index` day"|strtotime:$regular_config.allowed_first_interval_date_ts}-->
                                            <!--{assign var=time value=$time_ts|date_format:"%Y-%m-%d"}-->
                                            <option value="<!--{$time|escape}-->"><!--{$time_ts|date_format:"%Y年%m月%d日"|escape}--></option>
                                            <!--{/section}-->
                                        </select>から<br />
                                        <select name="cycle_interval_interval" class="cycle_select" id="cycle_interval_interval">
                                            <!--{foreach from=$regular_product.$key1 key=key item=val}-->
                                            <option value="<!--{$val|escape}-->" <!--{if $arrForm.cycle_interval_interval == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_interval.$val|escape}--></option>
                                            <!--{/foreach}-->
                                        </select>間隔でお届け
                                    </div>
                                    <!--{/if}-->

                                    <!--{* 初回即時、もしくは初回最短機能を使いたいが、チェックボックスを表示したくない場合、下記 <div class="btn_area">を<div class="btn_area" style="display:none;">に変更してください *}-->
                                    <div class="btn_area">
                                        <!--{*
                                        === 初回即時で最初からチェックを入れた状態にしたい場合 ===
                                        inputタグ内に checked="checked" を追記してください
                                        <input type="checkbox" name="first_quick_flg" id="first_quick_flg" value="1" />
                                       ↓
                                        <input type="checkbox" name="first_quick_flg" id="first_quick_flg" value="1" checked="checked" />
                                        *}-->

                                        <!--{if $first_auto == 1}-->
                                        <label id="quick_flg_area"><input type="checkbox" name="first_quick_flg" id="first_quick_flg" value="1" />初回のみ即日発送を希望 ※翌営業日の発送になる場合もあります</label>
                                        <!--{else}-->
                                        <label id="quick_flg_area"><input type="checkbox" name="quick_flg" id="quick_flg" value="1" />初回は最短でお届け希望</label>
                                        <!--{/if}-->
                                    </div>
                                </td>
                            </tr>
                    </tbody>
                </table>
            <!--{/if}-->

        <!--{if !$billing_agreement_ids}-->
                <h2 class="result">お届け先・お支払い方法</h2>
                    <!--{* アドレス帳 *}-->
                    <div id="addressBookWidgetDiv"></div>
                    <!--{* お支払い方法 *}-->
                    <div id="walletWidgetDiv"></div>
        <!--{/if}-->

            <!--{if $amazon_user_name_modification_flg == 1}-->
            <div id="amazon_button_area" style="margin-top: 1em;">
                <h2 class="resultreq">ショップに登録する氏名</h2><span class="apreq">必須</span>
                   <div id="amazon_name_modi">
                        <p>お名前</p>
                        <input type="text" name="deliv_name01" id="deliv_name01" placeholder="姓" value="<!--{$customer|@null_coalescing:"name01"|escape}-->" />
                        <input type="text" name="deliv_name02" id="deliv_name02" placeholder="名" value="<!--{$customer|@null_coalescing:"name02"|escape}-->" />
                        <p>フリガナ</p>
                        <input type="text" name="deliv_kana01" id="deliv_kana01" placeholder="セイ" value="<!--{$customer|@null_coalescing:"kana01"|escape}-->" />
                        <input type="text" name="deliv_kana02" id="deliv_kana02" placeholder="メイ" value="<!--{$customer|@null_coalescing:"kana02"|escape}-->" />
                       <br><span class="amz_name_atn">※お名前に誤りがある場合は枠内をご修正ください</span>
                        <!--{if $arrErr.deliv_name01}-->
                        <br /><span class="required"><!--{$arrErr.deliv_name01|escape}--></span>
                        <!--{/if}-->
                        <!--{if $arrErr.deliv_name02}-->
                        <br /><span class="required"><!--{$arrErr.deliv_name02|escape}--></span>
                        <!--{/if}-->
                    </div>
            </div>
            <!--{/if}-->

            <div class="btn_next_p">
                <div class="comp_btn">注文を確定する</div>
                <div class="no_comp_btn">まだ注文を確定できません</div>
                <div class="alttxt">
                    <div class="altinner">
                        未確認項目があるため、まだ注文できません。<br>
                        <span class="bolye"><a href="#consentWidgetDiv">ページ上部の必須項目</a></span>をチェックしてください。
                    </div>
                </div>
            </div>

            <div class="comp_btn btn_next" id="btn_next" style="display: none;"><a href="javascript:void(0);" onclick="AmazonPaySubmit('form1');">注文を確定する</a></div>


            <h2 class="result">お届け日と時間</h2>
            <table summary="お届け日" class="delivtable<!--{if $reg_get == 1}-->_reg<!--{/if}-->">
                <tbody>
                    <!--{if $reg_get != 1}-->
                    <tr>
                        <th class="deliv_time_inner">お届け日</th>
                        <td id="deliv_date_area">
                            ご指定いただけません
                        </td>
                    </tr>
                    <!--{else}-->
                        <tr class="delivname2">
                            <td colspan=2 class="day">初回お届け日：<span id="regular_cycle_first"></span></td>
                        </tr>
                        <tr>
                            <td colspan=2 class="day">2回目お届け日：<span id="regular_cycle_second"></span></td>
                        </tr>
                    <!--{/if}-->
                    <tr>
                        <th class="deliv_time_inner">お届け時間</th>
                        <td id="deliv_time_id_area">
                            ご指定いただけません
                        </td>
                    </tr>
                </tbody>
            </table>

                <h2 class="result">注文内容</h2>
                    <div class="totalarea">
                        <table id="totaltable">
                            <tbody>
                                <tr>
                                   <th>商品の小計</th>
                                   <td>
                                    <!--{if $reg_get == 1 && $regular_product.type == 1}-->
                                        &yen;&nbsp;<!--{$tpl_regular_add_price|string_format:"%d"|number_format|escape}-->
                                    <!--{else}-->
                                        &yen;&nbsp;<!--{$tpl_sub_total_pretax|string_format:"%d"|number_format|escape}-->
                                    <!--{/if}-->

                                    </td>
                                </tr>

                                <!--{foreach from=$tax_amount_list key="num" item="tax" name="tax_list"}-->
                                <tr>
                                    <th>(<!--{$tax.tax_type_name|escape}-->対象 : <!--{$tax.tax_rate|number_format|escape}-->%)</th>
                                    <td>
                                        &yen;&nbsp;<!--{$tax.amount|number_format|escape}-->
                                    </td>
                                </tr>
                                <!--{/foreach}-->
                                <!--{if $coupon_tr}-->
                                <tr>
                                   <th>クーポン適用</th>
                                   <td>-&yen;&nbsp;<!--{$coupon_tr|string_format:"%d"|number_format|escape}--></td>
                                </tr>
                                <!--{/if}-->
                                <!--{if $point_flg != 2 && $reg_get != 1 && !$use_code_coupon}-->
                                <tr>
                                    <th>値引き（ポイントご使用時）</th>
                                    <td><!--{assign var=discount value=`$arrData.use_point*$smarty.const.POINT_VALUE`}-->
                                    -&yen;&nbsp;<span id="discount_price"><!--{$discount|string_format:"%d"|number_format|default:0|escape}--></span></td>
                                </tr>
                                <!--{/if}-->
                                <!--{foreach from=$tax_amount_list key="num" item="tax" name="tax_list"}-->
                                <!--{if $tax.proration_price}-->
                                    <tr>
                                        <th>(<!--{$tax.tax_type_name|escape}-->対象割引後 : <!--{$tax.tax_rate|number_format|escape}-->%)</th>
                                        <td>
                                            &yen;&nbsp;<!--{$tax.proration_price|number_format|escape}-->
                                        </td>
                                    </tr>
                                <!--{/if}-->
                                <!--{/foreach}-->
                               <tr>
                                    <th>送料</th>
                                    <td>&yen;&nbsp;<span id="deliv_fee"><!--{$arrData.deliv_fee|string_format:"%d"|number_format|escape}--></span></td>
                                </tr>
                                <!--{foreach from=$sendingData key=k item=val }-->
                                    <tr>
                                        <th><!--{$val.service|escape}--></th>
                                        <td class="" id = "sending_data_<!--{$k|escape}-->">&yen;&nbsp;<!--{$val.cost|number_format|escape}--></td>
                                    </tr>
                                <!--{/foreach}-->
                                <tr>
                                    <th>離島手数料</th>
                                    <td>&yen;&nbsp;<span id="relay_fee"><!--{$arrData.relay_fee|string_format:"%d"|number_format|escape}--></span></td>
                                </tr>
                                <tr class="tprice">
                                    <th>ご請求額</th>
                                    <td><!--{if $reg_get == 1 && $regular_product.type == 1}-->
                                    <!--{math equation="a + b + c + d" a=$arrData.deliv_fee b=$tpl_regular_add_price c=$arrData.charge d=$arrData.relay_fee assign="totalview"}-->
                                    &yen;&nbsp;<span id="payment_total"><!--{$totalview|string_format:"%d"|number_format|escape}--></span>
                                    <!--{else}-->
                                        <!--{math equation="x + y" x=$arrData.payment_total y=$tpl_regular_add_price assign="totalview"}-->&yen;&nbsp;<span id="payment_total"><!--{$totalview|string_format:"%d"|number_format|escape}--></span>
                                    <!--{/if}--></td>
                                    <input type="hidden" value="<!--{$arrData.payment_total|escape}-->" id="payment_total_value">
                                </tr>
                            <!--{if $total_amount_flg && $regular_bind_on_flg}-->
                            <tr class="rprice">
                                <th>定期<!--{$regular_bind_count}-->回総合計</th>
                                <td>&yen;&nbsp;<!--{$total_amount|string_format:"%d"|number_format|escape}--></td>
                            </tr>
                            <!--{/if}-->
                            <!--{if $total_amount_flg}-->
                                <tr><td><!--{eval var=$regular_important_matter}--></td></tr>
                            <!--{/if}-->
                        </tbody>
                    </table>
                </div>


    <!--{if $point_flg != 2 && $reg_get != 1 && !$use_code_coupon && $customer}-->
        <h2 class="result">ポイント確認</h2>
    <div class="pointarea">
        <table id="pointtable">
            <tbody>
                <tr>
                    <th>ご注文前のポイント</th>
                    <td><!--{$tpl_user_point|string_format:"%d"|number_format|default:0|escape}-->Pt</td>
                </tr>
                <tr>
                    <th>ご使用ポイント</th>
                    <td>
                        <input type="text" name="use_point" value="0" id="use_point" />Pt
                        <input type="hidden" name="add_point" value="<!--{$arrData.add_point|default:0|escape}-->" id="add_point" />
                        <span class="attention" id="use_point_err"><!--{$arrErr.use_point|escape}--></span>
                    </td>
                </tr>
                <tr>
                    <th>今回加算されるポイント</th>
                    <td>+<!--{$arrData.add_point|string_format:"%d"|number_format|default:0|escape}-->Pt</td>
                </tr>
                <tr>
                    <th><!--{if $tpl_is_view_add_purchase_point_timing == true}--><!--{$tpl_add_purchase_point_timing_text|escape}--><!--{else}-->ご注文完了後<!--{/if}-->のポイント</th>
                    <!--{assign var=total_point value=`$tpl_user_point+$arrData.add_point`}-->
                    <td id="after_point"><!--{$total_point|string_format:"%d"|number_format|escape}-->Pt</td>
                </tr>
            </tbody>
        </table>
    </div>
    <!--{/if}-->


    <h2 class="result">注文の詳細</h2>
            <!--{section name=cnt loop=$arrProductsClass}-->
                    <div class="itemarea">
                        <div class="photoarea">
                            <img src="/resize_image.php?image=<!--{$arrProductsClass[cnt].main_list_image|escape}-->&amp;width=65&amp;height=65" alt="<!--{$arrProductsClass[cnt].name|escape}-->" />
                        </div>
                        <div class="itemtitle">
                            <!--{$arrProductsClass[cnt].name|escape}--><!--{if $reg_get == 1}-->(定期購入)<!--{/if}--><br />
                        </div>
                        <div class="itemdetail">
                            <!--{if $arrProductsClass[cnt].classcategory_name1 != ""}-->
                                <!--{$arrProductsClass[cnt].class_name1|escape}-->：<!--{$arrProductsClass[cnt].classcategory_name1|escape}--><br />
                            <!--{/if}-->
                            <!--{if $arrProductsClass[cnt].classcategory_name2 != ""}-->
                                <!--{$arrProductsClass[cnt].class_name2|escape}-->：<!--{$arrProductsClass[cnt].classcategory_name2|escape}-->
                            <!--{/if}-->
                            <!-- ▼規格3以上▼ -->
                                <!--{foreach from=$arrProductsClass[cnt].extra_classcategory key=key item=val}-->
                                    <li>
                                        <!--{$val.class_name|escape}-->：<!--{foreach from=$val.classcategory item=vval}--><!--{$vval|escape}--><!--{/foreach}-->
                                    </li>
                                <!--{/foreach}-->
                            <!-- ▲規格3以上▲ -->
                            <div class="count_down_box" id="count_down_<!--{$arrProductsClass[cnt].product_id|escape}-->" ></div>
                            <span class="pricearea">
                                <!--{if $reg_get == 1 && $regular_product.type == 1}-->
                                    &yen;&nbsp;<!--{$tpl_regular_add_price|string_format:"%d"|number_format|escape}-->
                                <!--{else}-->
                                    <!--{if $arrProductsClass[cnt].price02 != ""}-->
                                        &yen;&nbsp;<!--{$arrProductsClass[cnt]|@calc_tax_include_price:$arrInfo|number_format|escape}-->
                                    <!--{/if}-->
                                <!--{/if}-->
                            </span>
                            <span id="quantity">数量：<!--{$arrProductsClass[cnt].quantity|string_format:"%d"|number_format|escape}--></span>
                        </div>
                    </div>
            <!--{/section}-->
        <h2 class="result_ot">ご要望・お問い合わせ</h2>
                        <textarea name="message" cols="34" rows="8" class="inquiry"><!--{$arrForm[$key].value|escape}--></textarea><br>
                        <span class="attention"> （<!--{$smarty.const.LTEXT_LEN|escape}-->文字まで）</span>

            <div class="btn_next_p">
                <div class="comp_btn">注文を確定する</div>
                <div class="no_comp_btn">まだ注文を確定できません</div>
                <div class="alttxt">
                    <div class="altinner">
                        未確認項目があるため、まだ注文できません。<br>
                        <span class="bolye"><a href="#consentWidgetDiv">ページ上部の必須項目</a></span>をチェックしてください。
                    </div>
                </div>
            </div>
            <div class="under-amzbtn-wrap">
                <div class="comp_btn btn_next" style="display: none;"><a href="javascript:void(0);" onclick="AmazonPaySubmit('form1');">注文を確定する</a></div>
            </div>

        </div>
    </form>
            <div id="error_message_area"></div>
                <div class="backbtn">
                    <!--{if $lp_order}--><a href="./lp.php"><!--{else}--><a href="<!--{if $lp_order}-->./lp.php<!--{else}--><!--{$cart_url|escape}--><!--{/if}-->"><!--{/if}-->戻って修正する<input type="hidden" name="back03" id="back03" /></a>
                </div>
            </div>

<script type="text/javascript">
    $(document).ready(function() {
        // onAmazonPaymentsReadyまでマスク設置
        var mask = new ScreenMask($);
        mask.append();
    });

    window.onAmazonPaymentsReady = function() {
        $('#s_m').remove(); // マスク削除
        <!--{if $access_token}-->
        // onAmazonPaymentsReady後はaccess_tokenが取得できていないのでセット
        accessToken = '<!--{$access_token|escape:javascript}-->';
        <!--{/if}-->
        setAjaxUrl('<!--{$smarty.const.SSL_URL|escape:javascript}-->shopping/amazon_pay_ajax.php');
        setSellerId('<!--{$amazon_merchant_id|escape:javascript}-->');
        setRegularFlg(<!--{if $reg_get == 1}-->true<!--{else}-->false<!--{/if}-->);
        var reg_get_flg = <!--{if $reg_get == 1}-->1<!--{else}-->0<!--{/if}-->;

        if ($('#access_token').val()) {
            var accessToken = $('#access_token').val();
        }

        $('.wait_amazon_area').show();

        $('.cycle_type, #quick_flg_area').click(function(){
            showSubmit(1);
            getRegularDate($('.cycle_type:checked').val());
        });

        $('#c_agree').click(function(){
            showSubmit(reg_get_flg);
        });

        $('.cycle_select').change(function(){
            getRegularDate($(".cycle_type:checked").val());
        });

        <!--{* 定期のサイクルを非表示にする場合は、以下のコメントアウトを外してください(頭の//を消してください)  *}--> 
        //getRegularDate($(".cycle_type:checked").val());

        $('.customer_billing_agreement_ids').click(function(){
            setConsentFlg(false);
            $('#btn_next_area').show();
            $('#amazon_widget_area').hide();
            $('#re_billing_agreement_id').val($(this).val());
            getData(accessToken, reg_get_flg, $(this).val());
            showSubmit(reg_get_flg);
        });

        $('#new_billing_agreement_id').click(function(){
            $('.btn_next').hide(); // 一旦購入ボタン非表示
            $('#btn_next').hide(); // 非並列化Ver.のためにidにも対応
            $('#btn_next_p').show();
            $('#amazon_widget_area').show();
            $('#re_billing_agreement_id').val('');
            AmazonPaymentsAddressBook(accessToken, reg_get_flg, 0, true);
        });

        <!--{if $billing_agreement_ids}-->
            $('#c_agree').prop('checked', true); // ios対策
            $('#re_billing_agreement_id').val($('.customer_billing_agreement_ids:checked').val());
            getData(accessToken, reg_get_flg, $('#re_billing_agreement_id').val());
            showSubmit(reg_get_flg);
        <!--{else}-->
            AmazonPaymentsAddressBook(accessToken, reg_get_flg, 0, true);
        <!--{/if}-->
    }

    $(function(){
       // #で始まるアンカーをクリックした場合に処理
       $('a[href^=#]').click(function() {
          // スクロールの速度
          var speed = 400; // ミリ秒
          // アンカーの値取得
          var href= $(this).attr("href");
          // 移動先を取得
          var target = $(href == "#" || href == "" ? 'html' : href);
          // 移動先を数値で取得
          var position = target.offset().top;
          // スムーススクロール
          $('body,html').animate({scrollTop:position}, speed, 'swing');
          return false;
       });
    });
</script>

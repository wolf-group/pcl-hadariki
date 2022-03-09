<script type="text/javascript" src="/js/mask.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->" ></script>
<!--▼CONTENTS-->
<div id="shoppingcolumn">

    <!--Start Flow Area-->
    <div style="margin:0 auto; text-align:center;">
        <img src="<!--{$TPL_DIR|escape}-->img/shopping/lp_flow02.png" style="margin:0 auto;" />
    </div>
    <!--End Flow Area-->

    <!--{if $billing_agreement_ids}-->
    <div class="head">
        <h2 class="t_conf">配送先の選択</h2>
    </div>
    <table summary="配送先選択">
        <tr>
            <th width="100">選択</th>
            <th>配送先</th>
        </tr>
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
                <label for="new_billing_agreement_id">別のお届け先</label>
            </td>
        </tr>
    </table>
    <br />
    <!--{/if}-->
    <!--{if $error_message}--><span class="required"><!--{$error_message|escape}--></span><br /><!--{/if}-->
    <div id="amazon_widget_area" <!--{if $billing_agreement_ids}-->style="display:none;"<!--{/if}-->>
        <div id="amazonLoginButton" style="display:none;">
        </div>
        <!--{* アドレス帳 *}-->
        <div id="addressBookWidgetDiv" style="display: table-cell;"></div>
        <!--{* お支払い方法 *}-->
        <div id="walletWidgetDiv" style="display: table-cell;"></div>
        <!--{* Amazon Pay をお支払方法に設定する *}-->
        <div id="consentWidgetDiv"></div>
        <div class="red02" id="consentWidgetAlertDiv" style="display:none; font-weight:bold;">↑ご購入のためにチェックをお願いいたします(必須)</div>
    </div>

    <div class="head">
        <h2 class="t_conf">ご入力内容のご確認</h2>
    </div>

    <p class="pdtb10">下記ご注文内容で送信してもよろしいでしょうか？<br />
    よろしければ、一番下の「<!--{if $payment_type != ""}-->次へ<!--{else}-->注文を確定する<!--{/if}-->」ボタンをクリックしてください。</p>

    <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
        <input type="hidden" name="mode" value="confirm" />
        <input type="hidden" name="uniqid" id="uniqid" value="<!--{$tpl_uniqid|escape}-->" />
        <input type="hidden" name="re_billing_agreement_id" id="re_billing_agreement_id" value="" />
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$transactionid|escape}-->" />

        <table summary="ご注文内容確認">
            <tr>
                <th class="centertd">商品写真</th>
                <th class="centertd">商品名</th>
                <th class="centertd">単価</th>
                <th class="centertd">個数</th>
                <th class="centertd">返品特約</th>
                <th class="centertd">小計</th>
            </tr>
            <!--{section name=cnt loop=$arrProductsClass}-->
            <tr>
                <td class="phototd" width="20%">
                    <a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="win01('/products/detail_image.php?product_id=<!--{$arrProductsClass[cnt].product_id|escape}-->&amp;image=main_image','detail_image','<!--{$arrProductsClass[cnt].tpl_image_width|escape}-->','<!--{$arrProductsClass[cnt].tpl_image_height|escape}-->'); return false;" target="_blank">
                    <img src="/resize_image.php?image=<!--{$arrProductsClass[cnt].main_list_image|escape}-->&amp;width=65&amp;height=65" alt="<!--{$arrProductsClass[cnt].name|escape}-->" />
                    </a>
                </td>
                <td class="centertd" width="50%">
                    <ul>
                        <li><strong><!--{$arrProductsClass[cnt].name|escape}--></strong><!--{if $reg_get == 1}-->(定期購入)<!--{/if}--></li>
                        <!--{if $arrProductsClass[cnt].classcategory_name1 != ""}-->
                        <li><!--{$arrProductsClass[cnt].class_name1|escape}-->：<!--{$arrProductsClass[cnt].classcategory_name1|escape}--></li>
                        <!--{/if}-->
                        <!--{if $arrProductsClass[cnt].classcategory_name2 != ""}-->
                        <li><!--{$arrProductsClass[cnt].class_name2|escape}-->：<!--{$arrProductsClass[cnt].classcategory_name2|escape}--></li>
                        <!--{/if}-->
                        <!-- ▼規格3以上▼ -->
                        <!--{foreach from=$arrProductsClass[cnt].extra_classcategory key=key item=val}-->
                        <li>
                            <!--{$val.class_name|escape}-->：<!--{foreach from=$val.classcategory item=vval}--><!--{$vval|escape}--><!--{/foreach}-->
                        </li>
                        <!--{/foreach}-->
                        <!-- ▲規格3以上▲ -->
                    </ul>
                </td>
                <td class="centertd">
                    <!--{if $arrProductsClass[cnt].price02 != "" || strlen($arrProductsClass[cnt].price02)}-->
                        <!--{$arrProductsClass[cnt]|@calc_tax_include_price:$arrInfo|number_format|escape}-->円
                    <!--{/if}-->
                </td>
                <td class="centertd"><!--{$arrProductsClass[cnt].quantity|number_format|escape}-->個</td>
                <td align="right">
                    <!--{foreach from=$arrProductsClass[cnt].returning key="type" item="returning" name="returning"}-->
                        <!--{if $type == "img"}-->
                            <!--{foreach from=$returning key="cnt" item="returning_image" name="returning_image"}-->
                            <img src="/upload/save_image/<!--{$returning_image|escape}-->" /><br />
                            <!--{/foreach}-->
                        <!--{else}-->
                            <!--{foreach from=$returning key="cnt" item="returning_name" name="returning_name"}-->
                            <span style="color:#FF0000">[<!--{$returning_name|escape}-->]</span>
                            <!--{/foreach}-->
                        <!--{/if}-->
                    <!--{/foreach}-->
                </td>
                <td class="pricetd"><!--{$arrProductsClass[cnt].total_pretax|number_format|escape}-->円</td>
            </tr>
            <!--{/section}-->

            <!--{if $coupon_tr}-->
            <tr class="qponbg">
                <td colspan="5" class="righttd">クーポン適用</td>
                <td align="right"><span class="qpon_pr">-<!--{$coupon_tr|number_format|escape}-->円</span></td>
            </tr>
            <!--{/if}-->
            <tr>
                <td colspan="5" class="righttd">小計</td>
                <td class="pricetd"><span id="subtotal"><!--{$tpl_total_pretax|number_format|escape}--></span>円</td>
            </tr>
            <!--{foreach from=$tax_amount_list key="num" item="tax" name="tax_list"}-->
            <tr>
                <td colspan="5" class="righttd"><!--{$tax.tax_type_name|escape}-->対象(<!--{$tax.tax_rate|number_format|escape}-->%)</td>
                <td class="pricetd"><!--{$tax.amount|number_format|escape}-->円</td>
            </tr>
            <!--{/foreach}-->
            <!--{if $point_flg != 2 && $reg_get != 1 && !$use_code_coupon}-->
            <tr>
                <td colspan="5" class="righttd">値引き（ポイントご使用時）</td>
                <td class="pricetd">
                    <!--{assign var=discount value=`$arrData.use_point*$smarty.const.POINT_VALUE`}-->
                    -<span id="discount_price"><!--{$discount|number_format|default:0|escape}--></span>円
                </td>
            </tr>
            <!--{/if}-->
            <!--{foreach from=$tax_amount_list key="num" item="tax" name="tax_list"}-->
            <!--{if $tax.proration_price}-->
                <tr>
                    <td colspan="5" class="righttd"><!--{$tax.tax_type_name|escape}-->対象割引後(<!--{$tax.tax_rate|number_format|escape}-->%)</td>
                    <td class="pricetd"><!--{$tax.proration_price|number_format|escape}-->円</td>
                </tr>
            <!--{/if}-->
            <!--{/foreach}-->
            <tr>
                <td colspan="5" class="righttd">送料</td>
                <td class="pricetd"><span id="deliv_fee"></span>円</td>
            </tr>
            <!--{if $sendingData}-->
                <!--{foreach from=$sendingData key=k item=val }-->
                    <tr>
                        <td colspan="5" class="righttd"><!--{$val.service|escape}--></td>
                        <td class="pricetd" id = "sending_data_<!--{$k|escape}-->"><!--{$val.cost|number_format|escape}-->円</td>
                    </tr>
                <!--{/foreach}-->
            <!--{/if}-->
            <tr id="relay_fee_tr" style="display:none;">
                <td colspan="5" class="righttd">離島手数料</td>
                <td class="pricetd"><span id="relay_fee"></span>円</td>
            </tr>
            <tr class="totalbg">
                <td colspan="5" class="righttd">合計</td>
                <td class="pricetd">
                    <span class="price" id="payment_total"><!--{$arrData.payment_total|number_format|escape}--></span>円
                    <input type="hidden" value="<!--{$arrData.payment_total|escape}-->" id="payment_total_value">
                </td>
            </tr>
            <!--{if $total_amount_flg && $regular_bind_on_flg}-->
            <tr class="totalreg">
                <td colspan="5" class="bdnone">定期<!--{$regular_bind_count|escape}-->回総合計</td>
                <td class="pricetd"><span class="reg_price"><!--{$total_amount|number_format|escape}-->円</span></td>
            </tr>
            <!--{/if}-->
        </table>
        <!--{if $total_amount_flg}-->
        <div class="reg_memo">
            <p><!--{eval var=$regular_important_matter}--></p>
        </div>
        <!--{/if}-->

        <!--{* ログイン済みの会員のみ *}-->
        <!--{if $point_flg != 2 && $reg_get != 1 && !$use_code_coupon && $customer}-->
        <table summary="ポイント確認" class="delivname">
            <tr>
                <th width="50%">ご注文前のポイント</th>
                <td><!--{$tpl_user_point|number_format|default:0|escape}-->Pt</td>
            </tr>
            <tr>
                <th>ご使用ポイント</th>
                <td>
                    <input type="text" name="use_point" value="0" id="use_point" />Pt
                    <input type="hidden" name="add_point" value="<!--{$arrData.add_point|default:0|escape}-->" id="add_point" />
                    <span class="attention" id="use_point_err"><!--{$arrErr.use_point}--></span>
                </td>
            </tr>
            <!--{if $arrData.birth_point > 0}-->
            <tr>
                <th>お誕生月ポイント</th>
                <th>+<!--{$arrData.birth_point|number_format|default:0|escape}-->Pt</td>
            </tr>
            <!--{/if}-->
            <tr>
                <th>今回加算されるポイント</th>
                <td>
                +<!--{$arrData.add_point|number_format|default:0|escape}-->Pt
                <!--{if $coupon_reward_point}--> +<!--{$coupon_reward_point|number_format|escape}-->Pt(クーポン分)<!--{/if}-->
                </td>
            </tr>
            <tr>
                <th>
                    <!--{if $tpl_is_view_add_purchase_point_timing == true}-->
                        <!--{$tpl_add_purchase_point_timing_text|escape}-->のポイント
                    <!--{else}-->
                        ご注文完了後のポイント
                    <!--{/if}-->
                </th>
                <!--{assign var=total_point value=`$tpl_user_point+$arrData.add_point`}-->
                <td id="after_point"><!--{$total_point|number_format|escape}-->Pt</td>
            </tr>
        </table>
        <!--{/if}-->

        <div class="cf_ttl" style="margin-top:10px;" >▼お届け先情報</div>
        <table summary="ご注文者様情報" class="delivname" style="margin:0;">
            <tbody>
                <tr>
                    <th width="192">お名前</th>
                    <!--{if $amazon_user_name_modification_flg == 1}-->
                    <td>
                        <input type="text" name="deliv_name01" id="deliv_name01" value="<!--{$customer|@null_coalescing:"name01"|escape}-->" />
                        <input type="text" name="deliv_name02" id="deliv_name02" value="<!--{$customer|@null_coalescing:"name02"|escape}-->" />
                        <!--{if $arrErr.deliv_name01}-->
                        <br /><span class="required"><!--{$arrErr.deliv_name01|escape}--></span>
                        <!--{/if}-->
                        <!--{if $arrErr.deliv_name02}-->
                        <br /><span class="required"><!--{$arrErr.deliv_name02|escape}--></span>
                        <!--{/if}-->
                    </td>
                    <!--{else}-->
                    <td id="order_name"><!--{$customer|@null_coalescing:"name01"|escape}--><!--{$customer|@null_coalescing:"name02"|escape}--></td>
                    <!--{/if}-->
                </tr>
                <!--{if $amazon_user_name_modification_flg == 1}-->
                <tr>
                    <th>お名前（フリガナ）</th>
                    <td>
                        <input type="text" name="deliv_kana01" id="deliv_kana01" value="<!--{$customer|@null_coalescing:"kana01"|escape}-->" />
                        <input type="text" name="deliv_kana02" id="deliv_kana02" value="<!--{$customer|@null_coalescing:"kana02"|escape}-->" />
                        <!--{if $arrErr.deliv_kana01}-->
                        <br /><span class="required"><!--{$arrErr.deliv_kana01|escape}--></span>
                        <!--{/if}-->
                        <!--{if $arrErr.deliv_kana02}-->
                        <br /><span class="required"><!--{$arrErr.deliv_kana02|escape}--></span>
                        <!--{/if}-->
                    </td>
                </tr>
                <!--{/if}-->
                <tr>
                    <th>郵便番号</th>
                    <td id="order_zip"><!--{$customer|@null_coalescing:"zip01"|escape}--><!--{$customer|@null_coalescing:"zip02"|escape}--></td>
                </tr>
                <tr>
                    <th>住所</th>
<!--{assign var=customer_pref value=$customer|@null_coalescing:"pref"}-->
                    <td id="order_addr"><!--{$arrPref|@null_coalescing:$customer_pref|escape}--><!--{$customer|@null_coalescing:"addr01"|escape}--><!--{$customer|@null_coalescing:"addr02"|escape}--></td>
                </tr>
                <tr>
                    <th>電話番号</th>
                    <td id="order_tel"><!--{$customer|@null_coalescing:"tel01"|escape}-->-<!--{$customer|@null_coalescing:"tel02"|escape}-->-<!--{$customer|@null_coalescing:"tel03"|escape}--></td>
                </tr>
            </tbody>
        </table>
        <!--ご注文者様情報ここまで-->

        <div class="cf_ttl" style="margin-top:30px;">▼お届け時間の指定・その他お問い合わせ</div>

        <table summary="お届け時間の指定・その他お問い合わせ" class="delivname wait_amazon_area" style="display:none;">
            <tbody>
                <!--{if $reg_get == 1}-->
                <tr><!--{* サイクル表示したくない場合は左の<tr>を<tr style="display:none;">に変更してください *}-->
                    <td colspan="2">
                        <p class="txt_sz">▼&nbsp;毎月のお届け間隔を以下のパターンから選択して下さい。</p>
                    </td>
                </tr>
                <tr><!--{* サイクル表示したくない場合は左の<tr>を<tr style="display:none;">に変更してください *}-->
                    <td colspan="2">
                    <!--{assign var=key1 value="cycle_date:monthly"}-->
                    <!--{assign var=key2 value="cycle_date:day"}-->
                    <!--{if $regular_cycle.$key1 && $regular_cycle.$key2}-->
                    <div class="t_daybox">
                        <label><input type="radio" name="cycle_type" class="cycle_type" id="cycle_type1" value="1" <!--{if $arrForm.cycle_type == 1}-->checked="checked"<!--{/if}-->>日付で指定</label><br />
                        <div class="custom-selectbox w10">
                            <select name="cycle_date_monthly" class="cycle_select" id="cycle_date_monthly">
                                <!--{foreach from=$regular_cycle.$key1 key=key item=val}-->
                                <option value="<!--{$val|escape}-->" <!--{if $arrForm.cycle_date_monthly == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_monthly.$val|escape}--></option>
                                <!--{/foreach}-->
                            </select>
                        </div>
                        <div class="custom-selectbox w10">
                            <select name="cycle_date_day" class="cycle_select" id="cycle_date_day">
                                <!--{foreach from=$regular_cycle.$key2 key=key item=val}-->
                                <option value="<!--{$val|escape}-->" <!--{if $arrForm.cycle_date_day == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_date_day.$val|escape}--></option>
                                <!--{/foreach}-->
                            </select>
                        </div>
                        <span class="mgt15">にお届け</span>
                    </div>
                    <!--{/if}-->
                    <!--{assign var=key1 value="cycle_week:monthly"}-->
                    <!--{assign var=key2 value="cycle_week:ordinal"}-->
                    <!--{assign var=key3 value="cycle_week:week"}-->
                    <!--{if $regular_cycle.$key1 && $regular_cycle.$key2 && $regular_cycle.$key3}-->
                    <div class="t_daybox">
                        <label><input type="radio" name="cycle_type" class="cycle_type" id="cycle_type2" value="2" <!--{if $arrForm.cycle_type == 2}-->checked="checked"<!--{/if}-->>曜日で指定</label><br />
                        <div class="custom-selectbox w10">
                            <select name="cycle_week_monthly" class="cycle_select" id="cycle_week_monthly">
                                <!--{foreach from=$regular_cycle.$key1 key=key item=val}-->
                                <option value="<!--{$val|escape}-->" <!--{if $arrForm.cycle_week_monthly == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_monthly.$val|escape}--></option>
                            <!--{/foreach}-->
                            </select>
                        </div>
                        <div class="custom-selectbox w10">
                            <select name="cycle_week_ordinal" class="cycle_select" id="cycle_week_ordinal">
                                <!--{foreach from=$regular_cycle.$key2 key=key item=val}-->
                                <option value="<!--{$val|escape}-->" <!--{if $arrForm.cycle_week_ordinal == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_week_ordinal.$val|escape}--></option>
                                <!--{/foreach}-->
                            </select>
                        </div>
                        <div class="custom-selectbox w10">
                            <select name="cycle_week_week" class="cycle_select" id="cycle_week_week">
                                <!--{foreach from=$regular_cycle.$key3 key=key item=val}-->
                                <option value="<!--{$val|escape}-->" <!--{if $arrForm.cycle_week_week == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_week.$val|escape}--></option>
                                <!--{/foreach}-->
                            </select>
                        </div>
                        <span class="mgt15">にお届け</span>
                    </div>
                    <!--{/if}-->
                    <!--{assign var=key1 value="cycle_interval:interval"}-->
                    <!--{if $regular_cycle.$key1}-->
                    <div class="t_daybox">
                        <label><input type="radio" name="cycle_type" class="cycle_type" id="cycle_type3" value="3" <!--{if $arrForm.cycle_type == 3}-->checked="checked"<!--{/if}-->>間隔で指定</label><br />

                        <div id="cycle_interval_start_date_area">
                            <span class="mgt15" style="margin-right:10px;">初回お届け日</span>
                            <div class="custom-selectbox w20">
                                <select name="cycle_interval_start_date" class="cycle_select" id="cycle_interval_start_date">
                                    <!--{section name=cnt start=0 loop=$regular_config.interval_range}-->
                                    <!--{assign var=time_ts value="+`$smarty.section.cnt.index` day"|strtotime:$regular_config.allowed_first_interval_date_ts}-->
                                    <!--{assign var=time value=$time_ts|date_format:"%Y-%m-%d"}-->
                                    <option value="<!--{$time|escape}-->" <!--{if $arrForm.cycle_interval_start_date == $time}-->selected="selected"<!--{/if}-->><!--{$time_ts|date_format:"%Y年%m月%d日"|escape}--></option>
                                    <!--{/section}-->
                                </select>
                            </div>
                            <input type="hidden" name="cycle_interval_start_date_dummy" id="cycle_interval_start_date_dummy" value="" >
                            <span class="mgt15">から</span>
                            <div class="custom-selectbox w10">
                                <select name="cycle_interval_interval" class="cycle_select" id="cycle_interval_interval">
                                    <!--{foreach from=$regular_cycle.$key1 key=key item=val}-->
                                    <option value="<!--{$val|escape}-->" <!--{if $arrForm.cycle_interval_interval == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_interval.$val|escape}--></option>
                                    <!--{/foreach}-->
                                </select>
                            </div>
                            <span class="mgt15">間隔でお届け</span>
                        </div>
                    </div>
                    <!--{/if}-->
                    </td>
                </tr>
                <tr><!--{* 初回即時、もしくは初回最短機能を使いたいが、チェックボックスを表示したくない場合、下記 <td class="no_bdr no_pd">を<td class="no_bdr no_pd" style="display:none;">に変更してください *}-->
                    <td class="no_bdr no_pd">
                        <!--{*
                        === 初回即時で最初からチェックを入れた状態にしたい場合 ===
                        inputタグ内に checked="checked" を追記してください
                        <input type="checkbox" name="first_quick_flg" id="first_quick_flg" value="1" />
                        ↓
                        <input type="checkbox" name="first_quick_flg" id="first_quick_flg" value="1" checked="checked" />
                        *}-->

                        <!--{if $first_auto}-->
                        <span class="delive_shortbt">
                            <label id="quick_flg_area"><input type="checkbox" name="first_quick_flg" id="first_quick_flg" value="1" />初回は最短でお届け希望</label>
                        </span>
                        <!--{else}-->
                        <span class="delive_shortbt">
                            <label id="quick_flg_area"><input type="checkbox" name="quick_flg" id="quick_flg" value="1" />初回は最短でお届け希望</label>
                        </span>
                        <!--{/if}-->
                    </td>
                </tr>
                <tr>
                    <th>お届け日</th>
                    <td>
                        初回 : <span id="regular_cycle_first"></span><br />
                        二回 : <span id="regular_cycle_second"></span>
                    </td>
                </tr>
                <!--{else}-->
                <tr>
                    <th>お届け希望日</th>
                    <td id="deliv_date_area">
                        ご指定いただけません
                    </td>
                </tr>
                <!--{/if}-->
                <tr>
                    <th>お届け時間</th>
                    <td id="deliv_time_id_area">
                        ご指定いただけません
                    </td>
                </tr>


                <tr>
                    <th>お問い合わせ</th>
                    <td>
                        <textarea name="message" cols="80" rows="8" placeholder="ご質問、ご要望などございましたらご自由にご入力ください。" style="width:700px;"></textarea>
                        <p class="pdt5 attention">(<!--{$smarty.const.LTEXT_LEN|escape}-->文字まで)</p>
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <!--{* 非会員なら登録させます *}-->
        <div class="wait_amazon_area" style="display:none;">
            <!--{if !$customer}-->
            <label for="agree">
                <input type="checkbox" name="agree" value="1" id="c_agree" />
                <span><a href="/entry/kiyaku_popup.php" id="rule_text_link" target="n">利用規約</a>に同意して会員登録する<span style="color:red; font-weight:bold;">(必須)</span></span>
            </label>
            <br />
            <label for="mailmaga_flg">
                <input type="checkbox" name="mailmaga_flg" id="mailmaga_flg" value="1" />お得な情報を受け取る
            </label>
            <!--{else}-->
                <input type="checkbox" name="agree" value="1" id="c_agree" checked="checked" style="display:none;" />
            <!--{/if}-->
        </div>

        <div style="color:red; text-align: center; font-weight:bold;" id="btn_next_p" class="btn_next_p">
        ↑未確認項目があるため、まだ注文できません。<br />
        入力フォームをご確認ください。
        </div>


        <div id="error_message_area"></div>

        <div class="tblareabtn">
            <div class="btn_rpst1">
                <span class="btn_prev"><a href="<!--{if $lp_order}-->./lp.php<!--{else}--><!--{$cart_url|escape}--><!--{/if}-->">前のページへ戻る<input type="hidden" name="back03" id="back03" /></a></span>
            </div>
            <div class="btn_rpst2" id="btn_next_area">
                <span class="btn_next" id="btn_next" onclick="AmazonPaySubmit('form1');" style="display:none;">
                    <a href="javascript:void(0);">注文を確定する<input type="hidden" name="next" id="next" /></a>
                </span>
            </div>
        </div>
    </form>
</div>
<!--▲CONTENTS-->

<script type="text/javascript">
    $(document).ready(function() {
        // onAmazonPaymentsReadyまでマスク設置
        var mask = new ScreenMask($);
        if (!$('body').hasClass('amazonpay_payments_ready')) {
            mask.append();
        }
    });

    window.onAmazonPaymentsReady = function() {
        $('body').addClass('amazonpay_payments_ready');
        $('#s_m').remove(); // マスク削除
        <!--{if $access_token}-->
            var token = '<!--{$access_token|escape:javascript}-->';
        <!--{else}-->
            var token = getParam('access_token');
        <!--{/if}-->
        var reg_get_flg = <!--{if $reg_get == 1}-->1<!--{else}-->0<!--{/if}-->;

        setRegularFlg(<!--{if $reg_get == 1}-->true<!--{else}-->false<!--{/if}-->);

        setAjaxUrl('<!--{$smarty.const.SSL_URL|escape:javascript}-->shopping/amazon_pay_ajax.php');
        setSellerId('<!--{$amazon_merchant_id|escape:javascript}-->');

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
            $('#amazon_widget_area').hide();
            $('#re_billing_agreement_id').val($(this).val());
            getData(token, reg_get_flg, $(this).val());
            showSubmit(reg_get_flg);
        });

        $('#new_billing_agreement_id').click(function(){
            $('.btn_next').hide(); // 一旦購入ボタン非表示
            $('#btn_next').hide(); // 非並列化Ver.のためにidにも対応
            $('#btn_next_p').show();
            $('#amazon_widget_area').show();
            $('#re_billing_agreement_id').val('');
            AmazonPaymentsAddressBook(token, reg_get_flg, 0, false);
        });

        <!--{if $billing_agreement_ids}-->
            $('#re_billing_agreement_id').val($('.customer_billing_agreement_ids:checked').val());
            getData(token, reg_get_flg, $('#re_billing_agreement_id').val());
            showSubmit(reg_get_flg);
        <!--{else}-->
            AmazonPaymentsAddressBook(token, reg_get_flg, 0, false);
        <!--{/if}-->
    }
</script>

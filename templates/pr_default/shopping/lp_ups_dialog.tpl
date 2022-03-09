<!--ダイアログ-->
<div class="none_area ups_dialog" id="lpshoppingcolumn" title="確認">
    <form name="ups_dialog_form" id="ups_dialog_form" method="post" action="/shopping/lp.php" data-allow_credit="0">
        <div class="products_dt">
            <table>
                <tr>
                    <td>
                        <h3 class="no_bdr">商品</h3>
                        <div class="w98">
                            <input id="product_id" name="product_id" type="hidden" value="<!--{$tups|escape}-->">
                            <p class="product_name">商品名</p>
                        </div>
                    </td>
                    <!--{* 数量は適宜編集してください。*}-->
                    <td>
                        <h3 class="no_bdr">数量</h3>
                        <div class="custom-select w100">
                            <select id="quantity" name="quantity">
                                <!--{assign var=key1 value="quantity"}-->
                                <option value="1"<!--{if $arrForm[$key1] == "1"}--> selected="selected"<!--{/if}-->>1</option>
                                <option value="2"<!--{if $arrForm[$key1] == "2"}--> selected="selected"<!--{/if}-->>2</option>
                                <option value="3"<!--{if $arrForm[$key1] == "3"}--> selected="selected"<!--{/if}-->>3</option>
                                <option value="4"<!--{if $arrForm[$key1] == "4"}--> selected="selected"<!--{/if}-->>4</option>
                                <option value="5"<!--{if $arrForm[$key1] == "5"}--> selected="selected"<!--{/if}-->>5</option>
                                <option value="6"<!--{if $arrForm[$key1] == "6"}--> selected="selected"<!--{/if}-->>6</option>
                                <option value="7"<!--{if $arrForm[$key1] == "7"}--> selected="selected"<!--{/if}-->>7</option>
                                <option value="8"<!--{if $arrForm[$key1] == "8"}--> selected="selected"<!--{/if}-->>8</option>
                                <option value="9"<!--{if $arrForm[$key1] == "9"}--> selected="selected"<!--{/if}-->>9</option>
                                <option value="10"<!--{if $arrForm[$key1] == "10"}--> selected="selected"<!--{/if}-->>10</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="class_category" style="display:none;">
                        <!--{* 各規格 商品を選択すると、自動的に表示されます。 *}-->
                        <!--{* ↓このdiv内に規格用のセレクトボックスが表示されます↓ *}-->
                        <div class="lp-classcategory" id="class_category_select"></div>
                        <!--{* ↑このdiv内に規格用のセレクトボックスが表示されます↑ *}-->
                    </td>
                </tr>
            </table>
        </div>

        <!-- AJAX追加 -->
        <!--{* お支払方法は、商品選択されると表示されます *}-->
        <div id="payment_area" style="display:none;">
            <!--{* ↓このspan内にお支払方法のラジオボタン群が表示されます↓ *}-->
            <span id="payment_methods"></span>
            <!--{* ↑このspan内にお支払方法のラジオボタン群が表示されます↑ *}-->
            <div><h3 class="pdt20">お支払方法</h3></div>
            <table>
                <input id="payment_id_hidden" name="payment_id" type="hidden" value="">
                <td><p id="payment_txt"></p></td>
                <td>
                    <!--{* 同一のお支払方法が設定できる商品で、お支払い方法を変更したい場合はLP画面に遷移します *}-->
                    <div>
                        <!--{* <!--{$lp_page|escape}--> は元々アクセスしていたLP 必要があればアップセル対象のLPキーに変更してください *}-->
                        <button type="button" class="cng_payment_link" data-href="lp.php?up=<!--{$tups|escape}-->&p=<!--{$lp_page|escape}-->&scroll=#payment_area"><p>お支払方法を変更する</p></button>
                    </div>
                </td>
            </table>
            <div id="regular_attention_area" style="border-bottom-style: none; padding-top: 10px;<!--{if !$regular_product }--> display: none;<!--{/if}-->">
                <span class="attention1">※定期購入の場合、自動的にカード登録処理が実行されます。</span>
            </div>
        </div>

        <!--{* LP画面で使用していたPOST値をセット *}-->
        <div id="lp_post_hidden" style="display:none;">
        <!--{foreach from=$lp_post key=key item=val}-->
            <!--{if $key == 'payment_id'}-->
                <input type="hidden" name="payment_id" class="payment_id_h" value="<!--{$val|escape}-->" />
                <input type="hidden" name="payment_id_selected" class="payment_id_selected" value="<!--{$val|escape}-->" />
            <!--{else}-->
                <input type="hidden" name="<!--{$key|escape}-->" value="<!--{$val|escape}-->" />
            <!--{/if}-->
        <!--{/foreach}-->
        </div>

        <!--{* 汎用決済用クレジットカードフォーム一括出力 *}-->
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

        <div class="delivery_calendar" id="regular-deliv_area" style="display:none;">
            <!--{* ↓定期配送間隔がこちらに表示されます↓ *}-->
            <span id="regular_cycle_area"></span>
            <!--{* ↑定期配送間隔がこちらに表示されます↑ *}-->
        </div>
        <div id="deliv_datetime_area"><div id="deliv_time_area"></div></div>

        <!--{* 切り取り挿入部分 *}-->
        <!--{if $isSmpAgent}-->
            <input type="hidden" name="ajax_url" id="ajax_url" value="/smp/shopping/lp_ajax.php?p=<!--{$lp_page|escape}-->" />
        <!--{else}-->
            <input type="hidden" name="ajax_url" id="ajax_url" value="/shopping/lp_ajax.php?p=<!--{$lp_page|escape}-->" />
        <!--{/if}-->

        <img src="<!--{$TPL_DIR|escape}-->img/common/lp_step.png" alt="LPのステップ" class="lp_submit_area" style="margin-left:auto; margin-right:auto; display:none;" />
        <ul class="lp_submit_area">
            <li class="lp-error lp-confirm" id="alert_errors" <!--{if !$arrErr}-->style="display:none;"<!--{/if}-->>
            <!--{if $arrErr}-->
                <!--{foreach from=$arrErr key=key item=item}-->
                    <!--{$item}--><br/>
                <!--{/foreach}-->
            <!--{/if}-->
            </li>
            <!-- li><a class="lp_button_submit" href="javascript:void(0);" id="confirm_submit" onclick="return false;">&nbsp;</a></li -->
            <li id="confirm_submit" style="display:none;">
                <input type="button" name="" value="購入確認画面へ" id="confirm_submit_image" onclick="return false;" style="outline:none;"/>
            </li>
        </ul>
    </form>
    <div id="paygent_credit_type" style="display:none;" data-is_paygent_credit_regular="<!--{if $is_paygent_credit_regular}-->1<!--{else}-->0<!--{/if}-->" data-is_paygent_credit_normal="<!--{if $is_paygent_credit_normal}-->1<!--{else}-->0<!--{/if}-->"></div>
    <div id="payment_type" style="display:none;" data-is_credit="<!--{if $is_credit}-->1<!--{else}-->0<!--{/if}-->"></div>
    <div id="product_type" style="display:none;" data-is_regular="<!--{if $lp_post.no_regular == "0"}-->1<!--{else}-->0<!--{/if}-->"></div>
</div>

<script type="text/javascript" src="/js/lp.compress.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->"></script>
<link rel="stylesheet" href="<!--{$TPL_DIR}-->css/lp.css?<!--{$smarty.const.FRONT_CSS_VERSION|escape}-->" type="text/css" media="all" />

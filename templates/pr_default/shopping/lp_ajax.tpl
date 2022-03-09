<!--{* 各タグのid要素を削除したり、変更したりすると動作しなくなります。 *}-->

<!--{* 規格 *}-->
<!--{if $type == 1 && $class_name1}-->
    <!--{if $class_name2}-->
    <script type="text/javascript">//<![CDATA[
    <!--{$tpl_javascript}-->
    </script>
    <!--{/if}-->
    <div class="lpclcategory_boxl">
        <dl>
            <!--{* 規格1 *}-->
            <dt><!--{$class_name1}--></dt>
            <dd>
                <div class="custom-select2 w100">
                  <select name="classcategory_id1" id="classcategory_id1">
                      <option value="">選択してください</option>
                      <!--{html_options options=$arrClassCat1 selected=$arrForm.classcategory_id1}-->
                  </select>
                </div>
                <p class="attention"><!--{$arrErr.classcategory_id1}--></p>
            </dd>
            <dt>
                <!--{* 規格2 *}-->
                <!--{if $class_name2}-->
                <!--{$class_name2}-->
            </dt>
            <dd>
                <div class="custom-select2 w100">
                  <select name="classcategory_id2" id="classcategory_id2">
                      <option value="">選択してください</option>
                      <!--{html_options options=$arrClassCat2 selected=$arrForm.classcategory_id2}-->
                  </select>
                </div>
                <p class="attention"><!--{$arrErr.classcategory_id2}--></p>
                <!--{/if}-->
            </dd>
        </dl>
    </div>
    <div class="lpclcategory_boxr">
         <dl>
           <!--{* 規格3以上 *}-->
           <!--{if $pcc_list_extra}-->
            <span class="classcategory_extra">
            <!--{foreach from=$pcc_list_extra item=item key=key}-->
                <dt>
                    <!--{$item.class_name|escape}-->
                    <!--{assign var="classcategory_id" value="classcategory_id`$key`"}-->
                </dt>
                <dd>
                    <div class="custom-select2 w100">
                      <select name="classcategory_id<!--{$key}-->" id="classcategory_id<!--{$key}-->>">
                          <option value="">選択してください</option>
                          <!--{html_options options=$item.classcategory selected=$arrForm.$classcategory_id}-->
                      </select>
                    </div>
                    <p class="attention"><!--{$arrErr[$classcategory_id]}--></p>
                </dd>
            <!--{/foreach}-->
            </span>
            <!--{/if}-->
          </dl>
    </div>
<!--{/if}-->

<!--{* 決済方法 *}-->
<!--{if $type == 3 && $arrPayment}-->

<!--{* 支払方法をラジオボタンで表示する際はisRadioButtonPaymentのvalueをtrue、プルダウンで表示する際はfalseにしてください *}-->
<!--{assign var="isRadioButtonPayment" value=false}-->

<!--{if $isRadioButtonPayment == true}-->
<!--{* お支払方法ラジオボタンエリア開始 *}-->
<div><h3 class="pdt20">お支払方法</h3></div>
<table summary="お支払方法選択">
    <!--<tr>
        <th width="30"></th>
        <th<!--{if $img_exist_flg}--> colspan="2"<!--{/if}-->>お支払方法</th>
    </tr>-->
    <!--{section name=cnt loop=$arrPayment}-->
    <tr class="<!--{if $arrPayment[cnt].payment_normal == true}-->payment_normal <!--{/if}--><!--{if $arrPayment[cnt].payment_reg == true}-->payment_reg <!--{/if}--><!--{if $arrPayment[cnt].payment_deliv == true}-->payment_deliv<!--{/if}-->">
    	<td>
            <div style="padding-left:10px;">
                <input type="radio" id="pay_<!--{$smarty.section.cnt.iteration}-->" class="radio_payment_id" name="payment_id" value="<!--{$arrPayment[cnt].payment_id}-->" <!--{$arrPayment[cnt].payment_id|sfGetChecked:$arrForm.payment_id}--> />
                <label for="pay_<!--{$smarty.section.cnt.iteration}-->" style="width:100%;height:100%;"><!--{$arrPayment[cnt].payment_method|escape}--><!--{if $arrPayment[cnt].note != ""}--><!--{/if}--></label>
                <br />
                <p><em>
                    <!--{if $arrPayment[cnt].payment_affairs_regular}-->
                        <!--{$arrPayment[cnt].payment_affairs_regular|escape|nl2br}-->
                    <!--{else}-->
                        <!--{$arrPayment[cnt].payment_affairs|escape|nl2br}-->
                    <!--{/if}-->
                </em></p>
            </div>
        </td>
        <!--{if $img_exist_flg}-->
        <!--{if $arrPayment[cnt].payment_image != ""}-->
        <td>
            <img src="<!--{$smarty.const.IMAGE_SAVE_URL}--><!--{$arrPayment[cnt].payment_image}-->" />
        </td>
        <!--{else}-->
        <td>&nbsp;</td>
        <!--{/if}-->
    <!--{/if}-->
    </tr>
    <tr class="payment_tr" id="payment_tr_<!--{$arrPayment[cnt].payment_id}-->" style="display:none;"><td class="payment_detail_area" id="payment_detail_area_<!--{$arrPayment[cnt].payment_id}-->" colspan="2"></td></tr>
    <!--{/section}-->
</table>
<p class="attention"><!--{$arrErr.payment_id}--></p>
<!--{* お支払方法ラジオボタンエリア終了 *}-->
<!--{else}-->
<!--{* お支払方法プルダウンエリア開始 *}-->
<div><h3 class="pdt20">お支払方法</h3></div>
<table>
    <tr>
        <div class="custom-select w80 mgt20">
        <select name="payment_id" id="payment_id" class="lpinput">
            <option name="payment_id" value="">選択してください</option>
            <!--{section name=cnt loop=$arrPayment}-->
            <option name="payment_id"
                value="<!--{$arrPayment[cnt].payment_id}-->"
                <!--{$arrPayment[cnt].payment_id|sfGetSelected:$arrForm.payment_id}-->
                class="select_payment_id <!--{if $arrPayment[cnt].payment_normal == true}-->payment_normal <!--{/if}--><!--{if $arrPayment[cnt].payment_reg    == true}-->payment_reg <!--{/if}--><!--{if $arrPayment[cnt].payment_deliv    == true}-->payment_deliv<!--{/if}-->"><!--{$arrPayment[cnt].payment_method|escape}--></option>
            <!--{/section}-->
        </select>
        </div>
    </tr>
    <!--{section name=cnt loop=$arrPayment}-->
    <tr style="display:none" id="payment_affair_<!--{$arrPayment[cnt].payment_id}-->" class="payment_affair">
        <!--{* 選択された支払方法の説明を表示 *}-->
        <td>
            <div style="padding-left:10px;">
                <em class="payment_reg payment_normal">
                    <p style="padding-top:20px;">
                    <!--{if $arrPayment[cnt].payment_affairs_regular}-->
                        <!--{$arrPayment[cnt].payment_affairs_regular|escape|nl2br}-->
                    <!--{else}-->
                        <!--{$arrPayment[cnt].payment_affairs|escape|nl2br}-->
                    <!--{/if}-->
                    </p>
                </em>
            </div>
        </td>
        <!--{* 選択された支払方法の画像を表示 *}-->
        <!--{if $img_exist_flg}-->
        <!--{if $arrPayment[cnt].payment_image != ""}-->
        <td>
            <img src="<!--{$smarty.const.IMAGE_SAVE_URL}--><!--{$arrPayment[cnt].payment_image}-->" />
        </td>
        <!--{else}-->
        <td>&nbsp;</td>
        <!--{/if}-->
        <!--{/if}-->
    </tr>
    <tr class="payment_tr" id="payment_tr_<!--{$arrPayment[cnt].payment_id}-->" style="display:none;">
        <td class="payment_detail_area" id="payment_detail_area_<!--{$arrPayment[cnt].payment_id}-->" colspan="2"></td>
    </tr>
    <!--{/section}-->
</table>
<!--{* お支払方法プルダウンエリア終了 *}-->
<!--{/if}-->
<!--{/if}-->



<!--{* ここから各決済関連 *}-->
<!--{if $type == 4 && ($use_paygent_conveni || $use_gmopg_conveni)}-->
<!-- コンビニ決済 begin -->
<div class="use_payarea">
    <table summary="決済情報の入力">
        <tr>
            <th>利用コンビニエンスストア選択</th>
            <td>
                <p class="attention"><!--{$arrErr.use_conveni_cd}--></p>
                <!--{if $ban_seven_flg}--><p class="attention">※ 決済金額が200円未満の場合、支払先にセブンイレブンを指定することは出来ません。</p><!--{/if}-->
                <div class="custom-select w50">
                  <select name="use_conveni_cd">
                      <option value="">選択して下さい</option>
                      <!--{html_options options=$arrConveniList selected=$arrForm.use_conveni_cd|escape}-->
                  </select>
                </div>
            </td>
        </tr>
        <tr>
            <th>利用者氏名</th>
            <td>
                <span class="attention"><!--{$arrErr.conveni_customer_name01}--></span>
                <span class="attention"><!--{$arrErr.conveni_customer_name02}--></span>
                姓：<input type="text" name="conveni_customer_name01" value="<!--{$arrForm.conveni_customer_name01|escape}-->" onkeyup="next(this, this.form.conveni_customer_name01)" placeholder="山田" class="w30 payinput" />
                名：<input type="text" name="conveni_customer_name02" value="<!--{$arrForm.conveni_customer_name02|escape}-->" onkeyup="next(this, this.form.conveni_customer_name02)" placeholder="太郎" class="w30 payinput" /><br />
                <p class="pdt10">全角入力(例：山田&nbsp;太郎)</p>
            </td>
        </tr>
        <tr>
            <th>利用者氏名（カナ）</th>
            <td>
                <span class="attention"><!--{$arrErr.conveni_customer_kana_name01}--></span>
                <span class="attention"><!--{$arrErr.conveni_customer_kana_name02}--></span>
                セイ : <input type="text" name="conveni_customer_kana_name01" value="<!--{$arrForm.conveni_customer_kana_name01|escape}-->" placeholder="ヤマダ" class="w30 payinput" />
                メイ : <input type="text" name="conveni_customer_kana_name02" value="<!--{$arrForm.conveni_customer_kana_name02|escape}-->" placeholder="タロウ" class="w30 payinput" /><br />
                <p class="pdt10">カナ入力(例：ヤマダ&nbsp;タロウ)</p>
            </td>
        </tr>
        <tr>
            <th>利用者電話番号</th>
            <td>
                <span class="attention"><!--{$arrErr.conveni_customer_tel}--></span>
                <input type="text" name="conveni_customer_tel" value="<!--{$arrForm.conveni_customer_tel|escape}-->" class="box380 payinput" />
                <p class="pdt10">ハイフン無しで半角数字入力(例：0311112222)</p>
            </td>
        </tr>
    </table>
</div>
<!-- コンビニ決済 end -->
<!--{/if}-->

<!--{if $type == 4 && $use_paygent_credit}-->
<!-- Paygent クレジット決済 begin -->
<!--{assign var=key1 value="use_card_type"}-->
<!--{if $useable_register_card_info_flg && $tpl_saved_card_info_activity}-->
<table>
    <tr>
        <td><input <!--{if $arrForm[$key1] == 1 || !$arrForm[$key1]}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="1" id="<!--{$key1}-->_1" /><label for="<!--{$key1}-->_1" >カード情報を入力する</label><input <!--{if $arrForm[$key1] == 2}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="2" id="<!--{$key1}-->_2" /><label for="<!--{$key1}-->_2" >登録済みカードを使用する</label></td>
    </tr>
</table>
<!--{else}-->
<input type="hidden" name="<!--{$key1}-->" value="1" />
<!--{/if}-->
<input type="hidden" name="use_paygent_credit" value="1" /><!--{* ←消さないでください *}-->
<div class="payarea02">
    <div class="use_payarea" id="entry_new_card" <!--{if $arrForm.use_card_type == 2}-->style="display:none;"<!--{/if}-->>
        <table summary="決済情報の入力">
            <tr class="new_card_info">
                <th>カード番号</th>
                <td>
                    <span class="attention"><!--{$arrErr.card_no}--></span>
                    <input type="text" name="card_no" value="<!--{$arrForm.card_no|escape}-->" size="18" class="payinput" inputmode="numeric"/>
                    <p class="pdt10">ハイフンなしで半角入力(例：1234567890123456)</p>
                </td>
            </tr>
            <tr class="new_card_info">
                <th>有効期限</th>
                <td>
                    <!--{assign var=key1 value="card_expiration_month"}-->
                    <!--{assign var=key2 value="card_expiration_year"}-->
                    <span class="attention"><!--{$arrErr[$key1]}--></span>
                    <span class="attention"><!--{$arrErr[$key2]}--></span>
                     <div class="custom-select w20">
                      <select name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" class="w100">
                          <option value="">--</option>
                          <!--{html_options options=$arrPayMonth selected=$arrForm[$key1]|escape}-->
                      </select>
                     </div> 月　/　
                     <div class="custom-select w20">
                       <select name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" class="w100">
                          <option value="">--</option>
                          <!--{html_options options=$arrPayYear selected=$arrForm[$key2]|escape}-->
                       </select>
                     </div>　年
                </td>
            </tr>
            <tr class="new_card_info">
                <th>カード名義(ローマ字氏名)</th>
                <td>
                    <!--{assign var=key1 value="card_holder_name1"}-->
                    <!--{assign var=key2 value="card_holder_name2"}-->
                    <span class="attention"><!--{$arrErr[$key1]}--></span>
                    <span class="attention"><!--{$arrErr[$key2]}--></span>
                    <p class="mini">
                        名&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" size="20" class="box120 payinput" placeholder="TARO" inputmode="url"/>&nbsp;&nbsp;
                        姓&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" class="box120 payinput" size="20" placeholder="YAMADA" inputmode="url"/>
                    </p>
                     <p class="pdt10">半角入力(例：TARO&nbsp;YAMADA)</p>
                </td>
            </tr>
<!--{captcha_form_cc_shopping}-->
        </table>
    </div>
    <!--{if $useable_register_card_info_flg && $arrSavedCardInfo}-->
    <div class="use_payarea" id="registered_card_list" <!--{if !$arrForm.use_card_type || $arrForm.use_card_type != 2}-->style="display:none;"<!--{/if}-->>
        <table>
            <tr>
                <th>-</th>
                <th width="280" >カード番号</th>
                <th>有効期限</th>
                <th>名義</th>
                <th>カード会社</th>
            </tr>
            <!--{foreach from=$savedCardInfoList item=card key=idx}-->
            <tr>
                <td><input type="radio" name="use_card_info_id" value="<!--{$card.card_id|escape}-->" style="display:block;"<!--{if !$arrForm.use_card_info_id && $idx == 0 || $arrForm.use_card_info_id == $card.card_id}--> checked="checked"<!--{/if}--> /></td>
                <td><!--{$card.card_number}--></td>
                <td><!--{$card.expiration_month}-->月/<!--{$card.expiration_year}-->年</td>
                <td><!--{$card.cardholder_name}--></td>
                <td><!--{$card.company_name}--></td>
            </tr>
            <!--{foreachelse}-->
            <tr>
                <td colspan="6">登録済みのカード情報はありません。</td>
            </tr>
            <!--{/foreach}-->
        </table>
    </div>
    <!--{/if}-->
<div class="use_payarea">
  <table summary="支払区分" >
      <tr>
          <th>お支払方法</th>
          <td>
              <!--{assign var=key1 value="payment_class"}-->
              <!--{if $arrErr[$key1]}-->
              <span class="attention"><!--{$arrErr[$key1]}--></span><br />
              <!--{/if}-->
              <div class="custom-select w30">
                <input type="hidden" name="split_payment_class_dmy" id="split_payment_class_dmy" value="<!--{$tpl_split_payment_class}-->" />
                <select name="<!--{$key1}-->" id="<!--{$key1}-->">
                    <!--{foreach from=$arrPaymentClass item=payment_class_text key=payment_class}-->
                    <option <!--{if $payment_class == $arrForm[$key1]}-->selected="selected"<!--{/if}--> value="<!--{$payment_class}-->" ><!--{$payment_class_text}--></option>
                    <!--{/foreach}-->
                </select>
              </div>
          </td>
      </tr>
      <tr id="split_count_tr" <!--{if $arrForm.payment_class != $tpl_split_payment_class}-->style="display:none"<!--{/if}-->>
          <th>支払回数</th>
          <td>
              <!--{assign var=key1 value="payment_split_count"}-->
              <div class="custom-select w20">
               <select name="<!--{$key1}-->">
                    <!--{foreach from=$arrPaymentSplitCount item=split_count_text key=split_count}-->
                    <option <!--{if $split_count == $arrForm[$key1]}-->selected="selected"<!--{/if}--> value="<!--{$split_count}-->" ><!--{$split_count_text}--></option>
                    <!--{/foreach}-->
                </select>
              </div>
          </td>
      </tr>
      <!--{if $is_useable_security_code}-->
      <tr>
          <th>セキュリティーコード</th>
          <td>
              <!--{assign var=key value="security_code"}-->
              <!--{if $arrErr[$key]}-->
              <span class="attention"><!--{$arrErr[$key]}--></span><br />
              <!--{/if}-->
              <div class="fl30 pdt15">
                <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key]|escape}-->" class="w80 payinput" size="4" inputmode="numeric"/>
              </div>
              <div class="fl70">
                <img src="<!--{$TPL_DIR}-->img/shopping/card_01.png" width="194" height="57" alt="" align="middle" style="position:relative;top:0px;right:0px;" />
              </div>
          </td>
      </tr>
      <!--{/if}-->
      <!--{assign var=key1 value="card_save_flg"}-->
      <!--{if $useable_register_card_info_flg}-->
      <tr id="confirmation_save_card" <!--{if $arrForm.use_card_type == 2}-->style="display:none;"<!--{/if}-->>
          <th>カード登録</th>
          <td>
              <input <!--{if $arrForm[$key1] == 1}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="1" id="<!--{$key1}-->_1" /><label for="<!--{$key1}-->_1" >する</label>
              <input <!--{if $arrForm[$key1] == 2 || !$arrForm[$key1]}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="2" id="<!--{$key1}-->_2" /><label for="<!--{$key1}-->_2" >しない</label><br /><br />
          </td>
      </tr>
      <!--{else}-->
      <input type="hidden" name="<!--{$key1}-->" value="2" />
      <!--{/if}-->
  </table>
</div>
<!-- Paygent クレジット決済 end -->
<!--{/if}-->


<!--{if $type == 4 && $use_paygent_credit_regular}-->
<!-- Paygent クレジット決済(定期) begin -->
<!--{assign var=key1 value="use_card_type"}-->
<!--{if $useable_register_card_info_flg && $tpl_saved_card_info_activity}-->
<div class="use_payarea">
    <table>
        <tr>
            <td>
                <input <!--{if $arrForm[$key1] == 1  || !$arrForm[$key1]}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="1" id="<!--{$key1}-->_1" /><label for="<!--{$key1}-->_1" >カード情報を入力する</label>
                <input <!--{if $arrForm[$key1] == 2}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="2" id="<!--{$key1}-->_2" /><label for="<!--{$key1}-->_2" >登録済みカードを使用する</label>
            </td>
        </tr>
    </table>
</div>
<!--{else}-->
<input type="hidden" name="<!--{$key1}-->" value="1" />
<!--{/if}-->
<input type="hidden" name="use_paygent_credit" value="1" /><!--{* ←消さないでください *}-->
<div class="use_payarea" id="entry_new_card" <!--{if $arrForm.use_card_type == 2}-->style="display:none;"<!--{/if}-->>
    <table summary="決済情報の入力">
        <tr class="new_card_info">
            <th>カード番号</th>
            <td>
                <span class="attention"><!--{$arrErr.card_no}--></span>
                <input type="text" name="card_no" value="<!--{$arrForm.card_no|escape}-->" size="18" class="payinput"/>
                <p class="pdt10">ハイフンなしで半角入力(例：1234567890123456)</p>
            </td>
        </tr>
        <tr class="new_card_info">
            <th>有効期限</th>
            <td>
                <!--{assign var=key1 value="card_expiration_month"}-->
                <!--{assign var=key2 value="card_expiration_year"}-->
                <span class="attention"><!--{$arrErr[$key1]}--></span>
                <span class="attention"><!--{$arrErr[$key2]}--></span>
                 <div class="custom-select w20">
                  <select name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" class="w100">
                      <option value="">--</option>
                      <!--{html_options options=$arrPayMonth selected=$arrForm[$key1]|escape}-->
                  </select>
                 </div>月　/　
                 <div class="custom-select w20">
                   <select name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" class="w100">
                      <option value="">--</option>
                      <!--{html_options options=$arrPayYear selected=$arrForm[$key2]|escape}-->
                   </select>
                 </div>　年
            </td>
        </tr>
        <tr class="new_card_info">
            <th>カード名義(ローマ字氏名)</th>
            <td>
                <!--{assign var=key1 value="card_holder_name1"}-->
                <!--{assign var=key2 value="card_holder_name2"}-->
                <span class="attention"><!--{$arrErr[$key1]}--></span>
                <span class="attention"><!--{$arrErr[$key2]}--></span>
                <p class="mini">
                    名&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" class="box120 payinput" size="20" placeholder="TARO" />&nbsp;&nbsp;
                    姓&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" class="box120 payinput" size="20" placeholder="YAMADA" /><br />
                    <p class="pdt10">半角入力(例：TARO&nbsp;YAMADA)</p>
                </p>
            </td>
        </tr>
<!--{captcha_form_cc_shopping}-->
    </table>
</div>
<!--{if $useable_register_card_info_flg && $arrSavedCardInfo}-->
<!--{if $arrErr.use_card_info_id}-->
<div style="margin-top:10px">
    <span class="attention">※使用するクレジットカードを選択してください</span>
</div>
<!--{/if}-->
<div class="use_payarea" id="registered_card_list" <!--{if !$arrForm.use_card_type || $arrForm.use_card_type != 2}-->style="display:none;"<!--{/if}-->>
    <table>
        <tr>
            <th>使用カード</th>
            <th>カード番号</th>
            <th>有効期限</th>
            <th>名義</th>
            <th>カード会社</th>
        </tr>
        <!--{foreach from=$arrSavedCardInfo item=card key=idx}-->
        <tr>
            <!--{if $card.is_useable}-->
            <td><input type="radio" name="use_card_info_id" value="<!--{$card.card_info_id}-->" style="display:block;" /></td>
            <!--{else}-->
            <td><span class="attention">使用不可</span></td>
            <!--{/if}-->
            <td><!--{$card.card_number}--></td>
            <td><!--{$card.expiration_month}-->月/<!--{$card.expiration_year}-->年</td>
            <td><!--{$card.cardholder_name}--></td>
            <td><!--{$card.company_name}--></td>
        </tr>
        <!--{foreachelse}-->
        <tr>
            <td colspan="6">登録済みのカード情報はありません。</td>
        </tr>
        <!--{/foreach}-->
    </table>
</div>
<!--{/if}-->

<div class="use_payarea" id="confirmation_save_card" <!--{if $arrForm.use_card_type == 2}-->style="display:none;"<!--{/if}-->>
    <table summary="支払区分" style="background:#eee;">
        <!--{assign var=key1 value="card_save_flg"}-->
        <!--{if $useable_register_card_info_flg}-->
        <tr>
            <th>カード登録</th>
            <td>
                <input type="hidden" name="<!--{$key1}-->" value="1" id="<!--{$key1}-->_1" />
                <span class="attention1">
                    ※定期購入の場合、自動的にカード登録処理が実行されます。カードは2枚まで登録できます。<br />また「使用不可」と表示されているカードは何らかの理由で使用できないカードです。ご利用のカード会社へお問い合せください。
                </span>
            </td>
        </tr>
        <!--{else}-->
        <input type="hidden" name="<!--{$key1}-->" value="2" />
        <!--{/if}-->
    </table>
</div>
<!-- Paygent クレジット決済(定期) end -->
<!--{/if}-->


<!--{if $type == 4 && $use_gmopg}-->
<!-- GMOクレジット begin -->
<div class="payarea02" style="background:#eee;">
    <div id="under02column">
        <div id="under02column_shopping">
            <!--{$add_html}-->
            <table summary="お支払い方法">
                <tr>
                    <td class="lefttd">お支払い方法：<!--{$tpl_payment_method}--><br /></td>
                </tr>
            </table>
            <!--{if $arrErr.gmo_request}-->
            <table>
                <tr>
                    <td class="lefttd">
                        <p class="attention">エラーが発生しました：<!--{$arrErr.gmo_request|escape}--></p>
                    </td>
                </tr>
            </table>
            <!--{/if}-->
            <div class="use_payarea">
                <table summary="決済情報の入力">
                    <tr>
                        <th>カード番号</th>
                        <td>
                            <span class="attention"><!--{$arrErr.card_no}--></span>
                            <input type="text" name="card_no" value="<!--{$arrForm.card_no|escape}-->" id="gmo_card_no" maxlength="16" class="payinput" inputmode="numeric"/>
                            <!-- ↓この部分は表示されませんが重要なので消さないでください。 -->
                            <input type="hidden" name="card_no01" value="<!--{$arrForm.card_no01|escape}-->" id="gmo_card_no01" />
                            <input type="hidden" name="card_no02" value="<!--{$arrForm.card_no02|escape}-->" id="gmo_card_no02" />
                            <input type="hidden" name="card_no03" value="<!--{$arrForm.card_no03|escape}-->" id="gmo_card_no03" />
                            <input type="hidden" name="card_no04" value="<!--{$arrForm.card_no04|escape}-->" id="gmo_card_no04" />
                            <!-- ↑この部分は表示されませんが重要なので消さないでください。 -->
                            <p class="pdt10">ハイフンなしで半角入力(例：1234567890123456)</p>
                        </td>
                    </tr>
                    <tr>
                        <th>有効期限</th>
                        <td>
                            <!--{assign var=key1 value="card_month"}-->
                            <!--{assign var=key2 value="card_year"}-->
                            <span class="attention"><!--{$arrErr[$key1]}--></span>
                            <span class="attention"><!--{$arrErr[$key2]}--></span>
                            <div class="custom-select w20">
                            <select name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" class="w100">
                                <option value="">--</option>
                                <!--{html_options options=$arrGmoMonth selected=$arrForm[$key1]|escape}-->
                            </select></div>
                            　月　/

                            <div class="custom-select w20">
                            <select name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" class="w100">
                                <option value="">--</option>
                                <!--{html_options options=$arrGmoYear selected=$arrForm[$key2]|escape}-->
                            </select>
                            </div>
                            年
                        </td>
                    </tr>
                    <tr>
                        <th>カード名義(ローマ字氏名)</th>
                        <td>
                            <!--{assign var=key1 value="card_name01"}-->
                            <!--{assign var=key2 value="card_name02"}-->
                            <span class="attention"><!--{$arrErr[$key1]}--></span>
                            <span class="attention"><!--{$arrErr[$key2]}--></span>
                            <p class="mini">
                                名&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" size="20" class="box120 payinput" placeholder="TARO" inputmode="url"/>&nbsp;&nbsp;
                                姓&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" size="20" class="box120 payinput" placeholder="YAMADA" inputmode="url"/></p>
                              <p class="pdt10">半角入力(例：TARO&nbsp;YAMADA)</p>
                        </td>
                    </tr>
                    <tr>
                        <th>お支払い方法</th>
                        <td>
                            <!--{assign var=key value="paymethod"}-->
                            <span class="attention"><!--{$arrErr[$key]}--></span>
                            <div class="custom-select w30">
                              <select name="<!--{$key}-->" value="<!--{$arrForm[$key]|escape}-->">
                                  <!--{html_options options=$arrPayMethod selected=$arrForm[$key]|escape}-->
                              </select>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
<input type="hidden" name="use_gmopg" value="1" /><!-- ←消さないでください -->
<!-- GMOクレジット end -->
<!--{/if}-->

<!--{* お届け時間の指定 *}-->
<!--{if $type == 5}-->
<div><h3 class="pdt20">お届け時間の指定</h3></div>
<table summary="お届け希望の指定">
    <tr>
        <th width="120" class="payment_normal"><!--{$deliv_date_display}-->
        </th>
        <td class="payment_normal" width="300">
            <!--{if !$arrDelivDate || $regular == 1}--><p class="mgtb10">ご指定頂けません</p><!--{else}-->
            <div class="custom-select w80">
              <select name="deliv_date" class="w100" style="background:#fff;">
                  <option value="" selected="">指定なし</option>
                  <!--{html_options options=$arrDelivDate selected=$arrForm.deliv_date}-->
              </select>
            </div>
            <!--{/if}-->
            <span class="attention"><!--{$arrErr.deliv_date}--></span>
        </td>
        <th width="120">お届け時間</th>
        <td width="300">
        	<div class="custom-select w80">
              <select name="deliv_time_id" class="w100" style="background:#fff;">
                  <option value="" selected="">指定なし</option>
                  <!--{html_options options=$arrDelivTime selected=$arrForm.deliv_time_id}-->
              </select>
            </div>
            <span class="attention"><!--{$arrErr.deliv_time_id}--></span>
        </td>
    </tr>
</table>
<!--{/if}-->

<!--{* 定期配送間隔の指定 *}-->
<!--{if $type == 7}-->
  <h3 class="pdt20">お届け間隔の指定</h3>
<table style="margin:0;padding:0;">
    <tr>
     <td>
      <p class="txt_sz">▼&nbsp;毎月のお届け間隔を以下のパターンから選択して下さい。</p>
      </td>
    </tr>
    <!--{assign var=key1 value="cycle_date:monthly"}-->
    <!--{assign var=key2 value="cycle_date:day"}-->
    <!--{if $regular_product.$key1 && $regular_product.$key2}-->
	<tr>
        <td>
                <div class="fl30" style="padding-left:8px;">
                    <input type="radio" name="cycle_type" id="cycle_type1" class="cycle_type_radio" value="1" <!--{if $arrForm.cycle_type == 1}-->checked="checked"<!--{/if}--> />
                    <label for="cycle_type1" class="w100">日付で指定</label>
                </div>
                <div id="cycle_type1_form" class="cycle_form"<!--{if $arrForm.cycle_type != 1}--> style="display:none;"<!--{/if}-->>
                <!--{if count($regular_product.$key1) > 1}-->
                <div class="custom-select3">
                    <select name="cycle_date_monthly" class="regular_cycle_select" id="cycle_date_monthly">
                    <!--{foreach from=$regular_product.$key1 key=key item=val}-->
                        <option value="<!--{$val}-->" <!--{if $arrForm.cycle_date_monthly == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_monthly.$val}--></option>
                    <!--{/foreach}-->
                    </select>
                </div>
                <!--{else}-->
                    <!--{assign var=one_val value=$regular_product.$key1.0}-->
                    <!--{$common_regular_param.cycle_monthly[$one_val]}--><input type="hidden" name="cycle_date_monthly" value="<!--{$regular_product.$key1.0}-->" id="cycle_date_monthly" />
                <!--{/if}-->
                <div class="custom-select3">
                <select name="cycle_date_day" class="regular_cycle_select" id="cycle_date_day">
    <!--{foreach from=$regular_product.$key2 key=key item=val}-->
    <option value="<!--{$val}-->" <!--{if $arrForm.cycle_date_day == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_date_day.$val}--></option>
    <!--{/foreach}-->
                </select>
                </div>
                にお届け
                </div>
           </td>
    </tr>
    <!--{/if}-->

        <!--{assign var=key1 value="cycle_week:monthly"}-->
        <!--{assign var=key2 value="cycle_week:ordinal"}-->
        <!--{assign var=key3 value="cycle_week:week"}-->
        <!--{if $regular_product.$key1 && $regular_product.$key2 && $regular_product.$key3}-->
        <tr>
        	<td>
                <div class="fl30" style="padding-left:8px;">
                    <input type="radio" name="cycle_type" id="cycle_type2" class="cycle_type_radio" value="2" <!--{if $arrForm.cycle_type == 2}-->checked="checked"<!--{/if}--> />
                    <label for="cycle_type2" class="w100">曜日で指定</label>
                </div>
                <div id="cycle_type2_form" class="cycle_form"<!--{if $arrForm.cycle_type != 2}--> style="display:none;"<!--{/if}-->>
                <!--{if count($regular_product.$key1) > 1}-->
                  <div class="custom-select3">
                    <select name="cycle_week_monthly" class="regular_cycle_select" id="cycle_week_monthly">
                    <!--{foreach from=$regular_product.$key1 key=key item=val}-->
                        <option value="<!--{$val}-->" <!--{if $arrForm.cycle_week_monthly == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_monthly.$val}--></option>
                    <!--{/foreach}-->
                    </select>
                  </div>
                <!--{else}-->
                    <!--{assign var=one_val value=$regular_product.$key1.0}-->
                    <!--{$common_regular_param.cycle_monthly[$one_val]}--><input type="hidden" name="cycle_week_monthly" value="<!--{$regular_product.$key1.0}-->" id="cycle_week_monthly" />
                <!--{/if}-->
                <div class="custom-select3">
                    <select name="cycle_week_ordinal" class="regular_cycle_select" id="cycle_week_ordinal">
        <!--{foreach from=$regular_product.$key2 key=key item=val}-->
        <option value="<!--{$val}-->" <!--{if $arrForm.cycle_week_ordinal == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_week_ordinal.$val}--></option>
        <!--{/foreach}-->
                    </select>
                </div>
                <div class="custom-select3">
                    <select name="cycle_week_week" class="regular_cycle_select" id="cycle_week_week">
        <!--{foreach from=$regular_product.$key3 key=key item=val}-->
        <option value="<!--{$val}-->" <!--{if $arrForm.cycle_week_week == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_week.$val}--></option>
        <!--{/foreach}-->
                    </select>
                    </div>
                    にお届け
                </div>
        	</td>
        </tr>
        <!--{/if}-->

        <!--{assign var=key1 value="cycle_interval:interval"}-->
        <!--{if $regular_product.$key1}-->
        <tr>
          <td>
            <div class="fl30" style="padding-left:8px;">
              <input type="radio" name="cycle_type" id="cycle_type3" class="cycle_type_radio" value="3" <!--{if $arrForm.cycle_type == 3}-->checked="checked"<!--{/if}--> />
              <label for="cycle_type3" class="w100">間隔で指定</label>
            </div>
            <div id="cycle_type3_form" class="cycle_form"<!--{if $arrForm.cycle_type != 3}--> style="display:none;"<!--{/if}-->>
                <div id="cycle_interval_start_date_area" style="display:inline;">
                初回お届け日
                <div class="custom-select3">
                    <select name="cycle_interval_start_date" class="regular_cycle_select" id="cycle_interval_start_date">
                    <!--{section name=cnt start=0 loop=$regular_config.interval_range}-->
                    <!--{assign var=time_ts value="+`$smarty.section.cnt.index` day"|strtotime:$regular_config.allowed_first_interval_date_ts}-->
                    <!--{assign var=time value=$time_ts|date_format:"%Y-%m-%d"}-->
                    <option value="<!--{$time}-->" <!--{if $arrForm.cycle_interval_start_date == $time}-->selected="selected"<!--{/if}-->><!--{$time_ts|date_format:"%Y年%m月%d日"}--></option>
                    <!--{/section}-->
                    </select>
                </div>
                から
                </div>
                <div class="custom-select3">
                    <select name="cycle_interval_interval" class="regular_cycle_select" id="cycle_interval_interval">
<!--{foreach from=$regular_product.$key1 key=key item=val}-->
                        <option value="<!--{$val}-->" <!--{if $arrForm.cycle_interval_interval == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_interval.$val}--></option>
<!--{/foreach}-->
                    </select>
                </div>&nbsp;間隔でお届け
            </div>
          </td>
        </tr>
        <!--{/if}-->

        <tr>
       	   <td class="no_bdr" style="padding:10px 0 0 0;">
           <p class="attention"><!--{$arrErr.cycle_type}--></p>
             <div class="reg_delivday">
                 <div class="deliv_s_date">
                 お届け予定日
                 </div>
                 <ul>
                   <li><div class="delivday_box">初回&nbsp;<span id="regular_deliv_day_first" class="regular_deliv_day"></span></div></li>
                   <li style="padding: 0 0 0 10px;"><div class="delivday_box">二回目&nbsp;<span id="regular_deliv_day_second" class="regular_deliv_day"></span></div></li>
                 </ul>
              </div>
           </td>
        </tr>
        <tr>
           <td class="no_bdr no_pd">
              <!--{if $first_auto}-->
              <span class="delive_shortbt"><input type="checkbox" name="first_quick_flg" id="first_quick_flg" value="1" <!--{if $arrForm.first_quick_flg == 1}-->checked="checked"<!--{/if}--> /><label for="first_quick_flg">初回は最短でお届けする</label></span><span class="mini pdl10"><em>希望しない場合はチェックを外して下さい。</em></span>
              <!--{else}-->
             <span class="delive_shortbt"><input type="checkbox" name="quick_flg" id="quick_flg" value="1" <!--{if $arrForm.quick_flg == 1}-->checked="checked"<!--{/if}--> /><label for="quick_flg"> 初回は最短でお届けする</label></span><span class="mini pdl10"><em>希望しない場合はチェックを外して下さい。</em></span>
              <!--{/if}-->
            </td>
        </tr>
	</table>
<!--{/if}-->

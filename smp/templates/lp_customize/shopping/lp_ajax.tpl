<!--{* 各タグのid要素を削除したり、変更したりすると動作しなくなります。 *}-->


<!--{* 規格 *}-->
<!--{if $type == 1 && $class_name1}-->
    <!--{if $class_name2}-->
    <script type="text/javascript">//<![CDATA[
    <!--{$tpl_javascript}-->
    </script>
    <!--{/if}-->
    <!--{* 規格1 *}-->
    <p><!--{$class_name1}--></p>
    <div class="custom-select2 w100">
      <select name="classcategory_id1" id="classcategory_id1">
          <option value="">選択してください</option>
          <!--{html_options options=$arrClassCat1 selected=$arrForm.classcategory_id1}-->
      </select>
    </div>
    <span class="smp-lp-error"><!--{$arrErr.classcategory_id1}--></span>

    <!--{* 規格2 *}-->
    <!--{if $class_name2}-->
    <p><!--{$class_name2}--></p>
    <div class="custom-select2 w100">
      <select name="classcategory_id2" id="classcategory_id2">
          <option value="">選択してください</option>
          <!--{html_options options=$arrClassCat2 selected=$arrForm.classcategory_id2}-->
      </select>
    </div>
    <span class="smp-lp-error"><!--{$arrErr.classcategory_id2}--></span>
    <!--{/if}-->

    <!--{* 規格3以上 *}-->
    <!--{if $pcc_list_extra}-->
    <span class="classcategory_extra">
    <!--{foreach from=$pcc_list_extra item=item key=key}-->
        <p>
        <!--{$item.class_name|escape}-->
        <!--{assign var="classcategory_id" value="classcategory_id`$key`"}-->
        </p>
        <div class="custom-select2 w100">
        <select name="classcategory_id<!--{$key}-->" id="classcategory_id<!--{$key}-->>">
            <option value="">選択してください</option>
            <!--{html_options options=$item.classcategory selected=$arrForm.$classcategory_id}-->
        </select>
        </div>
        <span class="smp-lp-error"><!--{$arrErr[$classcategory_id]}--></span>
    <!--{/foreach}-->
    </span>
    <!--{/if}-->
<!--{/if}-->


<!--{* 決済方法 *}-->
<!--{if $type == 3 && $arrPayment}-->

<!--{* 支払方法をラジオボタンで表示する際はisRadioButtonPaymentのvalueをtrue、プルダウンで表示する際はfalseにしてください *}-->
<!--{assign var="isRadioButtonPayment" value=false}-->

<!--{if $isRadioButtonPayment == true}-->
<!--{* お支払方法ラジオボタンエリア開始 *}-->
<dl>
    <!--{assign var=key value="payment_id"}-->
    <!--{section name=cnt loop=$arrPayment}-->
    <dd class="smp-lp-bottomline04 <!--{if $arrPayment[cnt].payment_normal == true}-->payment_normal  <!--{/if}--><!--{if $arrPayment[cnt].payment_reg == true}-->payment_reg <!--{/if}--><!--{if $arrPayment[cnt].payment_deliv == true}-->payment_deliv<!--{/if}-->">
    <div><input type="radio" id="pay_<!--{$smarty.section.cnt.iteration}-->" class="radio_payment_id" name="<!--{$key}-->" value="<!--{$arrPayment[cnt].payment_id}-->" <!--{if $arrPayment[cnt].payment_id == $arrForm.payment_id}--> checked="checked"<!--{/if}--> />
    <label for="pay_<!--{$smarty.section.cnt.iteration}-->"class="w100 h100"><!--{$arrPayment[cnt].payment_method|escape}--><!--{if $arrPayment[cnt].note != ""}--><!--{/if}--></label></div>
        <p><em>
            <!--{if $arrPayment[cnt].payment_affairs_regular}-->
                <!--{$arrPayment[cnt].payment_affairs_regular|escape|nl2br}-->
            <!--{else}-->
                <!--{$arrPayment[cnt].payment_affairs|escape|nl2br}-->
            <!--{/if}-->
        </em></p>
    <!--{if $img_exist_flg}-->
        <!--{if $arrPayment[cnt].payment_image != ""}--><img class="smp-lp-payment_image" src="<!--{$smarty.const.IMAGE_SAVE_URL}--><!--{$arrPayment[cnt].payment_image}-->" /><!--{else}--><!--{/if}-->
    <!--{/if}-->
    </dd>
    <span class="payment_detail_area" id="payment_detail_area_<!--{$arrPayment[cnt].payment_id}-->"></span>
    <!--{/section}-->
    <dd><span class="smp-lp-error"><!--{$arrErr.payment_id}--></span></dd>
</dl>
<!--{* お支払方法ラジオボタンエリア終了 *}-->
<!--{else}-->
<!--{* お支払方法プルダウンエリア開始 *}-->
<dl>
    <dd class="smp-lp-bottomline04 <!--{if $arrPayment[cnt].payment_normal == true}-->payment_normal  <!--{/if}--><!--{if $arrPayment[cnt].payment_reg == true}-->payment_reg <!--{/if}--><!--{if $arrPayment[cnt].payment_deliv == true}-->payment_deliv<!--{/if}-->">
    <!--{assign var=key value="payment_id"}-->
    <div class="custom-select w80 mgt20 mgb10">
    <select name="payment_id" id="payment_id">
        <option name="payment_id" value="">選択してください</option>
        <!--{section name=cnt loop=$arrPayment}-->
        <option name="payment_id" value="<!--{$arrPayment[cnt].payment_id}-->" <!--{$arrPayment[cnt].payment_id|sfGetSelected:$arrForm.payment_id}--> class="select_payment_id <!--{if $arrPayment[cnt].payment_normal == true}-->payment_normal <!--{/if}--><!--{if $arrPayment[cnt].payment_reg == true}-->payment_reg <!--{/if}--><!--{if $arrPayment[cnt].payment_deliv == true}-->payment_deliv<!--{/if}-->"><!--{$arrPayment[cnt].payment_method|escape}--></option>
        <!--{/section}-->
    </select>
    </div>
    <!--{section name=cnt loop=$arrPayment}-->
    <div id="payment_affair_<!--{$arrPayment[cnt].payment_id}-->" class="payment_affair">
        <em class="payment_reg payment_normal" style="display:block;">
            <!--{if $arrPayment[cnt].payment_affairs_regular}-->
                <!--{$arrPayment[cnt].payment_affairs_regular|escape|nl2br}-->
            <!--{else}-->
                <!--{$arrPayment[cnt].payment_affairs|escape|nl2br}-->
            <!--{/if}-->
        </em>
        <!--{if $img_exist_flg}-->
            <!--{if $arrPayment[cnt].payment_image != ""}--><img class="smp-lp-payment_image" src="<!--{$smarty.const.IMAGE_SAVE_URL|escape}--><!--{$arrPayment[cnt].payment_image|escape}-->" /><!--{else}--><!--{/if}-->
        <!--{/if}-->
    </div>
    <span class="payment_detail_area" id="payment_detail_area_<!--{$arrPayment[cnt].payment_id}-->"></span>
    <!--{/section}-->
    </dd>
    <dd><span class="smp-lp-error"><!--{$arrErr.payment_id}--></span></dd>
</dl>
<!--{* お支払方法プルダウンエリア終了 *}-->
<!--{/if}-->
<!--{/if}-->

<!--{* ここから各決済関連 *}-->
<!--{if $type == 4 && ($use_paygent_conveni || $use_gmopg_conveni)}-->
<!-- コンビニ決済 begin -->
<div class="bg_pay">
    <dt class="pdt10">利用コンビニエンスストア選択</dt>
    <dd>
    	<div class="custom-select w180p mgb10">
          <select name="use_conveni_cd">
              <option value="">選択してください</option>
              <!--{html_options options=$arrConveniList selected=$arrForm.use_conveni_cd|escape}-->
          </select>
        </div>
        <!--{if $ban_seven_flg}--><em>※ 決済金額が200円未満の場合、支払先にセブンイレブンを指定することは出来ません。</em><!--{/if}-->
    </dd>
    <dt class="smp-lp-bottomline06">利用者氏名</dt>
    <dd>
        <ul class="smp-lp-username">
            <li><input type="text" name="conveni_customer_name01" value="<!--{$arrForm.conveni_customer_name01|escape}-->" placeholder="山田" class="w98"/></li>
            <li><input type="text" name="conveni_customer_name02" value="<!--{$arrForm.conveni_customer_name02|escape}-->" placeholder="太郎" class="w98"/></li>
        </ul>
        <span class="smp-lp-error"><!--{$arrErr.conveni_customer_name01}--><!--{$arrErr.conveni_customer_name01}--></span>
    </dd>
    <dt class="smp-lp-bottomline06">利用者氏名（カナ）</dt>
    <dd>
        <ul class="smp-lp-username">
            <li><input type="text" name="conveni_customer_kana_name01" value="<!--{$arrForm.conveni_customer_kana_name01|escape}-->" placeholder="ヤマダ" class="w98"/></li>
            <li><input type="text" name="conveni_customer_kana_name02" value="<!--{$arrForm.conveni_customer_kana_name02|escape}-->" placeholder="タロウ" class="w98"/></li>
        </ul>
        <span class="smp-lp-error"><!--{$arrErr.conveni_customer_kana_name01}--><!--{$arrErr.conveni_customer_kana_name02}--></span>
    </dd>
    <dt class="smp-lp-bottomline06">利用者電話番号</dt>
    <dd>
        <ul class="smp-lp-tel">
            <li><input type="text" name="conveni_customer_tel" value="<!--{$arrForm.conveni_customer_tel|escape}-->" class="w100" /></li>
        </ul>
        <span class="smp-lp-error"><!--{$arrErr.conveni_customer_tel}--></span>
    </dd>
</div>
<!-- コンビニ決済 end -->
<!--{/if}-->

<!--{if $type == 4 && $use_paygent_credit}-->
<!-- Paygent クレジット決済 begin -->
<div class="bg_pay">
    <dt class="pdt10">お支払方法</dt>
    <dd>
        <!--{assign var=key1 value="payment_class"}-->
        <div class="custom-select w70">
        <select name="<!--{$key1}-->" id="<!--{$key1}-->">
            <!--{foreach from=$arrPaymentClass item=payment_class_text key=payment_class}-->
                <option <!--{if $payment_class == $arrForm[$key1]}-->selected="selected"<!--{/if}--> value="<!--{$payment_class}-->" ><!--{$payment_class_text}--></option>
            <!--{/foreach}-->
        </select>
        <input type="hidden" name="split_payment_class_dmy" id="split_payment_class_dmy" value="<!--{$tpl_split_payment_class}-->" />
        </div>
        <span class="smp-lp-error"><!--{$arrErr[$key1]}--></span>
    </dd>
    <dt class="pdt10" id="split_count_th" <!--{if $arrForm.payment_class != $tpl_split_payment_class}-->style="display:none"<!--{/if}-->>支払回数</dt>
    <dd id="split_count_tr" class="smp-lp-bottomline03" <!--{if $arrForm.payment_class != $tpl_split_payment_class}-->style="display:none"<!--{/if}-->>
        <!--{assign var=key1 value="payment_split_count"}-->
        <div class="custom-select w70">
        <select name="<!--{$key1}-->">
            <!--{foreach from=$arrPaymentSplitCount item=split_count_text key=split_count}-->
            <option <!--{if $split_count == $arrForm[$key1]}-->selected="selected"<!--{/if}--> value="<!--{$split_count}-->" ><!--{$split_count_text}--></option>
            <!--{/foreach}-->
        </select>
        </div>
    </dd>
    <!--{assign var=key1 value="use_card_type"}-->
    <!--{if $useable_register_card_info_flg && $tpl_saved_card_info_activity}-->
    <dd><input <!--{if $arrForm[$key1] == 1 || !$arrForm[$key1]}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="1" id="<!--{$key1}-->_1" /><label for="<!--{$key1}-->_1" >カード情報を入力する</label></dd>
    <dd><input <!--{if $arrForm[$key1] == 2}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="2" id="<!--{$key1}-->_2" /><label for="<!--{$key1}-->_2" >登録済みカードを使用する</label></dd>
    <!--{else}-->
    <input type="hidden" name="<!--{$key1}-->" value="1" />
    <!--{/if}-->
    <input type="hidden" name="use_paygent_credit" value="1" /><!--{* ←消さないでください *}-->
    <div id="entry_new_card" <!--{if $arrForm.use_card_type == 2}-->style="display:none;"<!--{/if}-->>
    <dt class="new_card_info smp-lp-bottomline06">カード番号<span class="nohyphen">ハイフンなし</span></dt>
    <dd class="new_card_info">
        <ul class="smp-lp-username">
            <li style="width:80%;"><input type="text" name="card_no" value="<!--{$arrForm.card_no|escape}-->" class="w98" inputmode="numeric"/></li>
        </ul>
        <span class="smp-lp-error"><!--{$arrErr.card_no}--></span>
    </dd>
    <dt class="new_card_info smp-lp-bottomline06">有効期限</dt>
    <dd class="new_card_info">
        <ul class="smp-lp-expiration">
            <!--{assign var=key1 value="card_expiration_month"}-->
            <!--{assign var=key2 value="card_expiration_year"}-->
            <li><div  class="custom-select w80 mgb10"><select name="<!--{$key1}-->"><option value="">月</option><!--{html_options options=$arrPayMonth selected=$arrForm[$key1]|escape}--></select></div></li>
            <li><div  class="custom-select w80 mgb10"><select name="<!--{$key2}-->"><option value="">年</option><!--{html_options options=$arrPayYear selected=$arrForm[$key2]|escape}--></select></div></li>
        </ul>
        <span class="smp-lp-error"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
    </dd>
    <dt class="new_card_info smp-lp-bottomline06">カード名義(ローマ字氏名)</dt>
    <dd class="new_card_info">
        <ul class="smp-lp-username">
            <!--{assign var=key1 value="card_holder_name1"}-->
            <!--{assign var=key2 value="card_holder_name2"}-->
            <li><input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" placeholder="TARO"  class="w95" inputmode="url"/></li>
            <li><input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" placeholder="YAMADA"  class="w95" inputmode="url"/></li>
        </ul>
        <span class="smp-lp-error"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
    </dd>
    </div>
    <!--{if $useable_register_card_info_flg && $arrSavedCardInfo}-->
    <div id="registered_card_list" <!--{if !$arrForm.use_card_type || $arrForm.use_card_type != 2}-->style="display:none;"<!--{/if}-->>
    <dt class="smp-lp-bottomline06">登録済みカード</dt>
    <dd>
        <table class="smp-lp-card">
            <tr>
                <th>使用カード</th>
                <th>カード番号</th>
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
            <tr><td colspan="4">登録済みのカード情報はありません。</td></tr>
            <!--{/foreach}-->
        </table>
    </dd>
    </div>
    <!--{/if}-->
    
    <!--{if $is_useable_security_code}-->
    <dt class="bor smp-lp-bottomline06" >セキュリティーコード</dt>
    <dd>
        <ul>
          <li class="fl40"><input type="text" name="security_code" value="<!--{$arrForm.security_code|escape}-->"  class="w70" inputmode="numeric"/>
          <!--{if $arrErr[$key]}--><span class="smp-lp-error"><!--{$arrErr[$key]}--></span><!--{/if}-->
          <img src="<!--{$TPL_DIR}-->img/shopping/card_01.png" width="75" height="32" alt="" align="right" /></li>
       	</ul>
         <div class="clear" ></div>
    </dd>
    <!--{/if}-->
    <!--{assign var=key1 value="card_save_flg"}-->
    <!--{if $useable_register_card_info_flg}-->
    <div id="confirmation_save_card" <!--{if $arrForm.use_card_type == 2}-->style="display:none;"<!--{/if}-->>
    <dt class="smp-lp-bottomline06">カード登録</dt>
    <dd>
        <input <!--{if $arrForm[$key1] == 1}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="1" id="<!--{$key1}-->_1" /><label for="<!--{$key1}-->_1" >する</label>
        <input <!--{if $arrForm[$key1] == 2 || !$arrForm[$key1]}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="2" id="<!--{$key1}-->_2" /><label for="<!--{$key1}-->_2" >しない</label>
    </dd>
    </div>
    <!--{else}-->
    <input type="hidden" name="<!--{$key1}-->" value="2" />
    <!--{/if}-->
</div>
<!-- Paygent クレジット決済 end -->
<!--{/if}-->


<!--{if $type == 4 && $use_paygent_credit_regular}-->
<!-- Paygent クレジット決済(定期) begin -->
<div class="bg_pay">
    <!--{assign var=key1 value="use_card_type"}-->
    <!--{if $useable_register_card_info_flg && $tpl_saved_card_info_activity}-->
    <dd><input <!--{if $arrForm[$key1] == 1 || !$arrForm[$key1]}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="1" id="<!--{$key1}-->_1" /><label for="<!--{$key1}-->_1" >カード情報を入力する</label></dd>
    <dd><input <!--{if $arrForm[$key1] == 2}-->checked="checked"<!--{/if}--> type="radio" name="<!--{$key1}-->" value="2" id="<!--{$key1}-->_2" /><label for="<!--{$key1}-->_2" >登録済みカードを使用する</label></dd>
    <!--{else}-->   
    <input type="hidden" name="<!--{$key1}-->" value="1" />
    <!--{/if}-->
    <div id="entry_new_card" <!--{if $arrForm.use_card_type == 2}-->style="display:none;"<!--{/if}-->>
    <input type="hidden" name="use_paygent_credit" value="1" /><!--{* ←消さないでください *}-->
    <dt class="new_card_info">カード番号<span class="nohyphen">ハイフンなし</span></dt>
    <dd class="new_card_info">
        <ul class="smp-lp-username">
            <li><input type="tel" name="card_no" value="<!--{$arrForm.card_no|escape}-->"  inputmode="numeric"/></li>
        </ul>
        <span class="smp-lp-error"><!--{$arrErr.card_no}--></span>
    </dd>
    <dt class="new_card_info smp-lp-bottomline">有効期限</dt>
    <dd class="new_card_info">
        <ul class="smp-lp-expiration">
            <!--{assign var=key1 value="card_expiration_month"}-->
            <!--{assign var=key2 value="card_expiration_year"}-->
            <li><div  class="custom-select w80 mgb10"><select name="<!--{$key1}-->"><option value="">月</option><!--{html_options options=$arrPayMonth selected=$arrForm[$key1]|escape}--></select></div></li>
            <li><div  class="custom-select w80 mgb10"><select name="<!--{$key2}-->"><option value="">年</option><!--{html_options options=$arrPayYear selected=$arrForm[$key2]|escape}--></select></div></li>
        </ul>
        <span class="smp-lp-error"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
    </dd>
    <dt class="new_card_info smp-lp-bottomline">カード名義(ローマ字氏名)</dt>
    <dd class="new_card_info">
        <ul class="smp-lp-username">
            <!--{assign var=key1 value="card_holder_name1"}-->
            <!--{assign var=key2 value="card_holder_name2"}-->
            <li><input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" placeholder="TARO" class="w95" inputmode="url"/></li>
            <li><input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" placeholder="YAMADA" class="w95" inputmode="url"/></li>
        </ul>
        <span class="smp-lp-error"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
    </dd>
    </div>
    <!--{if $useable_register_card_info_flg && $arrSavedCardInfo}-->
    <!--{if $arrErr.use_card_info_id}-->
    <dd><span class="smp-lp-error">※使用するクレジットカードを選択してください</span></dd>
    <!--{/if}-->
    <dd id="registered_card_list" <!--{if !$arrForm.use_card_type || $arrForm.use_card_type != 2}-->style="display:none;"<!--{/if}-->>
        <table class="smp-lp-card">
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
                <td><input type="radio" name="use_card_info_id" id="use_card_info_id_<!--{$idx}-->" value="<!--{$card.card_info_id}-->" /><label for="use_card_info_id_<!--{$idx}-->" /></td>
                <!--{else}-->
                <td><span class="smp-lp-error">使用不可</span></td>
                <!--{/if}-->
                <td><!--{$card.card_number}--></td>
                <td><!--{$card.expiration_month}-->月<!--{$card.expiration_year}-->年</td>
                <td><!--{$card.cardholder_name}--></td>
                <td><!--{$card.company_name}--></td>
            </tr>
            <!--{foreachelse}-->
            <tr>
                <td colspan="6">登録済みのカード情報はありません。</td>
            </tr>
            <!--{/foreach}-->
        </table>
    </dd>
    <!--{/if}-->
    <!--{assign var=key1 value="card_save_flg"}-->
    <!--{if $useable_register_card_info_flg}-->
   <div id="confirmation_save_card" <!--{if $arrForm.use_card_type == 2}-->style="display:none;"<!--{/if}-->>
   <dt class="smp-lp-bottomline">カード登録</dt>
    <dd>
        <input type="hidden" name="<!--{$key1}-->" value="1" id="<!--{$key1}-->_1" />
        <span class="card-registration_memo">
            <em>※定期購入の場合、自動的にカード登録処理が実行されます。カードは2枚まで登録できます。<br />また「使用不可」と表示されているカードは何らかの理由で使用できないカード
    です。ご利用のカード会社へお問い合せください</em>
        </span>
    </dd>
    </div>
    <!--{else}--><input type="hidden" name="<!--{$key1}-->" value="2" /><!--{/if}-->
</div>
<!-- Paygent クレジット決済(定期) end -->
<!--{/if}-->


<!--{if $type == 4 && $use_gmopg}-->
<!-- GMOクレジット begin -->
<div class="bg_pay">
	<dt class="pdt10">支払い回数</dt>
    <dd>
    	<div class="custom-select w70">
          <select name="paymethod" value="<!--{$arrForm.paymethod|escape}-->" >
          <!--{html_options options=$arrPayMethod selected=$arrForm.paymethod|escape}-->
          </select>
        </div>
        <span class="attention"><!--{$arrErr.paymethod}--></span>
    </dd>
    <dt class="smp-lp-bottomline">カード番号<span class="nohyphen">ハイフンなし</span></dt>
    <dd class="new_card_info">
        <ul class="smp-lp-username">
            <li style="width:80%;"><input type="tel" name="card_no" value="<!--{$arrForm.card_no|escape}-->" class="w98" id="gmo_card_no" inputmode="numeric"/></li>
            <!-- ↓この部分は表示されませんが重要なので消さないでください。 -->
            <input type="hidden" name="card_no01" value="<!--{$arrForm.card_no01|escape}-->" class="w98" id="gmo_card_no01" />
            <input type="hidden" name="card_no02" value="<!--{$arrForm.card_no02|escape}-->" class="w98" id="gmo_card_no02" />
            <input type="hidden" name="card_no03" value="<!--{$arrForm.card_no03|escape}-->" class="w98" id="gmo_card_no03" />
            <input type="hidden" name="card_no04" value="<!--{$arrForm.card_no04|escape}-->" class="w98" id="gmo_card_no04" />
            <!-- ↑この部分は表示されませんが重要なので消さないでください。 -->
        </ul>
        <span class="smp-lp-error"><!--{$arrErr.card_no}--></span>
    </dd>
    <dt class="smp-lp-bottomline">有効期限</dt>
    <dd>
        <ul class="smp-lp-expiration">
            <!--{assign var=key1 value="card_month"}-->
            <!--{assign var=key2 value="card_year"}-->
            <li><div class="custom-select w108 mgb10"><select name="<!--{$key1}-->"><option value="">月</option><!--{html_options options=$arrGmoMonth selected=$arrForm[$key1]|escape}--></select></div></li>
            <li><div class="custom-select w108 mgb10"><select name="<!--{$key2}-->"><option value="">年</option><!--{html_options options=$arrGmoYear selected=$arrForm[$key2]|escape}--></select></div></li>
        </ul>
        <span class="smp-lp-error"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
    </dd>
    <dt class="smp-lp-bottomline">カード名義(ローマ字氏名)</dt>
    <dd>
        <ul class="smp-lp-username">
            <!--{assign var=key1 value="card_name01"}-->
            <!--{assign var=key2 value="card_name02"}-->
            <li><input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1]|escape}-->" placeholder="TARO" class="w95" inputmode="url"/></li>
            <li><input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2]|escape}-->" placeholder="YAMADA" class="w95" inputmode="url"/></li>
        </ul>
        <span class="smp-lp-error"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
        <span class="mgt10">例)TARO YAMADA</span>
    </dd>
</div>
<input type="hidden" name="use_gmopg" value="1" /><!-- ←消さないでください -->
<!-- GMOクレジット end -->
<!--{/if}-->


<!--{* お届け時間の指定 *}-->
<!--{if $type == 5}-->
<dl>
    <dt class="payment_normal"<!--{if !$arrDelivDate || $regular == 1}--> style="display: none;"<!--{/if}-->><!--{$deliv_date_display}--></dt>
    <dd class="payment_normal"<!--{if !$arrDelivDate || $regular == 1}--> style="display: none;"<!--{/if}-->>
      <!--{if !$arrDelivDate || $regular == 1}--><div class="w100 mgb20">ご指定頂けません</div><!--{else}-->
      <div class="custom-select w100 mgb10">
        <select name="deliv_date" > 
            <option value="">日付指定なし</option>
            <!--{html_options options=$arrDelivDate selected=$arrForm.deliv_date}-->
        </select>
       </div>
        <!--{/if}-->
    </dd>
  <div <!--{if !$arrDelivDate || $regular == 1}--> style="float: left; width: 100%;"<!--{/if}-->>
    <dt>お届け希望時間</dt>
    <dd>
     <div class="custom-select w100">
        <select name="deliv_time_id" >
            <option value="">時間指定なし</option>
            <!--{html_options options=$arrDelivTime selected=$arrForm.deliv_time_id}-->
        </select>
     </div>
    </dd>
  </div>
</dl>
<!--{/if}-->

<!--{* 配送間隔の指定 *}-->
<!--{* 各selectにある class="regular_cycle_select" は消さないでください。これを消すとお届け予定日が表示されなくなります *}-->
<!--{if $type == 7}-->
<dt style="display: none;"><p class="txt_sz">▼お届け日を以下から選択してください</p></dt>  
<!--{assign var=key1 value="cycle_date:monthly"}-->
<!--{assign var=key2 value="cycle_date:day"}-->
<!--{if $regular_product.$key1 && $regular_product.$key2}-->
<dd>
    <input type="radio" name="cycle_type" id="cycle_type1" class="cycle_type_radio" value="1" <!--{if $arrForm.cycle_type == 1}-->checked="checked"<!--{/if}--> /> <label for="cycle_type1" class="w100 h100">日付で指定</label>
    <div id="cycle_type1_form" class="cycle_form"<!--{if $arrForm.cycle_type != 1}--> style="display:none;"<!--{/if}-->>
      <!--{if count($regular_product.$key1) > 1}-->
      <div class="mgt10">
          <div class="custom-select2">
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
          <div class="custom-select2">
            <select name="cycle_date_day" class="regular_cycle_select" id="cycle_date_day">
                <!--{foreach from=$regular_product.$key2 key=key item=val}-->
                    <option value="<!--{$val}-->" <!--{if $arrForm.cycle_date_day == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_date_day.$val}--></option>
                <!--{/foreach}-->
            </select>
          </div>
          でお届け
      </div>
    </div>
</dd>

<!--{/if}-->
<!--{assign var=key1 value="cycle_week:monthly"}-->
<!--{assign var=key2 value="cycle_week:ordinal"}-->
<!--{assign var=key3 value="cycle_week:week"}-->
<!--{if $regular_product.$key1 && $regular_product.$key2 && $regular_product.$key3}-->
<dd>
    <p><input type="radio" name="cycle_type" id="cycle_type2" class="cycle_type_radio" value="2" <!--{if $arrForm.cycle_type == 2}-->checked="checked"<!--{/if}--> /> <label for="cycle_type2" class="w100 h100">曜日で指定</label></p>

	<div id="cycle_type2_form" class="cycle_form mgt10"<!--{if $arrForm.cycle_type != 2}--> style="display:none;"<!--{/if}-->>
        <!--{if count($regular_product.$key1) > 1}-->
        <div class="mgt10">
            <div class="custom-select2">
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
            <div class="custom-select2">
              <select name="cycle_week_ordinal" class="regular_cycle_select" id="cycle_week_ordinal">
                  <!--{foreach from=$regular_product.$key2 key=key item=val}-->
                      <option value="<!--{$val}-->" <!--{if $arrForm.cycle_week_ordinal == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_week_ordinal.$val}--></option>
                  <!--{/foreach}-->
              </select>
           </div>
            <div class="custom-select2" >
              <select name="cycle_week_week" class="regular_cycle_select" id="cycle_week_week">
                  <!--{foreach from=$regular_product.$key3 key=key item=val}-->
                      <option value="<!--{$val}-->" <!--{if $arrForm.cycle_week_week == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_week.$val}--></option>
                  <!--{/foreach}-->
              </select>
             
           </div>
           にお届け
        </div> 
    </div>
</dd>
<!--{/if}-->
<!--{assign var=key1 value="cycle_interval:interval"}-->
<!--{if $regular_product.$key1}-->
<dd style="display: none;">
    <input type="radio" name="cycle_type" id="cycle_type3" class="cycle_type_radio" value="3" checked="checked"/> <label for="cycle_type3" class="w100 h100">間隔で指定</label>
	<div id="cycle_type3_form" class="cycle_form"<!--{if $arrForm.cycle_type != 3}--> style="display:none;"<!--{/if}-->>
        <div id="cycle_interval_start_date_area" style="display:inline;">
            <div class="mgt10">初回
                <div class="custom-select2 w50">
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
         </div>
         <div class="mgt10">
            <div class="custom-select2">
                <select name="cycle_interval_interval" class="regular_cycle_select" id="cycle_interval_interval">
                <!--{foreach from=$regular_product.$key1 key=key item=val}-->
                    <option value="<!--{$val}-->" <!--{if $arrForm.cycle_interval_interval == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_interval.$val}--></option>
                <!--{/foreach}-->
                </select>
            </div>
            間隔でお届け	
        </div>
	</div>
</dd>
<!--{/if}-->
<dd>	
	  
         <!--お届け予定日-->
         <div id="regular-delive_date">
            <p class="txt_b">▼お届け予定日</p>
            <ul>
              <li><div class="delivday_box">初回 &nbsp; &nbsp;<span id="regular_deliv_day_first" class="regular_deliv_day"></span><br /><!-- 1回目のお届け予定日です。カレンダーを使う場合は消しても大丈夫です --></div></li>
              <li><div class="delivday_box">二回目 &nbsp; &nbsp;<span id="regular_deliv_day_second" class="regular_deliv_day"></span><!-- 2回目のお届け予定日です。カレンダーを使う場合は消しても大丈夫です --></div></li>
            </ul>
        </div>
       <!--お届け最短希望日-->
      	<div id="regular-short_date" style="display: none;">
          <span class="smp-lp-error"><!--{$arrErr.cycle_type}--></span>
            <div class="short_delivebox">
              <!--{if $first_auto}-->
              <input style="margin-left:0;" type="checkbox" name="first_quick_flg" id="first_quick_flg" value="1" <!--{if $arrForm.first_quick_flg == 1}-->checked="checked"<!--{/if}-->/>
              <label for="first_quick_flg">初回は最短でお届けする</label>
              
              <!--{else}-->
              <input type="checkbox" name="quick_flg" id="quick_flg" value="1" <!--{if $arrForm.quick_flg == 1}-->checked="checked"<!--{/if}--> /> <label for="quick_flg">初回は最短でお届けする</label>
              <!--{/if}-->
            </div>
        </div>
        
      </div>  
</dd>
<!--{/if}-->

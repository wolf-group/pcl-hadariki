<!--▼CONTENTS-->
<div id="mypagecolumn">
	<div class="head">
		<h2 class="t_mypage">マイページ
        <!--{* ポイント表示 *}-->
        <!--{if $tpl_point}--><!--{include file=$tpl_point}--><!--{/if}-->
        </h2>
	</div>
	<!--{include file=$tpl_navi}-->
	<div id="mycontentsarea">
		<div class="mycont_head">
			<h3>定期購入お届け先情報変更【確認】</h3>
		</div>
		<p class="mgb20">
            定期コースの次回のお届け先から下記のお届け先に<br />
            変更致しますがよろしいでしょうか？
        </p>

		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="complete" />
			<input type="hidden" name="customer_id" value="<!--{$arrForm.customer_id|escape}-->" />
			<input type="hidden" name="order_id" value="<!--{$arrForm.order_id|escape}-->" />
			<!--{foreach from=$arrForm key=key item=item}-->
			<!--{if $key ne "mode" && $key ne "subm"}-->
				<input type="hidden" name="<!--{$key|escape}-->" value="<!--{$item|escape}-->" />
			<!--{/if}-->
			<!--{/foreach}-->
			<div class="mg_change">
                <table summary="定期購入お届け先情報変更" >
                    <tr>
                        <th style="width:30%;">受注ID(申込)</th>
                        <td><!--{$arrForm.order_id|escape}--></td>
                    </tr>
                    <tr>
                        <!--{assign var=key1 value="deliv_name01"}-->
                        <!--{assign var=key2 value="deliv_name02"}-->
                        <th style="width:30%;">お名前</th>
                        <td><!--{$arrForm.$key1|escape}-->　<!--{$arrForm.$key2|escape}--></td>
                    </tr>
                    <tr>
                        <!--{assign var=key1 value="deliv_kana01"}-->
                        <!--{assign var=key2 value="deliv_kana02"}-->
                        <th>お名前（フリガナ）</th>
                        <td><!--{$arrForm.$key1|escape}-->　<!--{$arrForm.$key2|escape}--></td>
                    </tr>
                    <tr>
                        <!--{assign var=key1 value="deliv_zip01"}-->
                        <!--{assign var=key2 value="deliv_zip02"}-->
                        <th>郵便番号</th>
                        <td><!--{$arrForm.$key1}-->-<!--{$arrForm.$key2}--></td>
                    </tr>
                    <tr>
                        <!--{assign var=key1 value="deliv_addr01"}-->
                        <!--{assign var=key2 value="deliv_addr02"}-->
                        <!--{assign var=key3 value="deliv_pref"}-->
                        <!--{assign var=key4 value=$arrForm.$key3}-->
                        <th>住所</th>
                        <td><!--{$arrPref.$key4}--><!--{$arrForm.$key1|escape}--><!--{$arrForm.$key2|escape}--></td>
                    </tr>
                    <tr>
                        <!--{assign var=key1 value="deliv_tel01"}-->
                        <!--{assign var=key2 value="deliv_tel02"}-->
                        <!--{assign var=key3 value="deliv_tel03"}-->
                        <th>電話番号</th>
                        <td><!--{$arrForm.$key1|escape}-->-<!--{$arrForm.$key2}-->-<!--{$arrForm.$key3}--></td>
                    </tr>
                    
                    </table>
                    <!--{if $arrForm.edit_customer_addr or $arrForm.edit_regular_master_deliv_addr}-->
                    <div class="p_waku3">
                          <!--{if $arrForm.edit_customer_addr}-->
                                  <p class="attention">※ 会員登録情報の住所も一緒に変更する</p>
                          <!--{/if}-->
                          <!--{if $arrForm.edit_regular_master_deliv_addr}-->
                                  <p class="attention">※ 全ての定期注文のお届け先住所も、変更した住所に変更する</p>
                          <!--{/if}-->
                    </div>
                    <!--{/if}-->
                   
                   <div class="btn_rpst3_2">
                        <span class="btn_prev"><a href="#" onclick="document.form1['mode'].value='return';document.form1.submit();">前のページへ</a></span>
                   </div> 
                    
                <ul class="btn_area_n2">
                    <li class="btn">
                        <span class="btn_next"><a href="#" onclick="document.form1.submit();">変更を確定する</a></span>
                    </li>
                </ul>
           </div> 
		</form>
	</div>
</div>
<!--▲CONTENTS-->

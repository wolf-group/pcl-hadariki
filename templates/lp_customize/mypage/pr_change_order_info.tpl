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
			<h3>定期購入お届け先情報変更</h3>
		</div>
		<p class="mgb20">
		下記項目にご入力ください。<br />
		入力後、一番下の「確認ページへ」ボタンをクリックしてください。
		</p>
		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
		<input type="hidden" name="mode" value="confirm" />
		<input type="hidden" name="customer_id" value="<!--{$arrForm.customer_id|escape}-->" />
		<input type="hidden" name="order_id" value="<!--{$arrForm.order_id|escape}-->" />
         <div class="mg_change">
            <table summary="定期購入お届け先情報変更">
                <tr>
                    <th>受注ID</th>
                    <td colspan="2">
                        <!--{$arrForm.order_id|escape}-->
                    </td>
                </tr>
                <tr>
                    <th width="150px">お名前</th>
                    <th width="50px"><span class="required">必須</span></th>
                    <td>
                        <!--{assign var=key1 value="deliv_name01"}-->
                        <!--{assign var=key2 value="deliv_name02"}-->
                        姓&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm.$key1}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.$key1|sfGetErrorColor}-->; ime-mode: active;" class="box120" />&nbsp;
                        名&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm.$key2}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.$key2|sfGetErrorColor}-->; ime-mode: active;" class="box120" />
                        <div class="attention"><!--{$arrErr.$key1}--><!--{$arrErr.key2}--></div>
                    </td>
                </tr>
                <tr>
                    <th>お名前（フリガナ）</th>
                    <th width="50px"><span class="required">必須</span></th>
                    <td>
                        <!--{assign var=key1 value="deliv_kana01"}-->
                        <!--{assign var=key2 value="deliv_kana02"}-->
                        セイ&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm.$key1}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.$key1|sfGetErrorColor}-->; ime-mode: active;" class="box120" />&nbsp;
                        メイ&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm.$key2}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.$key2|sfGetErrorColor}-->; ime-mode: active;" class="box120" />
                        <div class="attention"><!--{$arrErr.$key1}--><!--{$arrErr.$key2}--></div>
                    </td>
                </tr>
                <tr>
                    <th>郵便番号</th>
                    <th width="50px"><span class="required">必須</span></th>
                    <td>
                        〒&nbsp;<input type="text" name="deliv_zip" value="<!--{$arrForm.deliv_zip}-->" 
                          maxlength="<!--{$smarty.const.ZIP01_LEN+$smarty.const.ZIP02_LEN}-->" style="<!--{$arrErr.deliv_zip|sfGetErrorColor}-->; ime-mode: disabled;" class="box120" />&nbsp;
                        <span class="zipimg">
                            <a href="<!--{$smarty.const.URL_DIR}-->input_zip.php" onclick="fnCallAddress_ex('<!--{$smarty.const.URL_INPUT_ZIP}-->', 'deliv_zip', 'deliv_pref', 'deliv_addr01'); return false;" target="_blank">
                                <span class="zip_bt">住所自動入力</span>
                            </a>
                        </span>
                        <div class="attention"><!--{$arrErr.deliv_zip}--></div>
                    </td>
                </tr>
                <tr>
                    <th>住所</th>
                    <th width="50px"><span class="required">必須</span></th>
                    <td>
                        <!--{assign var=key1 value="deliv_addr01"}-->
                        <!--{assign var=key2 value="deliv_addr02"}-->
                        <!--{assign var=key3 value="deliv_pref"}-->
                        <div class="custom-selectbox w30">
                            <select name="<!--{$key3}-->" style="<!--{$arrErr.$key|sfGetErrorColor}-->">
                                <option value="" selected="selected">都道府県を選択</option>
                                <!--{html_options options=$arrPref selected=$arrForm.$key3}-->
                            </select>
                        </div>
                        <div class="mgt10">
                            <!--{$smarty.const.SAMPLE_ADDRESS1}--><br />
                            <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm.$key1}-->" class="box300" style="<!--{$arrErr.$key1|sfGetErrorColor}-->; ime-mode: active;" /><br />
                        </div>
    
                        <div class="mgt10">
                            <!--{$smarty.const.SAMPLE_ADDRESS2}--><br />
                            <input type="text" name="<!--{$key2}-->" value="<!--{$arrForm.$key2}-->" class="box300" style="<!--{$arrErr.$key2|sfGetErrorColor}-->; ime-mode: active;" /><br />
                        </div>
                        <span class="attention"><!--{$arrErr.$key3}--><!--{$arrErr.addr01}--><!--{$arrErr.addr02}--></span>
                        <p class="mini mgt10"><em>住所は2つに分けてご記入いただけます。マンション名は必ず記入してください。</em></p>
                    </td>
                </tr>
                <tr>
                    <th>電話番号</th>
                    <th width="50px"><span class="required">必須</span></th>
                    <td>
                        <input type="text" name="deliv_tel" value="<!--{$arrForm.deliv_tel}-->" maxlength="<!--{$smarty.const.TEL_LEN}-->" 
                         style="<!--{$arrErr.deliv_tel|sfGetErrorColor}-->; ime-mode: disabled;" class="box300"/>
                        <div class="attention"><!--{$arrErr.deliv_tel}--></div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div class="p_waku3">
                            <input type="checkbox" id="edit_customer_addr" name="edit_customer_addr" value="1">
                            <label for="edit_customer_addr">会員登録情報の住所も一緒に変更する</label>
                        </div>
                        <div id="change_deliv" style="display: none;">
                            <div class="p_waku3">
                                <input type="checkbox" id="edit_regular_master_deliv_addr" name="edit_regular_master_deliv_addr" value="1">
                                <label for="edit_regular_master_deliv_addr">全ての定期注文のお届け先住所も変更する</label>
                            </div>
                        </div>
                        
                    </td>
                </tr>
                
            </table>
            <div class="btn_rpst3_2">
                    <span class="btn_prev"><a href="javascript:void(0);" onclick="document.form1['action']='<!--{$smarty.session.mypage_from|escape}-->';document.form1.submit();">前のページへ</a></span>
            </div>
            <ul class="btn_area_n2">
                <li class="btn">
                    <span class="btn_next"><a href="javascript:void(0);" onclick="document.form1.submit();">確認ページへ</a></span>
                </li>
            </ul>
        </div>
		</form>
	</div>
</div>
<!--▲CONTENTS-->
<script type="text/javascript">

$('#edit_customer_addr').change(function(){
	if ($(this).is(':checked')) {
		$('#change_deliv').show();
	} else {
		$('#change_deliv').hide();
		$('#edit_regular_master_deliv_addr').prop("checked",false);
	}
});

</script>

<style type="text/css">
input, select, textarea{background-color: #ddd;}
</style>

<script>
$(function(){
  $("input, select, textarea").one("focus",function(){
     $(this).css("background","rgba(255,200,200,0.7)");
  }).blur(function(){ /*フォーカスが外れたとき*/
      if($(this).val()==""){ /*何も入力されていないなら*/
        $(this).css("background","#ddd").one("focus",function(){
               $(this).css("background","#ddd");
          });
       }
      else{
        $(this).css("background","#fff").one("focus",function(){
               $(this).css("background","#fff");
          }); 
      }
    });
});
</script>


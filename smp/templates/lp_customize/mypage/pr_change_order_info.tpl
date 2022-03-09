<!--▼CONTENTS-->
<div id="mypagecolumn">
    <div class="pankuzuarea">
        <p>
            <a href="/smp/">HOME</a> 
            &gt; <a href="/smp/mypage/login.php">マイページ</a> 
            &gt; <a href="./change_order_info.php">定期購入お届け先情報変更</a>
        </p>
    </div>	
    <div class="mypage_inner">
		<h3>定期購入お届け先情報変更</h3>
        <ol class="step_bar box_horizon border_box step1">
            <li class="step_bar_item item1"><p class="step_bar_txt">1.入力</p></li>
            <li class="step_bar_item item2"><p class="step_bar_txt">2.確認</p></li>
            <li class="step_bar_item item3"><p class="step_bar_txt">3.完了</p></li>
        </ol>
		<p class="pd10">入力後、一番下の「確認ページへ」ボタンをクリックしてください。</p>
		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="confirm" />
			<input type="hidden" name="customer_id" value="<!--{$arrForm.customer_id|escape}-->" />
			<input type="hidden" name="order_id" value="<!--{$arrForm.order_id|escape}-->" />
			<div class="mg_change">
				<dl>
					<dt>受注ID</dt>
					<dd>
						<!--{$arrForm.order_id|escape}-->
					</dd>
					<dt>お名前<span class="required">必須</span></dt>
					<dd>
						<!--{assign var=key1 value="deliv_name01"}-->
						<!--{assign var=key2 value="deliv_name02"}-->
						<input type="text" class="boxHarf text h30" placeholder="姓" name="<!--{$key1}-->" value="<!--{$arrForm.$key1}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.$key1|sfGetErrorColor}-->;" />&nbsp;
						<input type="text" class="boxHarf text h30" placeholder="名" name="<!--{$key2}-->" value="<!--{$arrForm.$key2}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.$key2|sfGetErrorColor}-->;" />
						<div class="mg_attention"><!--{$arrErr.$key1}--><!--{$arrErr.$key2}--></div>
					</dd>
					<dt>お名前（フリガナ）<span class="required">必須</span></dt>
					<dd>
						<!--{assign var=key1 value="deliv_kana01"}-->
						<!--{assign var=key2 value="deliv_kana02"}-->
						<input type="text" class="boxHarf text h30" placeholder="セイ" name="<!--{$key1}-->" value="<!--{$arrForm.$key1}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.$key1|sfGetErrorColor}-->;" />&nbsp;
						<input type="text" class="boxHarf text h30" placeholder="メイ" name="<!--{$key2}-->" value="<!--{$arrForm.$key2}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.$key2|sfGetErrorColor}-->;" />
						<div class="mg_attention"><!--{$arrErr.$key1}--><!--{$arrErr.$key2}--></div>
					</dd>
					<dt>郵便番号<span class="required">必須</span></dt>
                    <dd>
                        <!--{assign var=key1 value="deliv_zip01"}-->
                        <!--{assign var=key2 value="deliv_zip02"}-->
                        <!--{assign var=key3 value="deliv_zip"}-->
                        <span class="mg_attention"><!--{$arrErr[$key3]}--></span>
                        〒&nbsp;
                        <input type="text" class="boxHarf text h30" placeholder="1234567" name="deliv_zip" value="<!--{$arrForm.$key1}--><!--{$arrForm.$key2}-->" maxlength="<!--{$smarty.const.ZIP01_LEN+$smarty.const.ZIP02_LEN}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->;" size="10" inputmode="numeric"/>&nbsp;
                        <span class="zipimg">
                            <!--<input type="image" src="<!--{$TPL_DIR}-->img/common/btn_address_input.jpg" alt="住所自動入力" name = "mode" value = "address" onclick="document.form1.mode.value='address';"/>-->
                            <a href="<!--{$smarty.const.URL_INPUT_ZIP}-->" onclick="fnCallAddress_ex('<!--{$smarty.const.URL_INPUT_ZIP}-->', 'deliv_zip', 'deliv_pref', 'deliv_addr01'); return false;" target="_blank">
                                <span class="zip_bt">住所自動入力</span>
                            </a>
                        </span>
                        <br />
                        <span class="mg_attention"><!--{$message}--></span>
                    </dd>
					<dt>住所<span class="required">必須</span></dt>
					<dd>
						<!--{assign var=key1 value="deliv_addr01"}-->
						<!--{assign var=key2 value="deliv_addr02"}-->
						<!--{assign var=key3 value="deliv_pref"}-->
						<div class="custom-selectbox w40">
                            <select name="<!--{$key3}-->" style="<!--{$arrErr.pref|sfGetErrorColor}-->" >
                                <option value="" selected="selected">都道府県を選択</option>
                                <!--{html_options options=$arrPref selected=$arrForm.$key3}-->
                            </select>
						</div>
                        <div class="mini_add">
                            <p><!--{$smarty.const.SAMPLE_ADDRESS1}--></p>
                            <p><input type="text" class="boxLong top text h30" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS1}-->" name="<!--{$key1}-->" value="<!--{$arrForm.$key1}-->" size="60" style="<!--{$arrErr.$key1|sfGetErrorColor}-->;" /></p>
						</div>
                        <div class="mini_add">
                            <p><!--{$smarty.const.SAMPLE_ADDRESS2}--></p>
                            <p>
                                <input type="text" class="boxLong top text h30" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS2}-->" name="<!--{$key2}-->" value="<!--{$arrForm.$key2}-->" size="60" style="<!--{$arrErr.$key2|sfGetErrorColor}-->;" />
                            </p>
                        </div>
						<span class="mg_attention"><!--{$arrErr.$key3}--><!--{$arrErr.$key1}--><!--{$arrErr.$key2}--></span>
						<div class="mg_attention">住所は2つに分けてご記入いただけます。<br />マンション名は必ず記入してください。</div>
					</dd>
					<dt>電話番号<span class="required">必須</span></dt>
                    <dd>
                        <!--{assign var=key1 value="deliv_tel01"}-->
                        <!--{assign var=key2 value="deliv_tel02"}-->
                        <!--{assign var=key3 value="deliv_tel03"}-->
                        <input type="text" class="boxLong top text h30" placeholder="09012345678" name="deliv_tel" value="<!--{$arrForm.$key1}--><!--{$arrForm.$key2}--><!--{$arrForm.$key3}-->" maxlength="<!--{$smarty.const.TEL_LEN}-->" style="<!--{if $arrErr.$key1 or $arrErr.$key2 or $arrErr.$key3}--><!--{assign var=telerror value="error"}--><!--{else}--><!--{assign var=telerror value=""}--><!--{/if}--><!--{$telerror|sfGetErrorColor}-->" size="40" inputmode="numeric"/>
                    </dd>
                    <dt></dt>
                    <dd>
                        <div class="p_waku2">
                            <input type="checkbox" id="edit_customer_addr" name="edit_customer_addr" value="1">
                            <label for="edit_customer_addr">会員登録情報も一緒に変更する</label>
                        </div>
                        <div id="change_deliv" style="display: none;">
                            <div class="p_waku2">
                                <input type="checkbox" id="edit_regular_master_deliv_addr" name="edit_regular_master_deliv_addr" value="1">
                                <label for="edit_regular_master_deliv_addr">全ての定期注文のお届け先情報も<br />一緒に変更する</label>
                            </div>
                        </div>
                    </dd>
				</dl>
			</div>
		</form>
	</div>
	<ul>
		<li class="mg_newbtn">
			<a href="javascript:void(0);" onclick="document.form1.submit();">確認ページへ</a>
		</li>
	</ul>
    
    <div class="mypage_back">
        <a href="<!--{$smarty.session.mypage_from|escape}-->">
            <div class="mg_back">戻る<input type="hidden" name="change" id="change" /></div>
        </a>
    </div>
    
</div>
<!--▲CONTENTS-->

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

$('#edit_customer_addr').change(function(){
    if ($(this).is(':checked')) {
        $('#change_deliv').show();
    } else {
        $('#change_deliv').hide();
        $('#edit_regular_master_deliv_addr').prop("checked",false);
    }
});
</script>

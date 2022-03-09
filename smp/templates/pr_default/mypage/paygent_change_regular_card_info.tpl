<!--▼CONTENTS-->
<script type="text/javascript">
//<![CDATA[
var done = {};
done.card_no1 = false;
done.card_no2 = false;
done.card_no3 = false;

function next(now, next) {
	if (now.value.length >= now.getAttribute('maxlength') && !done[now.name]) {
		next.focus();
		done[now.name] = true;
	} else if (now.value.length < now.getAttribute('maxlength')) {
		done[now.name] = false;
	}
}
//]]>
</script>
<div id="mypagecolumn">
	<div class="pankuzuarea">
    	<p style="letter-spacing:0.01em;font-size:80%;"><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./card_info.php">ご利用カード情報</a></p>
    </div>
	<div class="mypage_inner">
		<form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="confirm" />
			<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$token}-->" />
			<!--{if $tpl_edit_flg == true}-->
		    <!--{assign var=key value="card_info_id"}-->
		    <input type="hidden" name="<!--{$key}-->" value="<!--{$arrForm[$key].value}-->" />
		    <!--{/if}-->
			<h3>ご利用カード情報の登録・変更(定期/頒布会)</h3>
			<ol class="step_bar box_horizon border_box step1">
                <li class="step_bar_item item1"><p class="step_bar_txt">1.入力</p></li>
                <li class="step_bar_item item2"><p class="step_bar_txt">2.確認</p></li>
                <li class="step_bar_item item3"><p class="step_bar_txt">3.完了</p></li>
        	</ol>
            <div class="info_change">
				<h4 class="mycont_headttl">決済情報の入力</h4>
				<dl>

                    <dt>カード番号<span class="required">必須</span></dt>
					<dd>
						<span class="attention"><!--{$arrErr.card_no}--></span>
						<input type="text"
						name="card_no"
						value="<!--{$arrForm.card_no.value|escape}-->"
						maxlength="16"
						style="<!--{$arrErr.card_no|sfGetErrorColor}-->"
						class="boxLong text h30"
                        size="24"
                        placeholder="1234567890123456"
                        inputmode="numeric"/>
						<p class="bg_red">半角入力(例：1234-5678-9012-3456)</p>
					</dd>
					<dt>有効期限<span class="required">必須</span></dt>
					<dd>
						<!--{assign var=key1 value="card_expiration_month"}-->
						<!--{assign var=key2 value="card_expiration_year"}-->
						<span class="attention"><!--{$arrErr[$key1]}--></span>
						<span class="attention"><!--{$arrErr[$key2]}--></span>
						<div class="custom-selectbox w30">
                            <select name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|escape}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" >
                            <option value="">--</option>
                            <!--{html_options options=$arrMonth selected=$arrForm[$key1].value|escape}-->
                            </select>
                        </div>
                        <span class="pdlr5">月 / </span>
						<div class="custom-selectbox w30">
                            <select name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|escape}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" >
                            <option value="">--</option>
                            <!--{html_options options=$arrYear selected=$arrForm[$key2].value|substr:-2|escape}-->
                            </select>
                        </div>
                        <span class="pdlr5">年</span>
					</dd>
					<dt>カード名義(ローマ字氏名)<span class="required">必須</span></dt>
					<dd>
						<!--{assign var=key1 value="card_holder_name1"}-->
						<!--{assign var=key2 value="card_holder_name2"}-->
						<span class="attention"><!--{$arrErr[$key1]}--></span>
						<span class="attention"><!--{$arrErr[$key2]}--></span>
						名:&nbsp;<input type="text"
						name="<!--{$key1}-->"
						value="<!--{$arrForm[$key1].value|escape}-->"
						maxlength="<!--{$arrForm[$key1].length}-->"
						style="<!--{$arrErr[$key1]|sfGetErrorColor}-->"
						size="15"
						class="boxMedium2 text h30"
                        placeholder="TAROU">&nbsp;&nbsp;
						姓:&nbsp;<input type="text"
						name="<!--{$key2}-->"
						value="<!--{$arrForm[$key2].value|escape}-->"
						maxlength="<!--{$arrForm[$key2].length}-->"
						class="boxMedium2 text h30"
						style="<!--{$arrErr[$key2]|sfGetErrorColor}-->"
						size="15" placeholder="YAMADA"><br />
						<p class="bg_red">半角入力(例：TAROU&nbsp;YAMADA)</p>
					</dd>
<!--{captcha_form_cc_mypage}-->
				</dl>
			</div>

			<ul>
				<li class="mg_newbtn">
					<a href="javascript:void(0);" onclick="paygent_token_send();">確認ページへ</a>
					<input type="hidden" name="refusal" id="refusal" />
				</li>
			</ul>

            <div class="mypage_back">
                <a href="./card_info.php">
                    <div class="mg_back">戻る<input type="hidden" name="back" id="back" /></div>
                </a>
    	    </div>
		</form>
	</div>
</div>
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

<script type="text/javascript" src="<!--{$smarty.const.URL_DIR}-->js/mask.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript">
var sm = null;
$(document).ready(function() {
	sm = new ScreenMask($);
	$('#form1').bind('submit' , function() {
		sm.append();
		return true; 
	});
});
</script>
<!--▼CONTENTS-->
<div id="mypagecolumn">
	<div class="pankuzuarea">
    	<p style="letter-spacing:0.01em;font-size:80%;"><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./zeus_card_info.php">ご利用カード情報</a></p>
    </div>	
    
	<div class="mypage_inner">
		<form id="form1" name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="complete" />
			<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$token}-->" />
			<input type="hidden" name="zeus_token_key" value="<!--{$zeus_token_key|escape}-->" />
			<!--{if $send_id}-->
			<input type="hidden" name="send_id" value="<!--{$send_id|escape}-->" />
			<!--{/if}-->
			<h3>ご利用カード情報の登録・変更【確認】</h3>
			<ol class="step_bar box_horizon border_box step1">
                <li class="step_bar_item item2"><p class="step_bar_txt">1.入力</p></li>
                <li class="step_bar_item item1"><p class="step_bar_txt">2.確認</p></li>
                <li class="step_bar_item item3"><p class="step_bar_txt">3.完了</p></li>
        	</ol>	
            <div id="zeus_new_card_area" class="info_change pdt5">
				<h4 class="mycont_headttl">確認ページ</h4>
				<dl>
					<dt>カード番号</dt>
					<dd>
						<!--{$card_num|escape}-->
					</dd>
					<dt>有効期限</dt>
					<dd>
						<!--{$expires_month|escape}-->月&nbsp;/&nbsp;<!--{$expires_year|escape}-->年
					</dd>
					<dt>カード名義(ローマ字氏名)</dt>
					<dd>
						<!--{$CardName|escape}-->
					</dd>
				</dl>
			</div>

			<ul>
				<li class="mg_newbtn">
					<a href="javascript:void(0);" onclick="document.form1.submit();">送&nbsp;信</a>
					<input type="hidden" name="complete" id="complete" />
				</li>
			</ul>
			 <div class="mypage_back">
                <a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('return', '', ''); return false;" >
                    <div class="mg_back">戻る<input type="hidden" name="back" id="back" /></div>
                </a>
    	    </div>
            
		</form>
	</div>
</div>

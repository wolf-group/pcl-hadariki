<script type="text/javascript" src="<!--{$smarty.const.URL_DIR}-->js/mask.js" ></script>
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
    	<p style="letter-spacing:0.01em;font-size:80%;"><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./card_info.php">カード情報</a></p>
    </div>	
	<div class="mypage_inner">
		<form id="form1" name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="register" />
			<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$token}-->" />
			<!--{foreach from=$arrHidden item=value key=key}-->
			<input type="hidden" name="<!--{$key}-->" value="<!--{$value|escape}-->" />
			<!--{/foreach}-->
			<h3>ご利用カード情報の登録・変更(定期/頒布会) 【完了】</h3>
			<ol class="step_bar box_horizon border_box step1">
                <li class="step_bar_item item2"><p class="step_bar_txt">1.入力</p></li>
                <li class="step_bar_item item1"><p class="step_bar_txt">2.確認</p></li>
                <li class="step_bar_item item3"><p class="step_bar_txt">3.完了</p></li>
        	</ol>	
            <div class="info_change pdt5">
				<h4 class="mycont_headttl">確認ページ</h4>
				<dl>
					<dt>カード番号</dt>
					<dd>
						<!--{assign var=key1 value="card_no1"}-->
						<!--{assign var=key2 value="card_no2"}-->
						<!--{assign var=key3 value="card_no3"}-->
						<!--{assign var=key4 value="card_no4"}-->
						<!--{$arrForm[$key1].value}-->-<!--{$arrForm[$key2].value}-->-<!--{$arrForm[$key3].value}-->-<!--{$arrForm[$key4].value}-->
					</dd>
					<dt>有効期限</dt>
					<dd>
						<!--{assign var=key1 value="card_expiration_month"}-->
						<!--{assign var=key2 value="card_expiration_year"}-->
						<!--{$arrForm[$key1].value}-->月&nbsp;/&nbsp;<!--{$arrForm[$key2].value}-->年
					</dd>
					<dt>カード名義(ローマ字氏名)</dt>
					<dd>
						<!--{assign var=key1 value="card_holder_name1"}-->
						<!--{assign var=key2 value="card_holder_name2"}-->
						名:<!--{$arrForm[$key1].value}-->&nbsp;姓:<!--{$arrForm[$key2].value}-->
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

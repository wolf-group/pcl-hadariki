<!--▼CONTENTS-->
<div id="mypagecolumn">
	<div class="mypage_inner">
		<form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="complete" />
			<input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
			<h3>退会手続き</h3>
			<div id="completetext1">
				<p class="pd10">
                いままでご利用ありがとうございました。<br />
                退会手続きを実行して下さい。</p>
				<ul>
					<li class="mg_newbtn">
						<a href="javascript:void(0);" onclick="document.form1.submit();">退会する<input type="hidden" name="refusal_yes" id="refusal_yes" /></a>
					</li>
                    <li class="refusal_no">
                    	<a href="./refusal.php">いいえ、退会しません<input type="hidden" name="refusal_no" id="refusal_no" /></a>
                    </li>
				</ul>
			</div>
			<div class="attention_box">
                  <div class="at_ttl">※注意事項※</div>
                  <p>手続きが完了した時点で、現在保存されている購入履歴や、お届け先等の情報はすべてなくなりますのでご注意ください。</p>
			</div>           
            	
      </form>
	</div>
</div>
<!--▲CONTENTS-->

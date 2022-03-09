<!--▼CONTENTS-->
<div id="mypagecolumn">
	<div id="mypage_inner">
		<h3>定期購入お届け先情報変更【完了】</h3>
		<ol class="step_bar box_horizon border_box step1">
            <li class="step_bar_item item2"><p class="step_bar_txt">1.入力</p></li>
            <li class="step_bar_item item4"><p class="step_bar_txt">2.確認</p></li>
            <li class="step_bar_item_here item3"><p class="step_bar_txt">3.完了</p></li>
   	    </ol>
        <form name="form1" action="./history.php" method="post">
			<input type="hidden" name="order_id" value="<!--{$smarty.session.customer.edited_info_order_id}-->">
			<div id="completetext">
				<p class="changetext">
                <span class="textred">定期購入お届け先情報の変更が<br />完了いたしました。</span>
					<a href="#" onclick="document.form1.submit();">
                    	<div class="mg_dtbtn4">確認</div>
                    </a>
				</p>
			</div>
		</form>
        <div class="mypage_back">
            <div class="mg_back">
                    <a href="./index.php">マイページTOPへ<input type="hidden" name="change" id="change" /></a>
            </div>
    	</div>
	</div>
</div>
<!--▲CONTENTS-->

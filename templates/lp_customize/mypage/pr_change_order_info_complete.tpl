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
        <h3>定期購入お届け先情報変更【完了】</h3>
    </div>
        <form name="form1" action="./history.php" method="post">
        <input type="hidden" name="order_id" value="<!--{$smarty.session.customer.edited_info_order_id}-->">
            <div id="completetext">
                <p class="changetext">定期購入お届け先情報の変更が完了いたしました。</p>
                <div style="text-align:center;">
                    <div class="mgb10">【受注ID:<!--{$smarty.session.customer.edited_info_order_id}-->】</div>
                     <div class="mg_dtbtn3"><a href="#" onclick="document.form1.submit();">確認はこちら</a></div>
                 </div>
                
            </div>

            <ul class="btn_area_l2">
                <li class="btn2">
                    <span class="btn_prev"><a href="/index.php">TOPページへ</a></span>
                </li>
            </ul>
        </form>
    </div>
</div>
<!--▲CONTENTS-->

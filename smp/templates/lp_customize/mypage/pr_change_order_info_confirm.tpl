<!--▼CONTENTS-->
<div id="mypagecolumn">
	<div class="mypage_inner">
		<h3>定期購入お届け先情報変更【確認】</h3>
		<ol class="step_bar box_horizon border_box step1">
            <li class="step_bar_item item2"><p class="step_bar_txt">1.入力</p></li>
            <li class="step_bar_item item1"><p class="step_bar_txt">2.確認</p></li>
            <li class="step_bar_item item3"><p class="step_bar_txt">3.完了</p></li>
        </ol>		
        <p class="pd10">定期コースの次回のお届け先から下記のお届け先に変更致しますがよろしいでしょうか？</p>
		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="complete" />
			<input type="hidden" name="customer_id" value="<!--{$arrForm.customer_id|escape}-->" />
			<input type="hidden" name="order_id" value="<!--{$arrForm.order_id|escape}-->" />
			<!--{foreach from=$arrForm key=key item=item}-->
				<!--{if $key ne "mode" && $key ne "subm"}-->
					<input type="hidden" name="<!--{$key|escape}-->" value="<!--{$item|escape}-->" />
				<!--{/if}-->
			<!--{/foreach}-->
			<div class="info_change">
			<h4 class="mycont_headttl">確認ページ</h4>	
                <dl>
					<dt>お名前</dt>
					<dd><!--{$arrForm.deliv_name01|escape}-->　<!--{$arrForm.deliv_name02|escape}--></dd>
					<dt>お名前（ﾌﾘｶﾞﾅ）</dt>
					<dd><!--{$arrForm.deliv_kana01|escape}-->　<!--{$arrForm.deliv_kana02|escape}--></dd>
					<dt>郵便番号</dt>
					<dd><!--{$arrForm.deliv_zip01}-->-<!--{$arrForm.deliv_zip02}--></dd>
					<dt>住所</dt>
					<dd><!--{$arrPref[$arrForm.deliv_pref]}--><!--{$arrForm.deliv_addr01|escape}--><!--{$arrForm.deliv_addr02|escape}--></dd>
					<dt>電話番号</dt>
					<dd><!--{$arrForm.deliv_tel01|escape}-->-<!--{$arrForm.deliv_tel02}-->-<!--{$arrForm.deliv_tel03}--></dd>
                    <!--{if $arrForm.edit_customer_addr}-->
                    <dt>会員登録情報の同時変更</span></dt>
                    <dd><span class="attention fts_03">会員登録情報も上記内容に変更します</span></dd>
                    <!--{/if}-->
                    <!--{if $arrForm.edit_regular_master_deliv_addr}-->
                    <dt>定期注文お届け先情報の同時変更</span></dt>
                    <dd><span class="attention fts_03">全ての定期注文のお届け先情報も上記内容に変更します</span></dd>
                    <!--{/if}-->
				</dl>
			</div>
		</form>
	</div>    
	
    <ul>     
		<li class="mg_newbtn">
			<a href="javascript:void(0);" onclick="document.form1.submit();">変更を確定する</a>
		</li>
	</ul>
    <div class="mypage_back">
    	<div class="mg_back">
        	<a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('return', '', ''); return false;" >戻る</a>
        </div>
    </div> 
      
</div>
<!--▲CONTENTS-->

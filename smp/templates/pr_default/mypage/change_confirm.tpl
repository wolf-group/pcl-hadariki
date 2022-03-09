<!--▼CONTENTS-->
<div id="mypagecolumn">
	<div class="mypage_inner">
		<h3>基本会員情報の変更・確認【確認】</h3>
		<ol class="step_bar box_horizon border_box step1">
            <li class="step_bar_item item2"><p class="step_bar_txt">1.入力</p></li>
            <li class="step_bar_item item1"><p class="step_bar_txt">2.確認</p></li>
            <li class="step_bar_item item3"><p class="step_bar_txt">3.完了</p></li>
        </ol>
        <p class="pd10">下記の内容で送信してもよろしいでしょうか？<br />
		よろしければ、一番下の「送信」ボタンをクリックしてください。</p>
		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="complete" />
			<!--{foreach from=$arrForm key=key item=item}-->
				<!--{if $key ne "mode" && $key ne "subm"}-->
					<input type="hidden" name="<!--{$key|escape}-->" value="<!--{$item|escape}-->" />
				<!--{/if}-->
			<!--{/foreach}-->
			<div class="mg_change">
				<dl>
					<dt>お名前</dt>
					<dd><!--{$arrForm.name01|escape}-->　<!--{$arrForm.name02|escape}--></dd>
					<dt>お名前（ﾌﾘｶﾞﾅ）</dt>
					<dd><!--{$arrForm.kana01|escape}-->　<!--{$arrForm.kana02|escape}--></dd>
					<dt>郵便番号</dt>
					<dd><!--{$arrForm.zip01|escape}-->-<!--{$arrForm.zip02|escape}--></dd>
					<dt>住所</dt>
					<dd><!--{$arrPref[$arrForm.pref]|escape}--><!--{$arrForm.addr01|escape}--><!--{$arrForm.addr02|escape}--></dd>
					<dt>電話番号</dt>
					<dd><!--{$arrForm.tel01|escape}-->-<!--{$arrForm.tel02|escape}-->-<!--{$arrForm.tel03|escape}--></dd>
					<dt>FAX</dt>
					<dd><!--{if strlen($arrForm.fax01) > 0}--><!--{$arrForm.fax01|escape}-->-<!--{$arrForm.fax02|escape}-->-<!--{$arrForm.fax03|escape}--><!--{else}-->未登録<!--{/if}--></dd>
					<dt>職業</dt>
					<dd><!--{$arrJob[$arrForm.job]|escape|default:"未登録"}--></dd>
					<dt>メールアドレス</dt>
					<dd><a href="<!--{$arrForm.email|escape:'hex'}-->"><!--{$arrForm.email|escape:'hexentity'}--></a></dd>
					<dt>携帯メールアドレス</dt>
					<dd>
						<!--{if strlen($arrForm.email_mobile) > 0}-->
							<a href="<!--{$arrForm.email_mobile|escape:'hex'}-->"><!--{$arrForm.email_mobile|escape:'hexentity'}--></a>
						<!--{else}-->
							未登録
						<!--{/if}-->

					</dd>
					<dt>パスワード</dt>
					<dd><!--{$passlen}--></dd>
					<!--{if $arrMailCompulsionView eq "OFF"}-->
						<dt>メールマガジン送付について</dt>
						<dd><!--{$arrMAILMAGATYPE_TwoWay[$arrForm.mailmaga_flg]|escape}--></dd>
					<!--{/if}-->
					<!--{if $arrForm.edit_regular_master_deliv_addr}-->
						<dt>定期注文お届け先情報の同時変更</dt>
						<dd><span class="mg_attention">全ての定期注文のお届け先情報も同時に変更します</span></dd>
					<!--{/if}-->
					<!--{if $arrForm.year && $arrForm.year !== '----'}-->
						<dt>生年月日</dt>
						<dd><!--{$arrForm.year|escape}-->年<!--{$arrForm.month|escape}-->月<!--{$arrForm.day|escape}-->日</dd>
					<!--{/if}-->
				</dl>
			</div>
		</form>
	</div>
	<ul>
		<li class="mg_newbtn">
			<a href="javascript:void(0);" onclick="document.form1.submit();">送 信<input type="hidden" name="complete" id="complete" /></a>
		</li>
	</ul>
    <div class="mypage_back">
        	<a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('return', '', ''); return false;" >
            	<div class="mg_back">戻る<input type="hidden" name="back" id="back" /></div>
            </a>
    </div>

</div>
<!--▲CONTENTS-->

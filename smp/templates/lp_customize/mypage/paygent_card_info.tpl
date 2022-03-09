<script type="text/javascript">
var intervalId = null;
$(document).ready(function() {
	<!--{if $tpl_change_msg}-->
	intervalId = null;
	$('#change_msg').fadeIn('normal' , function() {
		intervalId = setInterval(fadeOutMsg , 2000);
	});
	<!--{/if}-->
});

function fadeOutMsg()
{
	$('#change_msg').fadeOut('slow' , function() {clearInterval(intervalId);});	
}

/**
 * カード情報変更ページへの遷移
 * @param integer card_info_id
 * @param integer regular_flg
 * @return void
 */
function changeCardInfo(card_info_id , regular_flg)
{
	$('input[name="card_info_id"]').val(card_info_id);
	$('input[name="regular_flg"]').val(regular_flg);
	if (regular_flg == 0) {
		$('form[name="form1"]').attr('action' , './change_card_info.php').submit();
	}
	else {
		$('form[name="form1"]').attr('action' , './change_regular_card_info.php').submit();
	}
}
</script>
<!--▼CONTENTS-->
<div id="mypagecolumn">
<div class="pankuzuarea">
		<p style="letter-spacing:0.01em;font-size:80%;"><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./card_info.php">ご利用カード情報</a></p>
	</div>
	<div class="mypage_inner">
	
		<div class="mypage_point">
			<form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
				<input type="hidden" name="mode" value="pre_edit" />
				<input type="hidden" name="card_info_id" value="" />
				<input type="hidden" name="regular_flg" value="" />
				<h3>ご利用カード情報の変更・確認</h3>
				<p class="pd10">現在登録されているクレジットカード情報の確認や変更、また新規で追加することができます。</p>
				<div id="change_msg" class="attention" style="display:none">
					<!--{$tpl_change_msg|escape}-->
				</div>
				<h4 class="mycont_headttl">▼登録済みクレジットカード</h4>
				<div class="info_change">
					<!--{if $tpl_old_paygent_flg}-->
					<h3>お買い物で通常使うカード</h3>
					<!--{/if}-->
					<!--{if $arrSavedCardInfo.normal}-->
						<!--{foreach from=$arrSavedCardInfo.normal item=card_info_normal key=idx}-->
					<table>
						<tr>
							<th colspan="2">
								<!--{$idx+1}-->枚目&nbsp;
							</th>
						</tr>
						<tr>
							<th>カード番号</th>
							<td>
								<!--{$card_info_normal.card_number}-->
							</td
						></tr>
						<tr>
							<th>有効期限</th>
							<td>
								<!--{$card_info_normal.expiration_month}-->月&nbsp;/&nbsp;<!--{$card_info_normal.expiration_year}-->年
							</td>
						</tr>
						<tr>
							<th>カード名義</th>
							<td>
								<!--{$card_info_normal.cardholder_name}-->
							</td>
						</tr>
						<tr>
							<th>カード会社</th>
							<td>
								<!--{$card_info_normal.company_name}-->
							</td>
						</tr>
						<tr>
							<th>有効性チェック</th>
							<td><!--{$card_info_normal.card_status}--></td>
						</tr>
					</table>    
					<ul>
						<li class="mg_cardbtn">
						<a href="#" onclick="changeCardInfo(<!--{$card_info_normal.card_info_id}--> , 0)">カード情報を変更する</a>
						</li>
					</ul>
						<!--{/foreach}-->
						<!--{if $register_button_flg}-->
					<ul class="btnbox">
						<li class="mg_cardbtn2">
						<a href="./change_card_info.php">カード情報の新規登録はこちらから</a>
						</li>
					</ul>
						<!--{/if}-->
					<!--{else}-->
					  <p class="no_data1">登録されているカード情報はありません。</p>
					  
					  <ul class="btnbox">
						 <li class="mg_cardbtn2">
						 <a href="./change_card_info.php">カード情報の新規登録はこちらから</a>
						</li>
					  </ul>
					<!--{/if}-->
				 </div>
				 <!--{if $tpl_old_paygent_flg}-->
				<div class="info_change">
					<h3>定期購入・頒布会用利用時に使うカード</h3>
					<!--{if $arrSavedCardInfo.regular}-->
					<!--{foreach from=$arrSavedCardInfo.regular item=card_info key=idx}-->
					<table>
						<tr>
							<th colspan="2">
								<!--{$idx+1}-->枚目&nbsp;
							</th>
						</tr>
						<tr>
							<th>カード番号</th>
							<td><!--{$card_info.card_number}--></td>
						</tr>
						<tr>
							<th>有効期限</th>
							<td>
								<!--{$card_info.expiration_month}-->月&nbsp;/&nbsp;<!--{$card_info.expiration_year}-->年
							</td>
						</tr>
						<tr>
							<th>カード名義</th>
							<td><!--{$card_info.cardholder_name}--></td>
						</tr>
						<tr>
							<th>カード会社</th>
							<td><!--{$card_info.company_name}--></td>
						</tr>
						<tr>
							<th>有効性チェック</th>
							<td><!--{$card_info.card_status}--></td>
						</tr>
					</table>
					<div class="mg_cardbtn">
						<a href="#" onclick="changeCardInfo(<!--{$card_info.card_info_id}--> , 1)">カード情報を変更する</a>
					</div>
					<!--{/foreach}-->
					<!--{else}-->
						<p class="no_data1">登録されているカード情報はありません。</p>
						<div class="mg_attention pdb10">※定期購入/頒布会用カード情報の登録は変更のみ可能です。</div>
					<!--{/if}-->
					
				</div>
				<!--{/if}-->
				<div class="mypage_back">
                    <a href="./index.php">
                        <div class="mg_back">戻る<input type="hidden" name="change" id="change" /></div>
                    </a>
		  		</div>
				
			</form>
		</div>
	</div>
</div>

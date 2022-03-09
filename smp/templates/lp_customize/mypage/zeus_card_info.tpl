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
</script>
<!--▼CONTENTS-->
<div id="mypagecolumn">
<div class="pankuzuarea">
		<p style="letter-spacing:0.01em;font-size:80%;"><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./card_info.php">ご利用カード情報</a></p>
	</div>
	<div class="mypage_inner">
	
		<div class="mypage_point">
			<form name="form1" method="post" action="./zeus_change_card_info.php">
				<input type="hidden" name="mode" value="" />
				<input type="hidden" name="send_id" value="" />
				<h3>ご利用カード情報の変更・確認</h3>
				<p class="pd10">現在登録されているクレジットカード情報の確認や変更、また新規で追加することができます。</p>
				<div id="change_msg" class="attention">
                <!--{$tpl_result_msg|escape|nl2br}-->
				</div>
				<h4 class="mycont_headttl">▼登録済みクレジットカード</h4>
				<div class="info_change">
                <!--{if !$noSavedCard}-->
                <!--{foreach from=$arrSavedCardInfo item=card_info key=send_id name=card_info}-->
					<table>
						<tr>
							<th colspan="2">
                                <!--{$smarty.foreach.card_info.iteration|escape}-->枚目&nbsp;
							</th>
						</tr>
						<tr>
							<th>カード番号</th>
							<td>
                                <!--{$card_info.card_num|escape}-->
							</td>
                        </tr>
						<tr>
							<th>有効期限</th>
							<td>
                                    <!--{$card_info.expires_month|escape}-->月&nbsp;/&nbsp;<!--{$card_info.expires_year|escape}-->年
							</td>
						</tr>
						<tr>
							<th>カード会社</th>
							<td>
                                <!--{$card_info.card_company|escape}-->
							</td>
						</tr>
					</table>    
					<ul>
						<li class="mg_cardbtn">
						<a href="#" class="edit-card-info" data-send-id="<!--{$send_id}-->">カード情報を変更する</a>
                        </li>
					</ul>
				<!--{/foreach}-->
					<!--{if $register_button_flg}-->
					<ul class="btnbox">
						<li class="mg_cardbtn2">
						<a href="./zeus_change_card_info.php">カード情報の新規登録はこちらから</a>
						</li>
					</ul>
					<!--{/if}-->
				<!--{else}-->
					  <p class="no_data1">登録されているカード情報はありません。</p>
					  
					  <ul class="btnbox">
						 <li class="mg_cardbtn2">
						 <a href="./zeus_change_card_info.php">カード情報の新規登録はこちらから</a>
						</li>
					  </ul>
				<!--{/if}-->
				 </div>

				<div class="mypage_back">
                    <a href="./index.php">
                        <div class="mg_back">戻る<input type="hidden" name="change" id="change" /></div>
                    </a>
		  		</div>
				
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
    /**
     * カード情報変更ページへの遷移
    
     */
    $('.edit-card-info').on('click',function(){
        $('input[name="send_id"]').val($(this).data('sendId'));
        $('input[name="mode"]').val('editCardInfo');
        $('form[name="form1"]').attr('action' , './zeus_change_card_info.php').submit();
    });
});
</script>
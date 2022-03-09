<!--{php}-->
	$original_logo = '';//original_pc_flasharea_image
	$tmp = glob(HTML_PATH.'img/pc_top_logo/original_pc_flasharea_image*');
	if(isset($tmp[0]) && $tmp[0] && preg_match('|([^\/]+)$|',$tmp[0],$cap)){
		$original_pc_flasharea_image = $cap[1];
		$this->assign('original_pc_flasharea_image',$original_pc_flasharea_image);
	}
<!--{/php}-->
<div id="flasharea">
	<!--{if $original_pc_flasharea_image}-->
		<img src="/img/pc_top_logo/<!--{$original_pc_flasharea_image|escape}-->?<!--{$smarty.const.FRONT_IMG_VERSION|escape}-->" alt="precs" title="precs" />
	<!--{else}-->
    <!--▼スライダー▼-->
	<div class="flexslider" style="margin-top: 4px;width:100%;">
		<ul class="slides">
			<li><a href=""><img src="<!--{$TPL_DIR}-->img/main/main_pic.jpg" alt="precs" title="precs" /></a></li>
			<li><a href=""><img src="<!--{$TPL_DIR}-->img/main/main_pic.jpg" alt="precs" title="precs" /></a></li>
			<li><a href=""><img src="<!--{$TPL_DIR}-->img/main/main_pic.jpg" alt="precs" title="precs" /></a></li>
			<li><a href=""><img src="<!--{$TPL_DIR}-->img/main/main_pic.jpg" alt="precs" title="precs" /></a></li>
			<li><a href=""><img src="<!--{$TPL_DIR}-->img/main/main_pic.jpg" alt="precs" title="precs" /></a></li>
			<li><a href=""><img src="<!--{$TPL_DIR}-->img/main/main_pic.jpg" alt="precs" title="precs" /></a></li>
		</ul>
	</div>
   <!--▲スライダー　エンド▲-->
   	<!--{/if}-->
</div>


<div id="magazine_window">
<form name="mail_magazine_form" id="mail_magazine_form">
	<span class="err" id="maga_mail"></span>
	<input type="text" name="mail" id="mail" value="" class="maga_input" title="メールアドレス" />
	<input type="hidden" name="mode" value="save_ajax" />
	<input type="button" name="maga_btn" value="登録" id="maga_btn" class="mgz_btn" />
</form>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$('#maga_btn').click(function(){
		var opt = {};
		var err = {};
		var flg = false;
		$('#mail_magazine_form').find(':input').each(function(){
			var n = $(this).attr('name');
			var v = $(this).val();
			err[n] = '';
			opt[n] = v;
			if(v=='') {
				err[n] = '必須項目です。';
				flg = true;
			}
		});
		
		if(flg){
			for(var k in err){
				$('#maga_'+k).html(err[k]+'<br />');
			}
			return false;
		}
		$.ajax({
			type: 'post',
			url: '/mail/mail_magazine.php',
			data: opt,
			success: function(res){
				if(res=='ok'){
					$('#magazine_window').html('<div class="pda5">ご登録ありがとうございました。確認メールをお送りしました。</div>');
				}else{
					alert(res);
				}
			},
		});
	});
	
	$('#mail').keypress(function (e) {
		if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
			var opt = {};
			var err = {};
			var flg = false;
			$('#mail_magazine_form').find(':input').each(function(){
				var n = $(this).attr('name');
				var v = $(this).val();
				err[n] = '';
				opt[n] = v;
				if(v=='') {
					err[n] = '必須項目です。';
					flg = true;
				}
			});
			
			if(flg){
				for(var k in err){
					$('#maga_'+k).html(err[k]+'<br />');
				}
				return false;
			}
			$.ajax({
				type: 'post',
				url: '/mail/mail_magazine.php',
				data: opt,
				success: function(res){
					if(res=='ok'){
						$('#magazine_window').html('<div class="pda5">ご登録ありがとうございました。確認メールをお送りしました。</div>');
					}else{
						alert(res);
					}
				},
			});
			return false;
		}
	});
	
	$('input[title]').each(function() {
		if($(this).val() === '') {$(this).val($(this).attr('title'));}
		$(this).focus(function() {
			if($(this).val() === $(this).attr('title')) {$(this).val('').addClass('focused');}
		});
		$(this).blur(function() {
			if($(this).val() === '') {$(this).val($(this).attr('title')).removeClass('focused');}
		});
	});
});
</script>

<div id="entrycolumn">
	<div class="entry_inner">
		<h2>ご利用規約</h2>
		<h3>▼ まだ会員登録されていないお客様</h3>
		<p class="attention">【重要】会員登録をされる前に、下記ご利用規約をよくお読みください。</p>
		<ul>
			<li class="nm_btn">
				<a href="./kiyaku_smp.php">会員登録規約</a>
			</li>
		</ul>
		<p style="font-size:11px;">
			※規約には、本サービスを使用するに当たってのあなたの権利と義務が規定されております。
		</p>
		<!--{if $tpl_use_smp_kara_mail}-->
			<div class="mailbtn" style="display:none;margin:5px;">
				<p>
					以下の<span style="color:#0000ff;font-weight:bold;">「空メール送信」</span>ボタンをクリックして<em>空メールを送信</em>していただきますと､こちらから返信メールが届きます。<br />
					<em>返信メール本文中のURLをクリック</em>して次の手続きへとお進み下さい。<br />
					<br />
					空メール送信後<em><!--{$smarty.const.EXTEND_COOKIE_EXPIRE_HOUR}-->時間以内</em>に返信メール本文中のURLをクリックしていただきますようお願い致します。<br />
					<br />
					返信メールが届かない場合、<em>迷惑メール</em>として振り分けられている可能性もございます。<br />
					<br />
					システム側からのメールが届かない場合は<a href="./mail_help.php">こちら</a>をご参照下さい。
					<br />
				</p>
			</div>
		<!--{/if}-->
	</div>
</div>
<ul>
	<li class="sp_btn">
		<!--{if $tpl_use_smp_kara_mail}-->
			<a class="mailbtn" style="display:none;" href="mailto:smp_new@<!--{$smarty.const.MOBILE_KARA_MAIL_ADDRESS_DOMAIN}-->?subject=<!--{'そのまま送信してください。'|urlencode}-->&body=<!--{$session}-->%0D%0A%0D%0A<!--{$test|urlencode}-->">
			空メール送信<input type="hidden" name="log" id="log" /></a>
		<!--{else}-->
			<a href="<!--{$smarty.const.URL_DIR|escape}-->smp/entry/index.php">会員登録</a>
		<!--{/if}-->
	</li>
</ul>
<!--{if $tpl_use_smp_kara_mail}-->
	<script type="text/javascript">
	var t = parseInt( new Date() / 1000 );
	document.cookie = 'cchk=' + t + ';';
	document.getElementsByClassName('mailbtn')[0].style.display = 'block';
	document.getElementsByClassName('mailbtn')[1].style.display = 'block';
	if(getCookie('cchk') != t){
		document.getElementsByClassName('mailbtn')[0].style.display = 'none';
		document.getElementsByClassName('mailbtn')[1].style.display = 'none';
		var el = document.createElement('p');
		var b  = document.getElementById('top');
		el.innerHTML = '<p style="color:red;text-align:left;">※ご購入頂く場合には、ブラウザのクッキーを有効にしてご利用下さい.<br />クッキーの設定については<a href="./cookie_help.php">こちら</a>をご参照下さい。</p>'; 
		document.getElementsByTagName("body").item(0).insertBefore(el,b);
	}
	function getCookie(cookieName) {
		var mt  = ('; ' + document.cookie + ';').match(new RegExp('; ' + cookieName + '=([^;]*);'));
		if(!mt || !mt[1] || mt[1]==null || mt[1]==undefined){
			return null;
		}
		return  mt[1];
	}
	</script>
<!--{/if}-->
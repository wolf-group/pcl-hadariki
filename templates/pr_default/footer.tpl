<!--▼FOOTER-->
<div id="pagetop">
	<div id="pagetop_inner">
		<div class="button">
			<a href="#wrap"><p id="page-top">▲ PAGE TOP</p></a>
		</div>
	</div>
</div>
<div id="footer">
	<div id="footer_inner">
		<ul>
			<li><a href="/abouts/index.php">当サイトについて</a></li>
			<li><a href="/contact/index.php">お問い合わせ</a></li>
			<li><a href="/order/index.php">特定商取引に関する法律</a></li>
			<li><a href="/returning/index.php">返品について</a></li>
			<li><a href="/privacy/index.php">プライバシーポリシー</a></li>
		</ul>
		<br>
			<div class="copyright">
			<!--{$arrSiteInfo.copyright_pc|escape|replace:'&amp;copy;':'&copy;'}--><!--{* ←HTMLエスケープするが、&copy;を含む場合はエスケープせずに表示 *}-->
			</div>
	</div>
</div>
<!--▲FOTTER-->

<script type="text/javascript">
$(function() {
	var topBtn = $('#page-top');	
	//スクロールしてトップ
    topBtn.click(function () {
		$('body,html').animate({
			scrollTop: 0
		}, 500);
		return false;
    });
});
</script>
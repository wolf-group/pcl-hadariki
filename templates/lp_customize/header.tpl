
<!--▼HEADER-->
<div id="header">
	<div id="head_inner">
		<div id="logo_space">
			<h1>
				<a href="https://precious-clab.com/">
					<em><!--{$arrSiteInfo.shop_name|escape}-->/<!--{$tpl_title|escape}--></em>
				</a>
			</h1>
		</div>

	<!--ヘッダー上部ボタンを表示する場合はこちらを解除-->
		<div id="information">
			<ul>
				<!--{if 'basis-lp_only'|get_option_use_flg == false}-->
				<li class="info_mp">
					<form name="login_form2" id="login_form2" method="post" action="<!--{$smarty.const.SSL_URL|escape}-->frontparts/login_check.php" onsubmit="return fnCheckLogin('login_form')">
						<input type="hidden" name="mode" value="login" />
						<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$transactionid|escape}-->" />
						<input type="hidden" name="__PHPSESID" value="<!--{php}-->echo session_id();<!--{/php}-->" />
						<input type="hidden" name="url" value="<!--{$smarty.server.PHP_SELF|escape}-->" />
						<!--{if $tpl_login}-->
							<!--{if !$tpl_disable_logout}-->
							<a href="<!--{$smarty.const.URL_DIR}-->mypage/index.php">マイページ<input type="hidden" name="subm" /></a>
							<a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnFormModeSubmit('login_form2', 'logout', '', ''); return false;">
							    ログアウト
							</a>
							<!--{/if}-->
						<!--{else}-->
							<a href="<!--{$smarty.const.URL_DIR}-->mypage/login.php">ログイン<input type="hidden" name="subm" /></a>
						<!--{/if}-->
					</form>
				</li>
				<!--{/if}-->
				<!-- <li class="info_sc"><a href="/cart/index.php">カートを見る</a></li> -->
			</ul>
		</div>
				
	</div>
</div>
<!--▲HEADER-->

<!--{php}-->
	$original_pc_logo = '';
	$tmp = glob(HTML_PATH.'img/pc_top_logo/original_pc_logo*');
	if(isset($tmp[0]) && $tmp[0] && preg_match('|([^\/]+)$|',$tmp[0],$cap)){
		$original_pc_logo = $cap[1];
		$this->assign('original_pc_logo',$original_pc_logo);
	}
	// check new version
	if(glob(DATA_PATH.'site_data/front_pc_logo.{png,jpg,gif}',GLOB_BRACE)){
		$this->assign('is_new',true);
		$ext = '';
		if(is_file(DATA_PATH.'site_data/front_pc_logo.png')){
			$ext = 'png';
		}elseif(is_file(DATA_PATH.'site_data/front_pc_logo.jpg')){
			$ext = 'jpg';
		}elseif(is_file(DATA_PATH.'site_data/front_pc_logo.gif')){
			$ext = 'gif';
		}
		$this->assign('ext',$ext);
	}else{
		$this->assign('is_new',false);
	}
<!--{/php}-->
<style>
<!--{if $original_pc_logo || $is_new}-->
div#logo_space a {
	float: left;
	display: block;
	margin: 10px 0 10px 10px;
	width: 200px;
	height: 70px;
	<!--{if $is_new}-->
		background: url("<!--{$smarty.const.URL_DIR}-->resize_image.php?site_logo=front_pc_logo.<!--{$ext}-->&width=200&height=70");
	<!--{else}-->
		background: url("<!--{$smarty.const.URL_DIR}-->img/pc_top_logo/<!--{$original_pc_logo}-->");
	<!--{/if}-->
	background-repeat: no-repeat;
}
<!--{/if}-->
</style>
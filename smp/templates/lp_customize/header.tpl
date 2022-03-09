<!--▼HEADER-->
<!--{php}-->
	// check new version
	if(glob(DATA_PATH.'site_data/front_smp_logo.{png,jpg,gif}',GLOB_BRACE)){
		$this->assign('is_new',true);
		$ext = '';
		if(is_file(DATA_PATH.'site_data/front_smp_logo.png')){
			$ext = 'png';
		}elseif(is_file(DATA_PATH.'site_data/front_smp_logo.jpg')){
			$ext = 'jpg';
		}elseif(is_file(DATA_PATH.'site_data/front_smp_logo.gif')){
			$ext = 'gif';
		}
		$this->assign('ext',$ext);
	}else{
		$this->assign('is_new',false);
	}
<!--{/php}-->
<div id="header">
	<div id="header_left">
		<a href="https://precious-clab.com/">
		<!--{* 管理画面でTOP画像が設定されている場合 *}-->
		<!--{if $is_new}-->
			<img src="<!--{$smarty.const.URL_DIR}-->resize_image.php?site_logo=front_smp_logo.<!--{$ext}-->&width=100&height=50"/>
		<!--{elseif $smarty.const.S_TOP_LOGO != ''}-->
			<img src="<!--{$smarty.const.URL_DIR}-->resize_image.php?smp_logo=<!--{$smarty.const.S_TOP_LOGO}-->&width=100&height=50" />
		<!--{elseif $smarty.const.S_TEMPLATE_NAME == 'pr_default'}-->
			<img src="<!--{$TPL_DIR}-->img/header/logo.png" />
		<!--{/if}-->
		</a>
	</div>
	<div id="header_right">
		<ul>
			<!--{if 'basis-lp_only'|get_option_use_flg == false}-->
				<li class="h_btn">
					<span class="btn_touroku"><a href="/smp/entry/kiyaku.php">会員登録</a></span>
				</li> 
				<li class="h_btn">
					<span class="btn_mypage"><a href="/smp/mypage/login.php">マイページ</a></span>
				</li>
			<!--{/if}-->
			<li class="h_btn">
				<span class="btn_cart"><a href="/smp/cart/index.php">カート</a></span>
			</li>
		</ul>
	</div>
</div>
<!--▲HEADER-->
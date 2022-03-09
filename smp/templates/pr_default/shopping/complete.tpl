<div id="shoppingcolumn">
<!--{if $including_complete_tpl_path !== null}-->
<!--{    safe_include file=$including_complete_tpl_path}-->
<!--{ else }-->
	<div class="shopping_inner">
		<h2>ご注文完了</h2>
		<!-- ▼クレジット(コンビニ)決済 -->
		<!--{if $arrModuleParam.module_id > 0 }-->
			<img src="<!--{$smarty.const.CREDIT_HTTP_ANALYZE_URL}-->?mid=<!--{$arrModuleParam.module_id}-->&tid=<!--{$arrModuleParam.payment_total}-->&pid=<!--{$arrModuleParam.payment_id}-->" width="0" height="0" border="0" style="width: 0px; height: 0px" />
		<!--{/if}-->
		<!-- ▲クレジット(コンビニ)決済 -->
		<!-- ▼その他決済情報を表示する場合は表示 -->
		<!--{if $arrOther.title.value }-->
			<p>
				<em>■<!--{$arrOther.title.name}-->情報</em><br />
				<!--{foreach key=key item=item from=$arrOther}-->
					<!--{if $key != "title"}-->
						<!--{if $item.name != ""}-->
							<!--{$item.name}-->：
						<!--{/if}-->
						<!--{$item.value|nl2br}--><br />
					<!--{/if}-->
				<!--{/foreach}-->
			</p>
		<!--{/if}-->
		<!-- ▲コンビニ決済の場合には表示 -->
	</div>
    <!--{* LINE連携ボタンを表示したい場合はコメントアウトを外してください *}-->
    <!--
    <!--{if 'basis-line_app'|get_option_use_flg}-->
    <div class="shopping_inner">
        <p class="centertd">
        <!--{if $tpl_login && '' == $smarty.session.line_app_token_info.mid}-->
            ※ LINEアカウントと連携されるとLINEアカウントが友だち追加されてお知らせがLINEで受け取れます。<br />
            <a href="<!--{get_line_url|escape}-->"><img src="/img/line/line_button081_m_r.png" alt="LINE連携"/></a><br />
        <!--{/if}-->
        </p>
    </div>
    <!--{/if}-->
    -->
	<div class="shopping_inner">
		<p class="centertd">
			<em><!--{$arrInfo.shop_name|escape}-->の商品をご購入いただき、<br />ありがとうございました。</em>
			<br />お客様のご注文番号は<!--{$arrInfo.orderid}-->です。
		</p>
		<p style="font-size:10px">
			ただいま、ご注文の確認メールをお送りさせていただきました。<br />
			万一、ご確認メールが届かない場合は、トラブルの可能性もありますので大変お手数ではございますがもう一度お問い合わせいただくか、お電話にてお問い合わせくださいませ。<br />
			今後ともご愛顧賜りますようよろしくお願い申し上げます。
		</p>
		<p>
			<!--{$arrInfo.shop_name|escape}--><br />
			TEL：<!--{$arrInfo.tel01}-->-<!--{$arrInfo.tel02}-->-<!--{$arrInfo.tel03}--> <!--{if $arrInfo.business_hour != ""}--><br />
			（受付時間/<!--{$arrInfo.business_hour|escape}-->）<!--{/if}--><br />
			E-mail：<br /><a href="mailto:<!--{$arrInfo.email02|escape:'hex'}-->"><!--{$arrInfo.email02|escape:'hexentity'}--></a>
		</p>
	</div>
	<div class="sp_btn">
		<!--{if $is_campaign}-->
			<a href="<!--{$smarty.const.CAMPAIGN_URL}--><!--{$campaign_dir}-->/smp/index.php">トップページへ</a>
		<!--{else}-->
			<a href="/smp/index.php">トップページへ</a>
		<!--{/if}-->
	</div>
<!--{ /if }-->
</div>
<!--{assign var=af_tpl value=`$smarty.const.DATA_PATH`site_data/smp_affiliate_tag.tpl}-->
<!--{if $af_tpl|is_file}-->
	<!--{include file=`$af_tpl`}-->
<!--{/if}-->

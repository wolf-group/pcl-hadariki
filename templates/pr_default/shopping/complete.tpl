<!--{*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2007 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *}-->

<!--▼CONTENTS-->
<div id="shoppingcolumn">
	<!--Start Flow Area-->
	<!--{if $lp_flg}-->
		<div style="margin:0 auto; text-align:center;">
			<img src="<!--{$TPL_DIR}-->img/shopping/lp_flow03.png" style="margin:0 auto;" />
		</div>
	<!--{else}-->
		<div class="flowarea">
			<!--{if !$tpl_login || $reg_flg == 1}-->
				<!--{if $arrGAOrder.payment_id|sfIsPaygentConveni || $arrGAOrder.memo03  == 'CONVENI'}-->
					<img src="<!--{$TPL_DIR}-->img/shopping/n_step5_convini.png" style="margin:0 auto;" />
				<!--{elseif $arrGAOrder.payment_id|sfIsPaygentCredit || $arrGAOrder.memo03 == '###'}-->
					<img src="<!--{$TPL_DIR}-->img/shopping/n_step5_credit.png" style="margin:0 auto;" />
				<!--{else}-->
					<img src="<!--{$TPL_DIR}-->img/shopping/flow04.png" style="margin:0 auto;" />
				<!--{/if}-->
			<!--{else}-->
				<!--{if $arrGAOrder.payment_id|sfIsPaygentConveni || $arrGAOrder.module_code == 'mdl_gmopg_conveni'}-->
					<img src="<!--{$TPL_DIR}-->img/shopping/m_step4-convini.png" style="margin:0 auto;" />
				<!--{elseif $arrGAOrder.payment_id|sfIsPaygentCredit || $arrGAOrder.module_code == 'mdl_gmopg'}-->
					<img src="<!--{$TPL_DIR}-->img/shopping/m_step4-credit.png" style="margin:0 auto;" />
				<!--{else}-->
					<img src="<!--{$TPL_DIR}-->img/shopping/flow06-3.png" style="margin:0 auto;" />
				<!--{/if}-->
			<!--{/if}-->
		</div>
	<!--{/if}-->
	<!--End Flow Area-->
<!--{if $including_complete_tpl_path !== null}-->
<!--{    safe_include file=$including_complete_tpl_path}-->
<!--{ else }-->
	<div class="head">
		<h2 class="t_comp">ご注文完了</h2>
	</div>
	<!-- ▼クレジット(コンビニ)決済 -->
		<!--{if $arrModuleParam.module_id > 0 }-->
			<img src="<!--{$smarty.const.CREDIT_HTTP_ANALYZE_URL}-->?mid=<!--{$arrModuleParam.module_id}-->&tid=<!--{$arrModuleParam.payment_total}-->&pid=<!--{$arrModuleParam.payment_id}-->" width="0" height="0" border="0" style="width: 0px; height: 0px" />
		<!--{/if}-->
	<!-- ▲クレジット(コンビニ)決済 -->
	<!-- ▼その他決済情報を表示する場合は表示 -->
		<!--{if $arrOther.title.value }-->
			<p><em>■<!--{$arrOther.title.name}-->情報</em><br />
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
        <div>
            <p class="centertd">
                <!--{* LINE連携ボタンを表示したい場合はコメントアウトを外してください *}-->
                <!--
                <!--{if 'basis-line_app'|get_option_use_flg && $tpl_login && '' == $smarty.session.line_app_token_info.mid}-->
                    ※ LINEアカウントと連携されるとLINEアカウントが友だち追加されてお知らせがLINEで受け取れます。<br />
                    <a href="<!--{get_line_url|escape}-->"><img src="/img/line/line_button081_m_r.png" alt="LINE連携"/></a><br />
                <!--{/if}-->
                -->
            </p>
        </div>
		<div id="completetext">
			<em><!--{$arrInfo.shop_name|escape}-->の商品をご購入いただき、ありがとうございました。</em>
            <!--{if $paygent_atobarai_flg}-->
            <p>現在、後払いの審査判定中です。審査結果については別途ご連絡いたします。</p>
            <!--{/if}-->
			<p>お客様のご注文番号は<!--{$arrInfo.orderid}-->です。</p>
			<p>ただいま、ご注文の確認メールをお送りさせていただきました。<br />
			万一、ご確認メールが届かない場合は、トラブルの可能性もありますので大変お手数ではございますがもう一度お問い合わせいただくか、お電話にてお問い合わせくださいませ。<br />
			今後ともご愛顧賜りますようよろしくお願い申し上げます。</p>

			<p><!--{$arrInfo.shop_name|escape}--><br />
				TEL：<!--{$arrInfo.tel01}-->-<!--{$arrInfo.tel02}-->-<!--{$arrInfo.tel03}--> <!--{if $arrInfo.business_hour != ""}-->（受付時間/<!--{$arrInfo.business_hour|escape}-->）<!--{/if}--><br />
				E-mail：<a href="mailto:<!--{$arrInfo.email02|escape:'hex'}-->"><!--{$arrInfo.email02|escape:'hexentity'}--></a></p>
		</div>

	<ul class="btn_area_l2">
		<!--{if $is_campaign}-->
			<li class="btn2">
				<span class="btn_prev"><a href="<!--{$smarty.const.CAMPAIGN_URL}--><!--{$campaign_dir}-->/index.php">トップページへ<input type="hidden" name="b_toppage" /></a></span>
			</li>
		<!--{else}-->
			<li class="btn2">
				<span class="btn_prev"><a href="/">トップページへ</a></span>
			</li>
		<!--{/if}-->
	</ul>
<!--{ /if }-->
</div>
<!--▲CONTENTS-->
<!--{$conversion_text|escape}-->
<!--{assign var=pc_affiliate_tag_file_name value=`$smarty.const.DATA_PATH`site_data/pc_affiliate_tag.tpl}-->
<!--{if $pc_affiliate_tag_file_name|is_file}-->
	<!--{include file=$pc_affiliate_tag_file_name}-->
<!--{/if}-->

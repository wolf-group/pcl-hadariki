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
<div id="guidecolumn">
		<div class="head">
			<h2 class="t_contact">お問い合わせ</h2>
		</div>
    <div id="completetext">
      お問い合わせ内容の送信が完了いたしました。<br />
      万一、ご回答メールが届かない場合は、トラブルの可能性もありますので大変お手数ではございますがもう一度お問い合わせいただくか、お電話にてお問い合わせください。<br />
      今後ともご愛顧賜りますようよろしくお願い申し上げます。
    <p><!--{$arrSiteInfo.company_name|escape}--><br />
      TEL：<!--{$arrSiteInfo.tel01}-->-<!--{$arrSiteInfo.tel02}-->-<!--{$arrSiteInfo.tel03}-->
       <!--{if $arrSiteInfo.business_hour != ""}-->
      （受付時間/<!--{$arrSiteInfo.business_hour}-->）
       <!--{/if}--><br />
      E-mail：<a href="mailto:<!--{$arrSiteInfo.email02|escape:'hex'}-->"><!--{$arrSiteInfo.email02|escape:'hexentity'}--></a></p>
    </div>
		<ul class="btn_area_l2">
			<!--{if $is_campaign}-->
			<li class="btn2">
				<span class="btn_prev">
					<a href="<!--{$smarty.const.CAMPAIGN_URL}--><!--{$campaign_dir}-->/index.php">トップページへ<input type="hidden" name="b_toppage" id="b_toppage" /></a>
				</span>
			</li>
		<!--{else}-->
			<li class="btn2">
				<span class="btn_prev">
					<a href="/">トップページへ</a>
				</span>
			</li>
		</ul>

	<!--{/if}-->
    </div>
</div>


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
			<h2 class="t_entry">会員登録</h2>
		</div>
    <div id="completetext">
      <em>会員登録の受付が完了いたしました。</em>
      <p>現在<em>仮会員</em>の状態です。<br />
        ご入力いただいたメールアドレス宛てに、ご連絡が届いておりますので、本会員登録になった上でお買い物をお楽しみください。<br />
        今後ともご愛顧賜りますようよろしくお願い申し上げます。</p>

      <p><!--{$arrSiteInfo.company_name|escape}--><br />
        TEL：<!--{$arrSiteInfo.tel01}-->-<!--{$arrSiteInfo.tel02}-->-<!--{$arrSiteInfo.tel03}--> <!--{if $arrSiteInfo.business_hour != ""}-->（受付時間/<!--{$arrSiteInfo.business_hour}-->）<!--{/if}--><br />
        E-mail：<a href="mailto:<!--{$arrSiteInfo.email02|escape:'hex'}-->"><!--{$arrSiteInfo.email02|escape:'hexentity'}--></a>
      </p>

	<ul class="btn_area_l">
	<!--{if $is_campaign}-->
		<li class="btn"><span class="btn_prev"><a href="<!--{$smarty.const.URL_SHOP_TOP}-->">トップページへ"<input type="hidden" name="b_toppage" id="b_toppage" /></a></span></li>
        <!--{else}-->
		<li class="btn"><span class="btn_prev"><a href="<!--{$smarty.const.URL_DIR}-->index.php">トップページへ<input type="hidden" name="b_toppage" id="b_toppage" /></a></span></li>
        <!--{/if}-->
	</ul>
    </div>
</div>
<!--▲CONTENTS-->

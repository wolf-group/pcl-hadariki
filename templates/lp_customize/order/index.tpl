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
			<h2 class="t_order">特定商取引に関する法律に基づく表記</h2>
		</div>
    <table summary="特定商取引に関する法律に基づく表記">
      <tr>
        <th>販売業者</th>
        <td><!--{$arrRet.law_company|escape}--></td>
      </tr>
      <tr>
        <th>運営責任者</th>
        <td><!--{$arrRet.law_manager|escape}--></td>
      </tr>
      <tr>
        <th>住所</th>
        <td>〒<!--{$arrRet.law_zip01|escape}-->-<!--{$arrRet.law_zip02|escape}--><br /><!--{$arrPref[$arrRet.law_pref]|escape}--><!--{$arrRet.law_addr01|escape}--><!--{$arrRet.law_addr02|escape}--></td>
      </tr>
      <tr>
        <th>電話番号</th>
        <td><!--{$arrRet.law_tel01|escape}-->-<!--{$arrRet.law_tel02|escape}-->-<!--{$arrRet.law_tel03|escape}--></td>
      </tr>
      <tr>
        <th>FAX番号</th>
        <td><!--{$arrRet.law_fax01|escape}-->-<!--{$arrRet.law_fax02|escape}-->-<!--{$arrRet.law_fax03|escape}--></td>
      </tr>
      <tr>
        <th>メールアドレス</th>
        <td><a href="mailto:<!--{$arrRet.law_email|escape:'hex'}-->"><!--{$arrRet.law_email|escape:'hexentity'}--></a></td>
      </tr>
      <tr>
        <th>URL</th>
        <td><a href="<!--{$arrRet.law_url|escape}-->"><!--{$arrRet.law_url|escape}--></a></td>
      </tr>
      <tr>
        <th>商品以外の必要代金</th>
        <td><!--{$arrRet.law_term01|escape|nl2br}--></td>
      </tr>
      <tr>
        <th>注文方法</th>
        <td><!--{$arrRet.law_term02|escape|nl2br}--></td>
      </tr>
      <tr>
        <th>支払方法</th>
        <td><!--{$arrRet.law_term03|escape|nl2br}--></td>
      </tr>
      <tr>
        <th>支払期限</th>
        <td><!--{$arrRet.law_term04|escape|nl2br}--></td>
      </tr>
      <tr>
        <th>NP後払い与信落ちについて</th>
        <td>NP後払いでご購入いただいた際に、初回商品のお支払いが「与信落ち」となってしまった場合には、与信通過となるまで商品の発送を行いません。お支払い方法を「クレジットカード支払い」にご変更いただく必要があるため、必ずカスタマーセンターまでご連絡ください。
        </td>
      </tr>
      <tr>
        <th>引渡し時期</th>
        <td><!--{$arrRet.law_term05|escape|nl2br}--></td>
      </tr>
      <tr>
        <th>返品・交換について</th>
        <td><!--{$arrRet.law_term06|escape|nl2br}--></td>
      </tr>
      <tr>
        <th>不良品などによる返品について</th>
        <td>
          万が一「違う商品が届いた」「個数が足りない」「商品に不備な点があった」「商品が破損していた」場合は、商品到着後8日以内にカスタマーセンターまでご連絡ください。弊社にて返品を確認後、迅速に全て交換（同品を再送）いたします。<br>
          ※返送先は、カスタマーセンターよりご案内させていただきます。<br>
          ※商品不足につきましては不足分の追送にて対応させていただきます。<br>
          ※弊社に事前のご連絡がなく、商品を返品された場合は、商品の交換を承りかねます。
        </td>
      </tr>
      <tr>
        <th>クーリング・オフ規定について</th>
        <td>当社商品は、特定商取引法上のクーリング・オフ規定がないため、クーリング・オフはできません。</td>
      </tr>
      <tr>
        <th>新規ご注文後の変更・キャンセルについて</th>
        <td>
          新規ご注文後の注文変更については当日18時もしくは翌営業日の午前中までにカスタマーセンターまでご連絡ください。<br>
          ※カスタマーセンター営業時間外の場合は、翌営業日の午前中ご連絡ください。
        </td>
      </tr>
      <tr>
        <th>解約・休止について</th>
        <td>
          定期でお届けするコースの休止・解約をご希望の際は、次回発送予定日の10日前までにカスタマーセンターまでお電話にてご連絡ください。この期間を過ぎますと商品の発送準備に入ってしまうため、次々回以降の休止となりますのでご注意ください。次回の商品お届け予定日は、お客様によって異なります。詳しくは商品と一緒にお届けしておりますお買い上げ明細書をご確認いただくか、カスタマーセンターまでお問い合わせください。<br>
          ※システムの都合上、発送完了メールが数日遅れて届く場合がございます。
        </td>
      </tr>
      <tr>
        <th>転売の禁止について</th>
        <td>
          弊社では、個人使用目的以外の購入をお断りしており、その理由・目的に関わらず一切の転売、譲渡を固くお断りしています。また、お届け先の住所が適切でないと弊社で判断した場合、お電話がつながらない番号でのご注文は、ご注文をキャンセルさせていただく場合があります。
          ※転売または譲渡を目的とした注文はお受けできません。<br>
          ※転売または譲渡された商品の品質や安全性、賞味期限などは保証しておりません。<br>
          ※転売または譲渡がなされた場合は、商品の品質について一切責任を負えませんので、ご注意ください。<br>
          ※転売した商品の健康被害の損害、風評被害などの損害については賠償請求いたします。<br>
          ※弊社商品の画像を不正に使用した場合は著作権の侵害となり法的措置を取らせていただきます。
        </td>
      </tr>
    </table>
</div>
<!--▲CONTENTS-->


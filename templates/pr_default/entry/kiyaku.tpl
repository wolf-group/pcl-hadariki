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
<div id="guidecolumn">
		<div class="head">
			<h2 class="t_entry">会員登録</h2>
		</div>
      <p><em>【重要】 会員登録をされる前に、下記ご利用規約をよくお読みください。</em><br />
      規約には、本サービスを使用するに当たってのあなたの権利と義務が規定されております。<br />
     「規約に同意して会員登録をする」ボタン をクリックすると、あなたが本規約の全ての条件に同意したことになります。</p>
     <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
       <textarea name="textfield" class="area470"  cols="80" rows="30"
                 readonly="readonly"><!--{$tpl_kiyaku_text}--></textarea>
       <!--{if $is_campaign}-->
			<div class="btn_rpst1e"><span class="btn_noagree"><a href="javascript:history.back();">同意しない<input type="hidden" name="b_noagree" /></a></span></div>
			<!--{else}-->
			<div class="btn_rpst1e"><span class="btn_prev"><a href="/">同意しない<input type="hidden"  name="b_noagree" id="b_noagree" /></a></span></div>
<!--{/if}-->
			<div class="btn_rpst2e"><span class="btn_next"><a href="<!--{$smarty.const.URL_ENTRY_TOP}-->">同意する<input type="hidden" name="b_agree" id="b_agree" /></a></span></div>
     </form>
 </div>


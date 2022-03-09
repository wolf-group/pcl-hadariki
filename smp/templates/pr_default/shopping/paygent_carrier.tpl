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
<style type="text/css">
<!--
div#under02column_shopping .box60 {
    width: 60px;
    padding: 2px;
    border: 1px solid #ccc;
}

div#under02column_shopping .box120 {
    width: 120px;
    padding: 2px;
    border: 1px solid #ccc;
}
-->
</style>

<script type="text/javascript" src="<!--{$smarty.const.URL_DIR}-->js/mask.js" ></script>
<script type="text/javascript">//<![CDATA[
var send = true;
var sm = new ScreenMask($);
var complete_flg = false;
function fnCheckSubmit(mode, key, val) {
	complete_flg = true;
    sm.append();
    if(send) {
    $('input[name="card_save_flg"]').attr('disabled' , false);
        send = false;
        fnModeSubmit(mode, key, val);
        return true;
    } else {
        alert("只今、処理中です。しばらくお待ち下さい。");
        return false;
    }
}

//]]>
</script>
<!--▼CONTENTS-->
<div id="under02column">
  <div id="under02column_shopping">
    <!--{$add_html}-->

    <h2>
    お支払い方法：<!--{$tpl_payment_method}-->
    </h2>

    <!--{if $arrErr.paygent_err}-->
    <table summary="お支払い方法">
      <tr>
        <td class="lefttd">
          <p class="attention">エラーが発生しました：<!--{$arrErr.paygent_err|escape}--></p>
        </td>
      </tr>
    </table>
    <!--{/if}-->
    
    <div style="color:red">※ ドコモケータイ払い、またはソフトバンクケータイ払いをご利用のお客様はキャリア側システムの決済手続き完了後に必ず「戻る」ボタンを押し、店舗側の購入手続き完了ページに遷移するようにしてください。<br />
    もし店舗側の購入手続き完了ページに遷移しなかった場合にはその注文は無効となりますので予めご了承ください。</div>
    
    <!--{* paygentから返却されるフォーム *}-->
    <!--{$r_form}-->
    <!--{**}-->
  </div>
</div>
<!--▲CONTENTS-->
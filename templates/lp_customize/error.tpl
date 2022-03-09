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
<!--{*
 * エラーメッセージの変更方法について
 *
 * エラーメッセージを任意のメッセージに変更したい場合は、以下の error.tpl および、フォルダをコピーし、
 * 該当エラーメッセージテンプレートの編集を行なってください。
 *
 *   ●error.tpl
 *   コピー元: /templates/pr_default/error.tpl
 *   コピー先: /templates/ご利用中のテンプレートフォルダ/error.tpl
 *
 *   ●フォルダ
 *   コピー元: /templates/pr_default/custom/error
 *   コピー先: /templates/ご利用中のテンプレートフォルダ/custom/error
 *
 * この error.tpl がご利用中のテンプレートに反映されていない場合、システムのエラーメッセージが表示されます。
 *
 * また、この error.tpl がご利用中のテンプレートに反映されていて、
 * カスタムエラーテンプレートが存在しない場合、オリジナルのカスタムエラーテンプレート
 * が読み込まれます。
 *
 *}-->
 <!--▼CONTENTS-->
<style type="text/css">
.back_btn {
    text-align: center;
    width: 30vw;
    margin: 2rem auto 4rem;
    padding: 1rem;
    background: #333;
    position: relative;
    border-radius: 0.4rem;
}

.back_btn a {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    padding-top: 1rem;
    background: #333;
    font-size: 125%;
    font-weight: 600;
    color: #fff;
    text-decoration: none;
    border-radius: 0.4rem;
    box-shadow: 2px 2px 2px #999;
}

.back_btn a:hover {
    background: #666;
}
</style>
<div class="tblareabtn">
    <div class="messagearea">
        <!--★エラーメッセージ-->
        <p class="error"><!--{custom_error_tpl}--></p>
    </div>
<!--{if '/shopping/confirm.php'|is_current_path || '/shopping/complete.php'|is_current_path || '/shopping/load_payment_module.php'|is_current_path || $is_payment_error_page}-->
    <!--{if $from_lp_product}-->
    <div class="back_btn">
        <a href="/shopping/lp.php?p=<!--{$from_lp_product|escape}-->#product_id">前のページに戻る</a>
    </div>
    <!--{else}-->
    <div class="back_btn">
        <a href="../cart/index.php">カートに戻る</a>
    </div>
    <!--{/if}-->
<!--{/if}-->
    <ul class="btn_area_l2">
        <!--{if $return_top}-->
        <li class="btn2">
            <span class="btn_prev"><a href="/">トップページへ</a></span>
        </li>
        <!--{elseif !$from_lp_product}-->
        <li class="btn2">
            <!--{if '/shopping/complete.php'|is_current_path || '/shopping/load_payment_module.php'|is_current_path}-->
            <span class="btn_prev"><a href="../cart/index.php">前のページへ</a></span>
            <!--{else}-->
            <span class="btn_prev"><a href="javascript:history.back()">前のページへ</a></span>
            <!--{/if}-->
        </li>
        <!--{/if}-->
    </ul>
</div>
<!--▲CONTENTS-->

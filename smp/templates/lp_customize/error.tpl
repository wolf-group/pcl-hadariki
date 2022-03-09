<!--{*
 * エラーメッセージの変更方法について
 *
 * エラーメッセージを任意のメッセージに変更したい場合は、以下の error.tpl および、フォルダをコピーし、
 * 該当エラーメッセージテンプレートの編集を行なってください。
 *
 *   ●error.tpl
 *   コピー元: /smp/templates/pr_default/error.tpl
 *   コピー先: /smp/templates/ご利用中のテンプレートフォルダ/error.tpl
 *
 *   ●フォルダ
 *   コピー元: /smp/templates/pr_default/custom/error
 *   コピー先: /smp/templates/ご利用中のテンプレートフォルダ/custom/error
 *
 * この error.tpl がご利用中のテンプレートに反映されていない場合、システムのエラーメッセージが表示されます。
 *
 * また、この error.tpl がご利用中のテンプレートに反映されていて、
 * カスタムエラーテンプレートが存在しない場合、オリジナルのカスタムエラーテンプレート
 * が読み込まれます。
 *}-->
<style type="text/css">
.back_btn {
    text-align: center;
    width: 80vw;
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
<div id="compbox">
    <!--{custom_error_tpl}-->
</div>
<!--{if '/smp/shopping/confirm.php'|is_current_path || '/smp/shopping/complete.php'|is_current_path || '/smp/shopping/load_payment_module.php'|is_current_path || $is_payment_error_page}-->
    <!--{if $from_lp_product}-->
    <div class="back_btn">
        <a href="/smp/shopping/lp.php?p=<!--{$from_lp_product|escape}-->#product_id">前のページに戻る</a>
    </div>
    <!--{else}-->
    <div class="back_btn">
        <a href="../cart/index.php">カートに戻る</a>
    </div>
    <!--{/if}-->
<!--{/if}-->

<!--{if !$return_top && !$from_lp_product}-->
<ul>
    <li class="sp_btn">
        <!--{if '/smp/shopping/complete.php'|is_current_path || '/smp/shopping/load_payment_module.php'|is_current_path}-->
        <span class="btn_prev"><a href="../cart/index.php">前のページへ</a></span>
        <!--{else}-->
        <span class="btn_prev"><a href="javascript:history.back()">前のページへ</a></span>
        <!--{/if}-->
    </li>
</ul>
<!--{/if}-->


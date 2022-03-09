<!--▼CONTENTS-->
<div id="mypagecolumn">
    <div class="head">
        <h2 class="t_mypage">マイページ
        <!--{* ポイント表示 *}-->
        <!--{if $tpl_point}--><!--{include file=$tpl_point}--><!--{/if}-->
        </h2>
    </div>
    <!--{include file=$tpl_navi}-->
    <div id="mycontentsarea">
        <div class="mycont_head">
            <h3>定期購入お届け先情報変更(AmazonPay[カード/お届け先]変更)【確認】</h3>
        </div>
        <p class="mgb20">
            定期コースの次回のお届け先から<br>
            AmazonPayより取得した下記のお届け先に変更致します。<br>
            よろしいでしょうか？
        </p>
        <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
            <input type="hidden" name="mode" value="complete">
            <input type="hidden" name="order_id" value="<!--{$arrForm.regular_order_id|escape}-->">
            <div class="mg_change">
                <table summary="定期購入お届け先情報変更" >
                    <tr>
                        <th style="width:30%;">受注ID(申込)</th>
                        <td><!--{$regular_order_id|escape}--></td>
                    </tr>
                    <tr>
                        <th style="width:30%;">お名前</th>
                        <td><!--{$delivery_info.name01|escape}-->　<!--{$delivery_info.name02|escape}--></td>
                    </tr>
                    <tr>
                        <th>お名前（フリガナ）</th>
                        <td><!--{$delivery_info.kana01|escape}-->　<!--{$delivery_info.kana02|escape}--></td>
                    </tr>
                    <tr>
                        <th>郵便番号</th>
                        <td><!--{$delivery_info.zip01|escape}-->-<!--{$delivery_info.zip02|escape}--></td>
                    </tr>
                    <tr>
                        <th>住所</th>
                        <td><!--{$delivery_info.pref_name|escape}--><!--{$delivery_info.addr01|escape}--><!--{$delivery_info.addr02|escape}--></td>
                    </tr>
                    <tr>
                        <th>電話番号</th>
                        <td><!--{$delivery_info.tel01|escape}-->-<!--{$delivery_info.tel02|escape}-->-<!--{$delivery_info.tel03|escape}--></td>
                    </tr>
                </table>
                <div class="btn_rpst3_2">
                    <span class="btn_prev"><a href="./regular.php" >前のページへ</a></span>
                </div>
                <ul class="btn_area_n2">
                    <li class="btn">
                        <span class="btn_next"><a href="#" onclick="document.form1.submit();">変更を確定する</a></span>
                    </li>
                </ul>
           </div> 
        </form>
    </div>
</div>
<!--▲CONTENTS-->

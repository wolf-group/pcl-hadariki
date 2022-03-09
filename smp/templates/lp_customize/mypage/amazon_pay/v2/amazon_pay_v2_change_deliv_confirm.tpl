<!--▼CONTENTS-->
<div id="mypagecolumn">
    <div class="mypage_inner">
        <h3>AmazonPay[カード/お届け先]変更【確認】</h3>
        <ol class="step_bar box_horizon border_box step1">
            <li class="step_bar_item item2"><p class="step_bar_txt">1.入力</p></li>
            <li class="step_bar_item item1"><p class="step_bar_txt">2.確認</p></li>
            <li class="step_bar_item item3"><p class="step_bar_txt">3.完了</p></li>
        </ol>        
        <p class="pd10">定期コースの次回のお届け先から<br>
            AmazonPayより取得した下記のお届け先に変更致します。<br>
            よろしいでしょうか？
        </p>
        <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
            <input type="hidden" name="mode" value="complete">
            <input type="hidden" name="order_id" value="<!--{$arrForm.regular_order_id|escape}-->">
            <div class="info_change">
                <dl>
                    <dt>お名前</dt>
                    <dd><!--{$delivery_info.name01|escape}-->　<!--{$delivery_info.name02|escape}--></dd>
                    <dt>お名前（ﾌﾘｶﾞﾅ）</dt>
                    <dd><!--{$delivery_info.kana01|escape}-->　<!--{$delivery_info.kana02|escape}--></dd>
                    <dt>郵便番号</dt>
                    <dd><!--{$delivery_info.zip01|escape}-->-<!--{$delivery_info.zip02|escape}--></dd>
                    <dt>住所</dt>
                    <dd><!--{$delivery_info.pref_name|escape}--><!--{$delivery_info.addr01|escape}--><!--{$arrForm.deliv_addr02|escape}--></dd>
                    <dt>電話番号</dt>
                    <dd><!--{$delivery_info.tel01|escape}-->-<!--{$delivery_info.tel02|escape}-->-<!--{$delivery_info.tel03|escape}--></dd>
                </dl>
            </div>
        </form>
    </div>
    <ul>
        <li class="mg_newbtn">
            <a href="javascript:void(0);" onclick="document.form1.submit();">変更を確定する</a>
        </li>
    </ul>
    <div class="mypage_back">
        <div class="mg_back">
            <a href="<!--{$smarty.server.PHP_SELF|escape}-->" onclick="fnModeSubmit('return', '', ''); return false;" >戻る</a>
        </div>
    </div> 
</div>
<!--▲CONTENTS-->

<!--▼CONTENTS-->
<div id="guidecolumn">
    <div class="head">
        <p>
        下記の内容で送信してもよろしいでしょうか？<br />
        よろしければ、会員規約をお読みの上、一番下の「会員登録完了へ」ボタンをクリックしてください。
        </p>
        <h2 class="t_entry">会員登録</h2>
    </div>
    <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="complete" />
        <table summary="会員登録フォーム">
            <tr>
                <th>お名前</th>
                <td>
                    <!--{$amazon_user_info.name}-->
                </td>
            </tr>
            <tr>
                <th>メールアドレス</th>
                <td>
                    <span class="attention"><!--{$arrErr.email}--></span>
                    <!--{$amazon_user_info.email}-->
                </td>
            </tr>
        </table>
        <ul class="btn_area_l2">
            <li class="btn">
                <span class="btn_next">
                    <a href="javascript:void(0);" onclick="window.open('./kiyaku_popup.php','', 'width=600, height=740, menubar=no, toolbar=no, scrollbars=yes');" >会員規約を見る</a>
                </span>
            </li> 
            <li class="btn">
                <span class="btn_next"><a href="javascript:void(document.form1.submit());">会員登録完了へ</span>
            </li>
        </ul>
    </form>
</div>
<!--▲CONTENTS-->


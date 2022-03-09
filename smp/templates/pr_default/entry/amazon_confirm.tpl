<div id="entrycolumn">
    <div class="entry_inner">
        <h2>会員登録</h2>
        <p>
            下記の内容で送信してもよろしいでしょうか？<br />
            よろしければ、会員登録規約をお読みの上、一番下の「会員登録完了へ」ボタンをクリックしてください。
        </p>
        <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$transactionid|escape}-->" />
            <input type="hidden" name="mode" value="complete" />
            <!--{$add_html}-->
            <div class="entry_info">
                <ul>
                    <li class="entry_info_head">メールアドレス
                    <li class="entry_info_inner02">
                        <span class="attention"><!--{$arrErr.email|escape|nl2br}--></span>
                        <div>
                            <!--{$amazon_user_info.email|escape}-->
                        </div>
                    </li>
                    <li class="entry_info_head">お名前
                    <li class="entry_info_inner02">
                        <div>
                            <!--{$amazon_user_info.name|escape}-->
                        </div>
                    </li>
                </ul>
            </div>
            <ul>
                <li class="sp_btn">
                    <a href="./kiyaku_smp.php">会員登録規約</a>
                </li>
            </ul>
            <ul>
                <li class="sp_btn">
                    <!--{if $customer_regist_flg}-->
                    <input type="submit" onclick="document.form1.submit();" value="会員登録完了へ" id="to_confirm_btn" name="confirm" />
                    <!--{else}-->
                    <input type="button" onClick="location.href='<!--{$login_page_path|escape}-->'" value="ログイン画面へ" id="to_confirm_btn" name="confirm" />
                    <!--{/if}-->
                </li>
            </ul>
        </form>
    </div>
</div>

<center>クレジット決済</center>

<hr>

<!--{* 決済時のエラーを表示 *}-->
<!--{assign var=key value="gmo_request"}-->
<!--{if $arrErr[$key]}-->
<font color="red">
エラーが発生しました。<br>
エラーコード：<!--{$arrErr[$key]|nl2br}--></font>
<br>
<!--{/if}-->

<form method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
<input type="hidden" name="mode" value="register">
<input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->">
<!--{if $enable_customer_regist}-->
■登録したカードで注文<br>
<input type="submit" name="getcard" value="登録カードを呼び出す"><br><br>
    <!--{* カード一覧ここから *}-->
    <!--{if $cardNum}-->
    <!--{if $arrErr.CardSeq}--><br><font color="red">カードを選択して下さい</font><br><!--{/if}-->
    <table>
    <tr>
        <td>選択</td>
        <td>カード番号</td>
        <td>有効期限</td>
        <td>名義人</td>
    </tr>
    <!--{foreach name=cardloop from=$arrCardInfo item=card}-->
        <!--{if $card.DeleteFlag == 0}-->
        <tr>
            <td><input type="radio" name="CardSeq" value="<!--{$card.CardSeq}-->"></td>
            <td><!--{$card.CardNo|substr:-8:8}--></td>
            <td><!--{$card.Expire|substr:2:4}-->月/<!--{$card.Expire|substr:0:2}-->年</td>
            <td><!--{$card.HolderName}--></td><!--{* 名義人 *}-->
        </tr>
        <!--{/if}-->
    <!--{/foreach}-->
    </table>
    <!--{/if}-->
    <!--{* カード一覧ここまで *}-->
    
    <!--{if $cardNum}-->
    <br>
    ■お支払い方法<br>
    <!--{assign var=key value="paymethod_usecard"}-->
    <font color="red"><!--{$arrErr[$key]}--></font><br>
    <select name="<!--{$key}-->" value="<!--{$arrForm[$key].value|escape}-->">
    <!--{html_options options=$arrPayMethod selected=$arrForm[$key].value|escape}-->
    </select>
    <br>
    <br>
    <input type="submit" name="register" value="選択したカードで購入"><br>
    <br>
    <input type="submit" name="deletecard" value="選択したカードの削除"><br><br>
    <!--{/if}-->
<hr><br>
<!--{/if}-->

■カード番号<br>
<!--{assign var=key_no01 value="card_no01"}-->
<!--{if $arrErr[$key_no01] != ""}-->
<font color="red"><!--{$arrErr[$key_no01]}--></font>
<!--{/if}-->
<!--{assign var=key_no02 value="card_no02"}-->
<!--{if $arrErr[$key_no02] != ""}-->
<font color="red"><!--{$arrErr[$key_no02]}--></font>
<!--{/if}-->
<!--{assign var=key_no03 value="card_no03"}-->
<!--{if $arrErr[$key_no03] != ""}-->
<font color="red"><!--{$arrErr[$key_no03]}--></font>
<!--{/if}-->
<!--{assign var=key_no04 value="card_no04"}-->
<!--{if $arrErr[$key_no04] != ""}-->
<font color="red"><!--{$arrErr[$key_no04]}--></font>
<!--{/if}-->
<input type="text" name="<!--{$key_no01}-->" value="<!--{$arrForm[$key_no01].value|escape}-->" maxlength="4" size="4" istyle="4">
<input type="text" name="<!--{$key_no02}-->" value="<!--{$arrForm[$key_no02].value|escape}-->" maxlength="4" size="4" istyle="4">
<input type="text" name="<!--{$key_no03}-->" value="<!--{$arrForm[$key_no03].value|escape}-->" maxlength="4" size="4" istyle="4">
<input type="text" name="<!--{$key_no04}-->" value="<!--{$arrForm[$key_no04].value|escape}-->" maxlength="4" size="4" istyle="4"><br>
<br>

■有効期限<br>
<!--{assign var=key_month value="card_month"}-->
<!--{if $arrErr[$key_month] != ""}-->
<font color="red"><!--{$arrErr[$key_month]}--></font>
<!--{/if}-->
<!--{assign var=key_year value="card_year"}-->
<!--{if $arrErr[$key_year] != ""}-->
<font color="red"><!--{$arrErr[$key_year]}--></font>
<!--{/if}-->
<select name="<!--{$key_month}-->">
<!--{html_options options=$arrMonth selected=$arrForm[$key_month].value}-->
</select>
月
<select name="<!--{$key_year}-->">
<!--{html_options options=$arrYear selected=$arrForm[$key_year].value}-->
</select>
年
<br><br>

■ローマ字氏名<br>
<!--{assign var=key_name01 value="card_name01"}-->
<!--{if $arrErr[$key_name01] != ""}-->
<font color="red"><!--{$arrErr[$key_name01]}--></font>
<!--{/if}-->
<!--{assign var=key_name02 value="card_name02"}-->
<!--{if $arrErr[$key_name02] != ""}-->
<font color="red"><!--{$arrErr[$key_name02]}--></font>
<!--{/if}-->
名<input type="text" name="<!--{$key_name01}-->" value="<!--{$arrForm[$key_name01].value|escape}-->" size="10" istyle="3">
姓<input type="text" name="<!--{$key_name02}-->" value="<!--{$arrForm[$key_name02].value|escape}-->" size="10" istyle="3"><br>

半角英字入力<br>
例：TARO YAMADA<br>
<br>

■お支払い方法<br>
<!--{assign var=key value="paymethod"}-->
<!--{if $arrErr[$key] != ""}-->
<font color="red"><!--{$arrErr[$key]}--></font>
<!--{/if}-->
<select name="<!--{$key}-->">
<!--{html_options options=$arrPayMethod selected=$arrForm[$key].value}-->
</select>

<br>
<br>
<!--{if $enable_customer_regist}-->
■このカード情報を登録する<br>
<br>
<!--{assign var=key value="register_card"}-->
<input type="checkbox"
       name="<!--{$key}-->"
       value="1"
       class="button" <!--{if $arrForm[$key].value}--> checked=checked <!--{/if}-->/>登録する
<br>
※カード情報を登録すると、<br>
次回以降、「登録済みのカード情報を呼び出す」ボタンで<br>
登録したカードを利用することが出来ます。(最大5件まで)<br>
<br>
<br>
<!--{/if}-->

<input type="submit" name="register" value="注文完了ページへ">
<br>
</form>
<form method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
<input type="hidden" name="mode" value="return">
<input type="submit" name="return" value="戻る">
</form>

<br>
<hr>

<a href="<!--{$smarty.const.MOBILE_URL_CART_TOP}-->" accesskey="9"><!--{9|numeric_emoji}-->かごを見る</a><br>
<a href="<!--{$smarty.const.MOBILE_URL_SITE_TOP}-->" accesskey="0"><!--{0|numeric_emoji}-->TOPページへ</a><br>

<br>

<!-- ▼フッター ここから -->
<center>LOCKON CO.,LTD.</center>
<!-- ▲フッター ここまで -->

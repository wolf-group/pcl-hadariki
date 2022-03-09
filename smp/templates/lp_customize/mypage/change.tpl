<!--▼CONTENTS-->
<div id="mypagecolumn">
    <div class="pankuzuarea">
        <p>
            <a href="/smp/">HOME</a>
            &gt; <a href="/smp/mypage/login.php">マイページ</a>
            &gt; <a href="./change.php">基本会員情報</a>
        </p>
    </div>
    <div class="mypage_inner">
        <h3>基本会員情報の変更・確認</h3>
        <ol class="step_bar box_horizon border_box step1">
            <li class="step_bar_item item1"><p class="step_bar_txt">1.入力</p></li>
            <li class="step_bar_item item2"><p class="step_bar_txt">2.確認</p></li>
            <li class="step_bar_item item3"><p class="step_bar_txt">3.完了</p></li>
        </ol>

        <p class="pd10">お客様の基本情報の確認、変更ができます。</p>
        <!--{if $empty_str_exist}-->
        <p class="mg_attention">※ 住所が<!--{$smarty.const.EMPTY_STR|escape}-->の場合または、都道府県が未選択の場合購入ができません。</p>
        <!--{/if}-->
        <form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="confirm" />
            <input type="hidden" name="customer_id" value="<!--{$arrForm.customer_id|escape}-->" />
            <div class="mg_change">
                <h4 class="ttl">お客様の基本情報</h4>
                <dl>
                    <dt>お名前<span class="required">必須</span></dt>
                    <dd>
                        <input type="text" class="boxHarf text h30" placeholder="姓" name="name01" value="<!--{$arrForm.name01|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name01|sfGetErrorColor}-->;" />&nbsp;
                        <input type="text" class="boxHarf text h30" placeholder="名" name="name02" value="<!--{$arrForm.name02|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name02|sfGetErrorColor}-->;" />
                        <div class="mg_attention"><!--{$arrErr.name01}--><!--{$arrErr.name02}--></div>
                    </dd>
                    <dt>お名前（ﾌﾘｶﾞﾅ）<span class="required">必須</span></dt>
                    <dd>
                        <input type="text" class="boxHarf text h30" placeholder="セイ" name="kana01" value="<!--{$arrForm.kana01|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana01|sfGetErrorColor}-->;" size="15"  />&nbsp;
                        <input type="text" class="boxHarf text h30" placeholder="メイ" name="kana02" value="<!--{$arrForm.kana02|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana02|sfGetErrorColor}-->;" size="15" />
                        <div class="mg_attention"><!--{$arrErr.kana01}--><!--{$arrErr.kana02}--></div>
                    </dd>
                    <dt>郵便番号<span class="required">必須</span></dt>
                    <dd>
                        <input type="text" class="boxHarf top text h30" placeholder="1234567" name="zip" value="<!--{$arrForm.zip|escape}-->" maxlength="<!--{$smarty.const.ZIP01_LEN+$smarty.const.ZIP02_LEN}-->" size="30" style="<!--{$arrErr.zip|sfGetErrorColor}-->;" inputmode="numeric"/>
                        <span class="zipimg">
                            <a href="/smp<!--{$smarty.const.URL_INPUT_ZIP}-->" onclick="fnCallAddress_ex('/smp<!--{$smarty.const.URL_INPUT_ZIP}-->', 'zip', 'pref', 'addr01'); return false;" target="_blank">
                                <span class="zip_bt">住所自動入力</span>
                            </a><br />
                        </span>
                        <span class="mg_attention"><!--{$arrErr.zip}--></span>
                        <span class="mg_attention"><!--{$message}--></span>
                    </dd>
                    <dt>住所<span class="required">必須</span></dt>
                    <dd>
                        <div class="custom-selectbox w40">
                            <select name="pref" style="<!--{$arrErr.pref|sfGetErrorColor}-->">
                                <option value="" selected="selected">都道府県を選択</option>
                                <!--{html_options options=$arrPref selected=$arrForm.pref}-->
                            </select>
                        </div>
                        <div class="mini_add">
                            <p><!--{$smarty.const.SAMPLE_ADDRESS1}--></p>
                            <input type="text" class="boxLong top text h30" name="addr01" value="<!--{$arrForm.addr01|escape}-->" size="60"style="<!--{$arrErr.addr01|sfGetErrorColor}-->;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS1}-->" /><br />
                        </div>
                        <div class="mini_add">
                            <p><!--{$smarty.const.SAMPLE_ADDRESS2}--></p>
                            <input type="text" class="boxLong top text h30" name="addr02" value="<!--{$arrForm.addr02|escape}-->" size="60"style="<!--{$arrErr.addr02|sfGetErrorColor}-->;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS2}-->"/><br />
                        </div>
                        <span class="mg_attention"><!--{$arrErr.pref}--><!--{$arrErr.addr01}--><!--{$arrErr.addr02}--></span>
                        <span class="mg_attention">住所は2つに分けてご記入いただけます。マンション名は必ず記入してください。</span>
                    </dd>
                    <dt>電話番号<span class="required">必須</span></dt>
                    <dd>
                        <input type="text" class="boxLong top text h30" placeholder="09012345678" name="tel" value="<!--{$arrForm.tel|escape}-->" maxlength="<!--{$smarty.const.TEL_LEN}-->" size="30" style="<!--{$arrErr.tel|sfGetErrorColor}-->;" inputmode="numeric"/>
                        <div class="mg_attention"><!--{$arrErr.tel}--></div>
                    </dd>
                    <dt>FAX<span class="any">任意</span></dt>
                    <dd>
                        <input type="text" class="boxLong top text h30" placeholder="0312345678" name="fax" value="<!--{$arrForm.fax|escape}-->" maxlength="<!--{$smarty.const.TEL_LEN}-->" size="30" style="<!--{$arrErr.fax|sfGetErrorColor}-->;" inputmode="numeric"/>
                        <div class="mg_attention"><!--{$arrErr.fax}--></div>
                    </dd>
                    <dt>職業<span class="any">任意</span></dt>
                    <dd>
                        <div class="custom-selectbox w80">
                            <select name="job" >
                                <option value="" selected="selected">選択してください</option>
                                <!--{html_options options=$arrJob selected=$arrForm.job}-->
                            </select>
                        </div>
                        <div class="mg_attention"><!--{$arrErr.job}--></div>
                    </dd>

                    <dt>メールアドレス</dt>
                    <dd>
                        <ul>
                            <li>
                                <p class="mini3">メールアドレス<span class="required">必須</span></p>
                                <input type="text" class="boxLong text h30" placeholder="sample@example.com" name="email" value="<!--{$arrForm.email|escape}-->" style="<!--{$arrErr.email|sfGetErrorColor}-->;" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" size="40" inputmode="email"/>
                                <div class="mg_attention"><!--{$arrErr.email}--></div>
                            </li>
                            <!--{* 携帯メールアドレス欄を設置したい場合はコメントアウトを外してください *}-->
                            <!--{*
                            <li>
                                <p class="mini3">携帯メールアドレス</p>
                                <input type="text" class="boxLong text h30" placeholder="sample@example.com" name="email_mobile" value="<!--{$arrForm.email_mobile|escape}-->" style="<!--{$arrErr.email_mobile|sfGetErrorColor}-->;" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" size="40" inputmode="email"/><div class="mg_attention"><!--{$arrErr.email_mobile}--></div>
                            </li>
                            *}-->
                        </ul>
                    </dd>
                    <dt>パスワード<span class="required">必須</span></dt>
                    <dd>
                        <input type="password" class="boxHarf text h30" name="password" value="<!--{$arrForm.password|escape}-->" maxlength="<!--{$password_rule.max_length|escape}-->" style="<!--{$arrErr.password|sfGetErrorColor}-->" size="15"/>
                        <div class="mg_attention"><!--{$arrErr.password}--></div>
                        <div class="mg_attention"><!--{$password_rule.message|escape}--><br />変更されない場合は未入力のままで結構です。</div>
                        <input type="password" class="boxHarf text h30" name="password02" value="<!--{$arrForm.password02|escape}-->" maxlength="<!--{$password_rule.max_length|escape}-->" style="<!--{$arrErr.password02|sfGetErrorColor}-->" size="15"/>
                        <div class="mg_attention"><!--{$arrErr.password02}--></div>
                        <div class="mg_attention">確認のため2度入力してください。</div>
                    </dd>

                    <!--{if $arrMailCompulsionView eq "ON"}-->
                        <input type="hidden" name="mailmaga_flg" id="html" value="1">
                    <!--{else}-->
                        <dt>メールマガジン送付について<span class="required">必須</span></dt>
                        <dd>
                            <ul>
                                <li class="magazine_choice">
                                    <input type="radio" name="mailmaga_flg" value="1" id="html" style="<!--{$arrErr.mailmaga_flg|sfGetErrorColor}-->" <!--{if $arrForm.mailmaga_flg eq 1}--> checked="checked" <!--{/if}--> /><label for="html"> 受け取る</label>
                                </li>

                                <li class="magazine_choice">
                                    <input type="radio" name="mailmaga_flg" value="3" id="no" style="<!--{$arrErr.mailmaga_flg|sfGetErrorColor}-->" <!--{if $arrForm.mailmaga_flg eq 3}--> checked="checked" <!--{/if}--> /><label for="no"> 受け取らない</label>
                                </li>
                                <li>
                                    <div class="attention"><!--{$arrErr.mailmaga_flg}--></div>
                                </li>
                            </ul>
                        </dd>
                    <!--{/if}-->
                    <dt></dt>
                    <dd>
                        <div>
                            <div class="p_waku2">
                                <input type="checkbox" id="edit_regular_master_deliv_addr" name="edit_regular_master_deliv_addr" value="1">
                                <label for="edit_regular_master_deliv_addr">全ての定期注文のお届け先情報も<br />一緒に変更する</label>
                            </div>
                        </div>
                    </dd>
                    <dt>生年月日</dt>
                    <dd>
                        <!--{if $arrForm.birth}-->
                            <!--{$arrForm.birth|date_format:"%Y年%m月%d日"|escape}-->
                        <!--{else}-->
                            <ul class="mypage-birthday ">
                                <li>
                                    <div class="custom-selectbox w70">
                                        <select name="year" autocomplete="<!--{$arrForm.autocomplete.year|autocomplete|escape}-->">
                                            <!--{html_options options=$arrYear selected=$arrForm.year|default:'----'}-->
                                        </select>
                                    </div>年
                                </li>
                                <li>
                                    <div class="custom-selectbox w50">
                                        <select name="month" autocomplete="<!--{$arrForm.autocomplete.month|autocomplete|escape}-->">
                                            <option value="">--</option>
                                            <!--{html_options options=$arrMonth selected=$arrForm.month}-->
                                        </select>
                                    </div>
                                    月
                                </li>
                                <li>
                                    <div class="custom-selectbox w50">
                                        <select name="day" autocomplete="<!--{$arrForm.autocomplete.day|autocomplete|escape}-->">
                                            <option value="">--</option>
                                            <!--{html_options options=$arrDay selected=$arrForm.day}-->
                                        </select>
                                    </div>
                                    日
                                </li>
                            </ul>
                            <div class="mg_attention"><!--{$arrErr.year}--><!--{$arrErr.month}--><!--{$arrErr.day}--></div></td>
                        <!--{/if}-->
                    </dd>

                </dl>
            </div>
        </form>
    </div>
    <ul>
        <li class="mg_newbtn">
            <a href="javascript:void(0);" onclick="document.form1.submit();">確認ページへ<input type="hidden" name="refusal" id="refusal" /></a>
        </li>
    </ul>

    <div class="mypage_back">
        <a href="./index.php">
            <div class="mg_back">戻る<input type="hidden" name="change" id="change" /></div>
        </a>
    </div>

</div>
<!--▲CONTENTS-->

<style type="text/css">
input, select, textarea{background-color: #ddd;}
</style>

<script>
$(function(){
    $("input, select, textarea").one("focus",function(){
        $(this).css("background","rgba(255,200,200,0.7)");
    }).blur(function(){ /*フォーカスが外れたとき*/
        if($(this).val()==""){ /*何も入力されていないなら*/
            $(this).css("background","#ddd").one("focus",function(){
                $(this).css("background","#ddd");
            });
        } else {
            $(this).css("background","#fff").one("focus",function(){
                $(this).css("background","#fff");
            });
        }
    });
});
</script>


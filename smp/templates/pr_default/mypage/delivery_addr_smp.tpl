<!--▼CONTENTS-->
<div id="mypagecolumn">
<div class="pankuzuarea">
    	<p style="letter-spacing:0.01em;font-size:80%;"><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/delivery.php">お届け先</a> &gt; <a href="./delivery_addr_smp.php">お届け先の追加・変更</a></p>
    </div>
	<div class="mypage_inner">
		<h3>お届け先の追加・変更</h3>
        <p class="pd10">入力後、一番下の「登録する」ボタンをクリックして下さい。</p>
		<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="edit" />
			<input type="hidden" name="other_deliv_id" value="<!--{$smarty.session.other_deliv_id}-->" />
			<input type="hidden" name="ParentPage" value="<!--{$ParentPage}-->" />
			<!--{foreach from=$list_data key=key item=item}-->
				<input type="hidden" name="<!--{$key|escape}-->" value="<!--{$item|escape}-->" />
			<!--{/foreach}-->
			<!--{$add_html}-->
			<div class="mg_delivch">
				<dl>
					<dt>お名前<span class="required">必須</span></dt>


					<dd>
						<div class="mg_attention"><!--{$arrErr.name01}--><!--{$arrErr.name02}--></div>
						姓&nbsp;<input type="text" class="boxMedium2 text h30"  placeholder="姓" name="name01" value="<!--{if $name01 == ""}--><!--{$arrOtherDeliv.name01|escape}--><!--{else}--><!--{$name01|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name01|sfGetErrorColor}-->" size="15"  />&nbsp;
						名&nbsp;<input type="text" class="boxMedium2 text h30"  placeholder="名" name="name02" value="<!--{if $name02 == ""}--><!--{$arrOtherDeliv.name02|escape}--><!--{else}--><!--{$name02|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name02|sfGetErrorColor}-->" size="15"  />
					</dd>


					<dt>お名前(ﾌﾘｶﾞﾅ)<span class="required">必須</span>	</dt>


					<dd>
						<div class="mg_attention"><!--{$arrErr.kana01}--><!--{$arrErr.kana02}--></div>
						ｾｲ&nbsp;<input type="text" class="boxMedium2 text h30"  placeholder="セイ" name="kana01" value="<!--{if $kana01 == ""}--><!--{$arrOtherDeliv.kana01|escape}--><!--{else}--><!--{$kana01|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana01|sfGetErrorColor}-->" size="15"  />&nbsp;
						ﾒｲ&nbsp;<input type="text" class="boxMedium2 text h30"  placeholder="メイ" name="kana02" value="<!--{if $kana02 == ""}--><!--{$arrOtherDeliv.kana02|escape}--><!--{else}--><!--{$kana02|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana02|sfGetErrorColor}-->" size="15"  />
					</dd>


					<dt>郵便番号<span class="required">必須</span></dt>
					<dd>
						<!--{assign var=key1 value="zip01"}-->
						<!--{assign var=key2 value="zip02"}-->
						<!--{assign var=key3 value="zip"}-->
						<span class="mg_attention"><!--{$arrErr[$key3]}--></span>
						〒&nbsp;
						<input type="text" class="boxHarf text h30" placeholder="1234567" name="zip" value="<!--{if $zip01 == ""}--><!--{$arrOtherDeliv.zip01|escape}--><!--{else}--><!--{$zip01|escape}--><!--{/if}--><!--{if $zip02 == ""}--><!--{$arrOtherDeliv.zip02|escape}--><!--{else}--><!--{$zip02|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.ZIP01_LEN+$smarty.const.ZIP02_LEN}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->;" size="10" inputmode="numeric"/>
						<span class="zipimg">
                            <a href="<!--{$smarty.const.URL_INPUT_ZIP}-->" onclick="fnCallAddress_ex('<!--{$smarty.const.URL_INPUT_ZIP}-->', 'zip', 'pref', 'addr01'); return false;" target="_blank">
                                <span class="zip_bt">自動住所入力</span>
                            </a>
						</span>
						<br />
						<span class="mg_attention"><!--{$message}--></span>
					</dd>


					<dt>住所<span class="required">必須</span></dt>
					<dd>
					<p>
						<span class="mg_attention"><!--{$arrErr.pref}--></span>
						<div class="custom-selectbox w60">
                            <select name="pref" style="<!--{$arrErr.pref|sfGetErrorColor}-->" >
                                <option value="" selected="selected">選択してください</option>
                                <!--{if $pref == ""}-->
                                    <!--{html_options options=$arrPref selected=$arrOtherDeliv.pref|escape}-->
                                <!--{else}-->
                                    <!--{html_options options=$arrPref selected=$pref|escape}-->
                                <!--{/if}-->
                            </select>
                        </div>
					</p>
					<div class="mg_attention"><!--{$arrErr.addr01}--></div>
						<div class="mini_add">
                            <p><!--{$smarty.const.SAMPLE_ADDRESS1}--></p>
                            <input type="text" class="boxLong top text h30" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS1}-->" name="addr01" value="<!--{if $addr01 == ""}--><!--{$arrOtherDeliv.addr01|escape}--><!--{else}--><!--{$addr01|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" style="<!--{$arrErr.addr01|sfGetErrorColor}-->" size="40" />
						</div>

						<div class="mg_attention"><!--{$arrErr.addr02}--></div>
                        <div class="mini_add">
                            <p><!--{$smarty.const.SAMPLE_ADDRESS2}--></p>
                            <input type="text" class="boxLong top text h30" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS2}-->" name="addr02" value="<!--{if $addr02 == ""}--><!--{$arrOtherDeliv.addr02|escape}--><!--{else}--><!--{$addr02|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" style="<!--{$arrErr.addr02|sfGetErrorColor}-->" size="40" />
                        </div>

					<div class="mg_attention">住所は2つに分けてご記入いただけます。<br />マンション名は必ず記入してください。</div>
					</dd>


					<dt>電話番号<span class="required">必須</span></dt>


					<dd>
						<div class="mg_attention"><!--{$arrErr.tel}--></div>
						<input type="text" class="boxLong top text h30" placeholder="09012345678" name="tel" value="<!--{if $tel01 == ""}--><!--{$arrOtherDeliv.tel01|escape}--><!--{else}--><!--{$tel01|escape}--><!--{/if}--><!--{if $tel02 == ""}--><!--{$arrOtherDeliv.tel02|escape}--><!--{else}--><!--{$tel02|escape}--><!--{/if}--><!--{if $tel03 == ""}--><!--{$arrOtherDeliv.tel03|escape}--><!--{else}--><!--{$tel03|escape}--><!--{/if}-->" maxlength="<!--{$smarty.const.TEL_LEN}-->" style="<!--{$arrErr.tel|sfGetErrorColor}-->" size="40" inputmode="numeric"/>
					</dd>

			</dl>
            </div>
		</form>
	</div>
	<ul>
		<li class="mg_newbtn">
			<a href="javascript:void(0);" onclick="document.form1.submit();">登録する<input type="hidden" name="register" id="register" /></a>
		</li>
	</ul>

	<div class="mypage_back">
    	<a href="javascript:void(0);" onClick="history.back(); return false;" >
            <div class="mg_back">
                戻る<input type="hidden" name="back" id="back" />
            </div>
        </a>
    </div>
</div>

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
       }
      else{
        $(this).css("background","#fff").one("focus",function(){
               $(this).css("background","#fff");
          });
      }
    });
});
</script>


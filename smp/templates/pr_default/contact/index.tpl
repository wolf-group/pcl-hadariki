<div id="guidecolumn">
	<div class="guide_inner">
		<h2>お問い合わせ</h2>
		<p>お問い合わせはメールにて承っています。</p>
		<p class="attention">※ご注文に関するお問い合わせには、必ず「ご注文番号」と「お名前」をご記入の上、メールくださいますようお願いいたします。</p>
		<form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="confirm" />
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|escape}-->" value="<!--{$transactionid|escape}-->" />

			<!--{$add_html}-->
			<div class="guide_info">
				<ul>
					<li class="guide_info_head">お名前<span class="attention">※</span></li>
					<li class="guide_info_inner02">
						<span class="attention"><!--{$arrErr.name01}--><!--{$arrErr.name02}--></span>
						姓&nbsp;<input type="text" class="box120" name="name01" value="<!--{$name01|default:$arrData.name01|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name01|sfGetErrorColor}-->" />&nbsp;&nbsp;名&nbsp;<input type="text" class="box120" name="name02" value="<!--{$name02|default:$arrData.name02|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name02|sfGetErrorColor}-->" />
					</li>
					<li class="guide_info_head">お名前(ﾌﾘｶﾞﾅ)<span class="attention">※</span></li>
					<li class="guide_info_inner02">
						<span class="attention"><!--{$arrErr.kana01}--><!--{$arrErr.kana02}--></span>
						ｾｲ&nbsp;<input type="text" class="box120" name="kana01" value="<!--{$kana01|default:$arrData.kana01|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana01|sfGetErrorColor}-->" />&nbsp;&nbsp;ﾒｲ&nbsp;<input type="text" class="box120" name="kana02" value="<!--{$kana02|default:$arrData.kana02|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana02|sfGetErrorColor}-->" />
					</li>
					<li class="guide_info_head">郵便番号</li>
					<li class="guide_info_inner02">
						<span class="attention"><!--{$message}--></span>
						<span class="attention"><!--{$arrErr.zip01}--><!--{$arrErr.zip02}--></span>
						<p>〒&nbsp;<input type="text" name="zip01" class="box60" value="<!--{$zip01|default:$arrData.zip01|escape}-->" maxlength="<!--{$smarty.const.ZIP01_LEN}-->" style="<!--{$arrErr.zip01|sfGetErrorColor}-->" />&nbsp;-&nbsp;<input type="text" name="zip02" class="box60" value="<!--{$zip02|default:$arrData.zip02|escape}-->" maxlength="<!--{$smarty.const.ZIP02_LEN}-->" style="<!--{$arrErr.zip02|sfGetErrorColor}-->" /></p>
						<p class="zipimg"><input onclick="document.form1.mode.value='zip_search';" type="image" src="<!--{$TPL_DIR}-->img/common/address.gif" alt="住所自動入力" name = "mode" value = "zip_search" /></p>
						<p class="atention">※郵便番号を入力後、クリックしてください。</p>
					</li>
					<li class="guide_info_head">住所</li>
					<li class="guide_info_inner02">
						<span class="attention"><!--{$arrErr.pref}--><!--{$arrErr.addr01}--><!--{$arrErr.addr02}--></span>
						<select name="pref" style="<!--{$arrErr.pref|sfGetErrorColor}-->">
							<option value="">都道府県を選択</option>
							<!--{html_options options=$arrPref selected=$pref|default:$arrData.pref|escape}-->
						</select>
						<p>
							<input type="text" class="box380" name="addr01" value="<!--{$addr01|default:$arrData.addr01|escape}-->" style="<!--{$arrErr.addr01|sfGetErrorColor}-->" /><br />
							<span class="s_text"><!--{$smarty.const.SAMPLE_ADDRESS1}--></span>
						</p>
						<p>
							<input type="text" class="box380" name="addr02" value="<!--{$addr02|default:$arrData.addr02|escape}-->" style="<!--{$arrErr.addr02|sfGetErrorColor}-->" /><br />
							<span class="s_text"><!--{$smarty.const.SAMPLE_ADDRESS2}--></span>
						</p>
						<p class="attention">※住所は2つに分けてご記入いただけます。マンション名は必ず記入してください。</p>
					</li>
					<li class="guide_info_head">電話番号</li>
					<li class="guide_info_inner02">
						<span class="attention"><!--{$arrErr.tel01}--><!--{$arrErr.tel02}--><!--{$arrErr.tel03}--></span>
						<input type="text" class="box60" name="tel01" value="<!--{$tel01|default:$arrData.tel01|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel01|sfGetErrorColor}-->" />&nbsp;-&nbsp;<input type="text" class="box60" name="tel02" value="<!--{$tel02|default:$arrData.tel02|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel02|sfGetErrorColor}-->" />&nbsp;-&nbsp;<input type="text" class="box60" name="tel03" value="<!--{$tel03|default:$arrData.tel03|escape}-->" maxlength="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel03|sfGetErrorColor}-->" />
					</li>
					<li class="guide_info_head">e-mail<span class="attention">※</span></li>
					<li class="guide_info_inner02">
						<span class="attention"><!--{$arrErr.email}--><!--{$arrErr.email02}--></span>
						<input type="text" autocorrect="off" autocapitalize="off" class="box380" name="email" value="<!--{$email|default:$arrData.email|escape}-->" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" style="<!--{$arrErr.email|sfGetErrorColor}-->" /><br />
						<!--{* ログインしていれば入力済みにする *}-->
					</li>

					<!--{if $contactRequired !== $contact_stting_do_not_use}-->
						<li class="guide_info_head">お問い合せ種別<!--{if $contactRequired === $contact_stting_required}--><span class="attention">※</span><!--{/if}--></li>
						<li class="guide_info_inner02">
							<span class="attention"><!--{$arrErr.contact_type}--></span>
							<select name="contact_type">
								<option value="" >選択してください</option>
								<!--{foreach from=$arrContactTypes item=t_contact_type}-->
									<!--{if $t_contact_type}-->
										<option value="<!--{$t_contact_type|escape}-->" <!--{if $t_contact_type == $contact_type}-->selected="selected"<!--{/if}-->><!--{$t_contact_type|escape}--></option>
									<!--{/if}-->
								<!--{/foreach}-->
							</select>
						</li>
					<!--{/if}-->
					<li class="guide_info_head">お問い合せ内容<span class="attention">※</span></li>
					<li class="guide_info_inner02">
						<span class="attention"><!--{$arrErr.contents}--></span>
						<span class="mini">（全角<!--{$smarty.const.MLTEXT_LEN}-->字以下）</span>
						<textarea name="contents" class="area380" cols="60" rows="20" style="<!--{$arrErr.contents|sfGetErrorColor}-->"><!--{$contents|escape}--></textarea>
					</li>
				</ul>
			</div>
			<ul>
				<li class="sp_btn">
					<a href="javascript:void(0);" onclick="document.form1.submit();">確認ページへ<input type="hidden" name="confirm" /></a>
				</li>
			</ul>
			<p class="attention">
				※ 内容によっては回答をさしあげるのにお時間をいただくこともございます。また、土日、祝祭日、年末年始、夏季期間は翌営業日以降の対応となりますのでご了承ください。
			</p>
		</form>
	</div>
</div>


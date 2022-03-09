
<!--ダイアログ-->
<div class="none_area ups_dialog" id="smp-lpshoppingcolumn" title="確認">
	<form name="ups_dialog_form" id="ups_dialog_form" method="post" action="/smp/shopping/lp.php" autocomplete="off" data-allow_credit="0">
		<div class="smp-lp-section">
			<dl>
				<dd>
					<div class="lp_detail">
						<ul>
							<li class="w70">
								<p class="sp_ftb">商品名</p>
								<div class="w100">
									<input id="product_id" name="product_id" type="hidden" value="<!--{$tups|escape}-->">
									<p class="product_name">商品名</p>
								</div>
							</li>
							<!--{* 数量は適宜編集してください。*}-->
							<li class="w30">
								<p class="sp_ftb">数量</p>
								<div class="custom-select w100">
									<select name="quantity" id="quantity" class="w90p" style="text-align:center;">
										<!--{assign var=key1 value="quantity"}-->
										<option value="1"<!--{if $arrForm[$key1] == "1"}--> selected="selected"<!--{/if}-->>1</option>
										<option value="2"<!--{if $arrForm[$key1] == "2"}--> selected="selected"<!--{/if}-->>2</option>
										<option value="3"<!--{if $arrForm[$key1] == "3"}--> selected="selected"<!--{/if}-->>3</option>
										<option value="4"<!--{if $arrForm[$key1] == "4"}--> selected="selected"<!--{/if}-->>4</option>
										<option value="5"<!--{if $arrForm[$key1] == "5"}--> selected="selected"<!--{/if}-->>5</option>
										<option value="6"<!--{if $arrForm[$key1] == "6"}--> selected="selected"<!--{/if}-->>6</option>
										<option value="7"<!--{if $arrForm[$key1] == "7"}--> selected="selected"<!--{/if}-->>7</option>
										<option value="8"<!--{if $arrForm[$key1] == "8"}--> selected="selected"<!--{/if}-->>8</option>
										<option value="9"<!--{if $arrForm[$key1] == "9"}--> selected="selected"<!--{/if}-->>9</option>
										<option value="10"<!--{if $arrForm[$key1] == "10"}--> selected="selected"<!--{/if}-->>10</option>
									</select>
								</div>
							</li>
						</ul>
						<span class="smp-lp-error clear"><!--{$arrErr.product_id}--><!--{$arrErr.time_sale_err}--><!--{$arrErr.time_disp_err}--><!--{$arrErr.product_err}--></span>
						<span class="smp-lp-error"><!--{$arrErr.quantity}--></span>
					</div>
				</dd>

				<!--{* 各規格 商品を選択すると、自動的に表示されます。 *}-->
				<dd id="class_category" style="display:none;" class="clear">
					<div class="bg_ct sp_ftb">規格</div>
					<!--{* ↓このdiv内に規格用のセレクトボックスが表示されます↓ *}-->
					<div class="smp-lp-classcategory" id="class_category_select"></div>
					<!--{* ↑このdiv内に規格用のセレクトボックスが表示されます↑ *}-->
				</dd>
			</dl>
		</div>

		<!-- AJAX追加 -->
		<!--{* お支払方法は、商品選択されると表示されます *}-->
		<div id="payment_area" class="smp-lp-section" style="display:none;">
			<h3>お支払方法</h3>
			<!--{* ↓このspan内にお支払方法のチェックボックス群が表示されます↓ *}-->
			<div id="payment_methods"></div>
			<!--{* ↑このspan内にお支払方法のチェックボックス群が表示されます↑ *}-->
			<table>
				<input id="payment_id_hidden" name="payment_id" type="hidden" value="">
				<td><p id="payment_txt"></p></td>
				<td>
					<!--{* 同一のお支払方法が設定できる商品で、お支払い方法を変更したい場合はLP画面に遷移します *}-->
					<div>
						<button type="button" class="cng_payment_link" data-href="lp.php?up=<!--{$tups|escape}-->&p=<!--{$lp_page|escape}-->&scroll=#payment_area"><p>お支払方法を変更する</p></button>
					</div>
				</td>
			</table>
		</div>

		<div class="smp-lp-section">
		<!--{* 商品が選択された状態で、それが定期商品であれば、以下が自動的に表示されます。未選択や非定期商品選択時は消えます *}-->
			<dl>
				<div style="display: none;"><!--{* 定期選択時に定期購入チェックボックスを表示させたい場合は消してください。 *}-->
					<dd id="regular_product_area" style="display:none;" class="lp-regular clear">
						<h2>
							<input type="checkbox" name="regular" value="1" class="chbox" id="regular"<!--{if ($regular_product && $reg_flg == 1) || ($regular_product && $no_regular == 0)}--> checked="checked" <!--{/if}--> />
							<label for="regular" style="margin-left: 5px;">定期購入を希望する</label>
						</h2>
					</dd>
				</div>
			</dl>

			<!--{* 上記の「定期購入を希望する」をチェックしてる場合のみ表示されます。それ以外は消えます *}-->
			<div class="lp-regular smp-lp-bottomline" id="regular-deliv_area" style="display:none; border-top:none; margin-top: 0; padding-top: 0;">
				<h3>お届け間隔の指定</h3>
				<dl>
					<!--{* ↓定期配送間隔がこちらに表示されます↓ *}-->
					<span id="regular_cycle_area"></span>
					<!--{* ↑定期配送間隔がこちらに表示されます↑ *}-->
				</dl>
				<div class="clear"></div>
			</div>
			<!--{* 定期関連ここまで *}-->
		</div>

		<div class="smp-lp-section" id="deliv_datetime_area" style="display:none;">
			<h3>お届け希望日時</h3>
			<!--{* ↓このspan内にお届け時間関連が表示されます。デザイン変更はlp_ajax.tplを編集してください。↓ *}-->
			<div id="deliv_time_area"></div>
			<!--{* ↑このspan内にお届け時間関連が表示されます。デザイン変更はlp_ajax.tplを編集してください。↑ *}-->
		</div>

		<!--{* ↓編集しないでください↓ *}-->
		<!--{* LP画面で使用していたPOST値をセット *}-->
		<div id="lp_post_hidden" style="display:none;">
			<!--{foreach from=$lp_post key=key item=val}-->
				<!--{if $key == 'payment_id'}-->
					<input type="hidden" name="payment_id" class="payment_id_h" value="<!--{$val|escape}-->" />
					<input type="hidden" name="payment_id_selected" class="payment_id_selected" value="<!--{$val|escape}-->" />
				<!--{else}-->
					<input type="hidden" name="<!--{$key|escape}-->" value="<!--{$val|escape}-->" />
				<!--{/if}-->
			<!--{/foreach}-->
			<!--{if $isSmpAgent}-->
				<input type="hidden" name="ajax_url" id="ajax_url" value="/smp/shopping/lp_ajax.php?p=<!--{$lp_page|escape}-->" />
			<!--{else}-->
				<input type="hidden" name="ajax_url" id="ajax_url" value="/shopping/lp_ajax.php?p=<!--{$lp_page|escape}-->" />
			<!--{/if}-->
		</div>
		<!--{* ↑編集しないでください↑ *}-->

		<!--購入確認画面-->
		<div class="smp-lp-bottomline">
			<div class="smp-lp-section">
				<img class="lp_step_img" style="display:none;" src="<!--{$TPL_DIR}-->img/common/lp_step.png" alt="LPのステップ" align="middle" /><br />
				<span class="smp-lp-error smp-lp-confirm" id="alert_errors" <!--{if !$arrErr}-->style="display:none;"<!--{/if}-->>
				<!--{if $arrErr}-->
					<!--{foreach from=$arrErr key=key item=item}-->
						<!--{$item}--><br/>
					<!--{/foreach}-->
				<!--{/if}-->
				</span>
				<div style="text-align:center;" id="confirm_submit">
					<input type="button" id="confirm_submit_image" value="購入確認画面へ" onclick="return false;" style="outline:none; display:none;">
				</div>
			</div>
		</div>
	</form>
	<div id="paygent_credit_type" style="display:none;" data-is_paygent_credit_regular="<!--{if $is_paygent_credit_regular}-->1<!--{else}-->0<!--{/if}-->" data-is_paygent_credit_normal="<!--{if $is_paygent_credit_normal}-->1<!--{else}-->0<!--{/if}-->"></div>
	<div id="payment_type" style="display:none;" data-is_credit="<!--{if $is_credit}-->1<!--{else}-->0<!--{/if}-->"></div>
	<div id="product_type" style="display:none;" data-is_regular="<!--{if $lp_post.no_regular == "0"}-->1<!--{else}-->0<!--{/if}-->"></div>
</div>

<script type="text/javascript" src="/js/lp.compress.js?<!--{$smarty.const.FRONT_JS_VERSION|escape}-->"></script>
<link rel="stylesheet" href="<!--{$TPL_DIR}-->css/lp.css?<!--{$smarty.const.FRONT_CSS_VERSION|escape}-->" type="text/css" media="all" />

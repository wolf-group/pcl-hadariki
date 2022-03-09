<!--{printXMLDeclaration}--><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--{*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2007 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *}-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="ja" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$smarty.const.CHAR_CODE}-->" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Pragma" content="no-cache">
<link rel="stylesheet" href="<!--{$TPL_DIR}-->css/common.css?<!--{$smarty.const.FRONT_CSS_VERSION}-->" type="text/css" media="all" />
<!--{$pc_front_head|smarty:nodefaults}-->
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/css.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/navi.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/win_op.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/site.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<meta name="author" content="<!--{$arrPageLayout.author|escape}-->" />
<meta name="description" content="<!--{$arrPageLayout.description|escape}-->" />
<meta name="keywords" content="<!--{$arrPageLayout.keyword|escape}-->" />
<title><!--{$arrSiteInfo.shop_name}-->/お客様の声書き込み（入力ページ）</title>
</head>
<body onload="preLoadImg('<!--{$TPL_DIR}-->')">
<a name="top" id="top"></a>

<div id="windowcolumn">
	<div id="windowarea">
		<div class="head">
			<h2 class="t_mypage">お客様の声書き込み</h2>
		</div>
		<p class="windowtext">以下の商品について、お客様のご意見、ご感想をどしどしお寄せください。<br />
		「<span class="attention">※</span>」印は入力必須項目です。<br />
		ご入力後、一番下の「確認ページへ」ボタンをクリックしてください。</p>
		<form name="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
			<input type="hidden" name="mode" value="confirm" />
			<input type="hidden" name="product_id" value="<!--{$arrForm.product_id}-->" />
			<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
			<table summary="お客様の声書き込み">
				<tr>
					<th>商品名</th>
					<td><!--{$arrForm.name|escape}--></td>
				</tr>
				<tr>
					<th>投稿者名<span class="attention">※</span></th>
						<td>
							<span class="attention"><!--{$arrErr.reviewer_name}--></span><input type="text" name="reviewer_name" value="<!--{$arrForm.reviewer_name|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.reviewer_name|sfGetErrorColor}-->" size="40" class="box350" />
						</td>
				</tr>
				<tr>
					<th>ホームページアドレス</th>
						<td>
							<span class="attention"><!--{$arrErr.reviewer_url}--></span><input type="text" name="reviewer_url" value="<!--{$arrForm.reviewer_url|escape}-->" maxlength="<!--{$smarty.const.MTEXT_LEN}-->" style="<!--{$arrErr.reviewer_url|sfGetErrorColor}-->" size="40" class="box350" />
						</td>
				</tr>
				<tr>
					<th>性別</th>
					<td>
						<input type="radio" name="sex" id="man" value="1" <!--{if $arrForm.sex eq 1}--> checked="checked"<!--{/if}--> /><label for="man">男性</label>&nbsp;
						<input type="radio" name="sex" id="woman" value="2" <!--{if $arrForm.sex eq 2}--> checked="checked"<!--{/if}--> /><label for="woman">女性</label>
					</td>
				</tr>
				<tr>
					<th>おすすめレベル<span class="attention">※</span></th>
						<td>
							<span class="attention"><!--{$arrErr.recommend_level}--></span>
							<select name="recommend_level" style="<!--{$arrErr.recommend_level|sfGetErrorColor}-->">
								<option value="" selected="selected">選択してください</option>
								<!--{html_options options=$arrRECOMMEND selected=$arrForm.recommend_level}-->
							</select>
					</td>
				</tr>
				<tr>
					<th>タイトル</th>
					<td>
						<span class="attention"><!--{$arrErr.title}--></span>
						<input type="text" name="title" value="<!--{$arrForm.title|escape}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.title|sfGetErrorColor}-->" size="40" class="box350" />
					</td>
				</tr>
				<tr>
					<th>コメント<span class="attention">※</span></th>
					<td>
						<span class="attention"><!--{$arrErr.comment}--></span>
						<textarea name="comment" cols="50" rows="10" style="<!--{$arrErr.comment|sfGetErrorColor}-->" class="area350"><!--{$arrForm.comment|escape}--></textarea>
					</td>
				</tr>
			</table>

			<ul class="btn_area_l2">
				<li class="btn">
					<span class="btn_next">
						<a href="javascript:void(0);" onclick="document.form1.submit();">確認ページへ</a>
					</span>
				</li>
			</ul>

		</form>
	</div>
</div>
</body>
</html>


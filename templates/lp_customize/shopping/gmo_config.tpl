<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">

<head>
<meta http-equiv="content-type" content="application/xhtml+xml; charset=<!--{$smarty.const.CHAR_CODE}-->" />
<meta http-equiv="content-script-type" content="text/javascript" />
<meta http-equiv="content-style-type" content="text/css" />
<link rel="stylesheet" href="<!--{$smarty.const.URL_DIR}-->admin/css/contents.css?<!--{$smarty.const.FRONT_CSS_VERSION}-->" type="text/css" media="all" />
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/css.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/navi.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/win_op.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/site.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<script type="text/javascript" src="<!--{$TPL_DIR}-->js/admin.js?<!--{$smarty.const.FRONT_JS_VERSION}-->"></script>
<!--{include file='css/contents.tpl'}-->
<title><!--{$tpl_subtitle}--></title>
<script type="text/javascript">
<!--
function win_open(URL){
	var WIN;
	WIN = window.open(URL);
	WIN.focus();
}

function opener_reload(url){
	window.opener.location.href = url ;
	window.close();
}

function toggleBox() {
	var checked = document.form1.use_idnet.checked;

	for (var i = 0; i < toggleBox.arguments.length; i++) {
		var inputBox = document.getElementById(toggleBox.arguments[i]);

		if (checked) {
			inputBox.disabled = false;
		} else {
			inputBox.disabled = true;
		}
	}
}
//-->
</script>
</head>

<body bgcolor="#ffffff" text="#666666" link="#007bb7" vlink="#007bb7" alink="#cc0000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="<!--{$tpl_onload}-->">
<noscript>
<link rel="stylesheet" href="<!--{$TPL_DIR}-->admin/css/common.css?<!--{$smarty.const.FRONT_CSS_VERSION}-->" type="text/css" />
</noscript>

<div align="center">
<!--???CONTENTS-->
<form name="form1" action="<!--{$smarty.server.REQUEST_URI|escape}-->" method="post">
<input type="hidden" name="mode" value="register">
<table width="500" border="0" cellspacing="0" cellpadding="0" summary=" ">
	<tr valign="top">
		<td class="mainbg">
			<table width="500" border="0" cellspacing="0" cellpadding="0" summary=" ">
				<!--??????????????????-->
				<tr>
					<td align="center">
						<table width="470" border="0" cellspacing="0" cellpadding="0" summary=" ">
							<tr><td height="14"></td></tr>
							<tr>
								<td colspan="3"><img src="<!--{$TPL_DIR}-->img/contents/main_top.jpg" width="470" height="14" alt=""></td>
							</tr>
							<tr>
								<td background="<!--{$TPL_DIR}-->img/contents/main_left.jpg"><img src="<!--{$TPL_DIR}-->img/common/_.gif" width="14" height="1" alt=""></td>
								<td bgcolor="#cccccc" >
									<table width="442" border="0" cellspacing="0" cellpadding="0" summary=" ">
										<tr>
											<td colspan="3"><img src="<!--{$TPL_DIR}-->img/contents/contents_title_top.gif" width="442" height="7" alt=""></td>
										</tr>
										<tr>
											<td background="<!--{$TPL_DIR}-->img/contents/contents_title_left_bg.gif"><img src="<!--{$TPL_DIR}-->img/contents/contents_title_left.gif" width="22" height="12" alt=""></td>
											<td bgcolor="#636469" width="402" class="fs14n"><span class="white"><!--???????????????????????????--><!--{$tpl_subtitle}--></span></td>
											<td background="<!--{$TPL_DIR}-->img/contents/contents_title_right_bg.gif"><img src="<!--{$TPL_DIR}-->img/common/_.gif" width="18" height="1" alt=""></td>
										</tr>
										<tr>
											<td colspan="3"><img src="<!--{$TPL_DIR}-->img/contents/contents_title_bottom.gif" width="442" height="7" alt=""></td>
										</tr>
										<tr>
											<td colspan="3"><img src="<!--{$TPL_DIR}-->img/contents/main_bar.jpg" width="442" height="10" alt=""></td>
										</tr>
									</table>

									<table width="442" border="0" cellspacing="1" cellpadding="8" summary=" ">
										<tr class="fs12n">
											<td bgcolor="#ffffff">
												GMO????????????????????????????????????????????????????????????????????????????????????
												????????????????????????GMO????????????????????????????????????????????????????????????????????????????????????????????????????????????
												?????????????????????????????????????????????????????????????????????????????????????????????????????????<br/><br/>
												<a href="http://www.gmo-pg.com/" target="_blank"> ?????? GMO???????????????????????????????????????????????????????????????</a>
											</td>
										</tr>
									</table>

									<table width="442" border="0" cellspacing="0" cellpadding="0" summary=" ">
										<tr><td><img src="<!--{$TPL_DIR}-->img/contents/main_bar.jpg" width="442" height="10" alt=""></td></tr>
									</table>

									<table width="442" border="0" cellspacing="1" cellpadding="8" summary=" ">
									<tr class="fs12n">
										<td colspan="2" width="90" bgcolor="#f3f3f3">?????????</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">????????????URL<span class="red">???</span></td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value=server_url}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<input type="text"
												   name="<!--{$key}-->"
												   class="box40"
												   value="<!--{$arrForm[$key].value|escape}-->"
												   max_length="<!--{$arrForm[$key].length|escape}-->">
										</td>
										</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">?????????ID<span class="red">???</span></td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value=site_id}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<input type="text"
												   name="<!--{$key}-->"
												   class="box40"
												   value="<!--{$arrForm[$key].value|escape}-->"
												   max_length="<!--{$arrForm[$key].length|escape}-->">
										</td>
										</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">????????????????????????<span class="red">???</span></td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value=site_pass}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<input type="password"
												   name="<!--{$key}-->"
												   class="box40"
												   value="<!--{$arrForm[$key].value|escape}-->"
												   max_length="<!--{$arrForm[$key].length|escape}-->">
										</td>
										</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">????????????ID<span class="red">???</span></td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value=shop_id}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<input type="text"
												   name="<!--{$key}-->"
												   class="box40"
												   value="<!--{$arrForm[$key].value|escape}-->"
												   max_length="<!--{$arrForm[$key].length|escape}-->">
										</td>
										</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">???????????????????????????<span class="red">???</span></td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value=shop_pass}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<input type="password"
												   name="<!--{$key}-->"
												   class="box40"
												   value="<!--{$arrForm[$key].value|escape}-->"
												   max_length="<!--{$arrForm[$key].length|escape}-->">
										</td>
										</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">????????????<span class="red">???</span></td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value=jobcd}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<input type="radio"
												   name="<!--{$key}-->"
												   value="0" <!--{if $arrForm[$key].value == '0'}-->checked=checked<!--{/if}--> >AUTH(?????????)<br />
											<input type="radio"
												   name="<!--{$key}-->"
												   value="1" <!--{if $arrForm[$key].value == '1'}-->checked=checked<!--{/if}--> >CHECK(?????????????????????)<br />
											<input type="radio"
												   name="<!--{$key}-->"
												   value="2" <!--{if $arrForm[$key].value == '2'}-->checked=checked<!--{/if}--> >CAPTURE(????????????)<br />
										</td>
										</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">????????????????????????</td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value="use3d"}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<input type="checkbox"
												   name="<!--{$key}-->"
												   style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
												   value="1"
												   maxlength="<!--{$arrForm[$key].length}-->" <!--{if $arrForm[$key].value}--> checked <!--{/if}-->> ?????????????????????????????????????????????????????????<br>
												   ????????????????????????????????????????????????SSL?????????????????????<br>
												   ????????????????????????????????????????????????<br>
												   (????????????????????????????????????)
										</td>
										</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">??????ID??????</td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value="use_customer_reg"}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<input type="checkbox"
												   name="<!--{$key}-->"
												   style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
												   value="1"
												   maxlength="<!--{$arrForm[$key].length}-->" <!--{if $arrForm[$key].value}--> checked <!--{/if}-->> ?????????????????????????????????????????????????????????<br>
										</td>
										</td>
									</tr>
									<tr class="fs12n">
										<td colspan="2" width="90" bgcolor="#f3f3f3">???iD?????????????????????</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">iD???????????????</td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value="use_idnet"}-->
											<!--{if $arrForm[$key].value == ''}--><!--{assign var=disable value='disabled="disabled"'}--><!--{/if}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<input onclick="toggleBox('idnet_server_url', 'idnet_shop_id', 'idnet_shop_pass', 'idnet_strmask_path', 'shopid', 'shoppw', 'termurl', 'target_url');"
												   type="checkbox"
												   name="<!--{$key}-->"
												   style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
												   value="1"
												   maxlength="<!--{$arrForm[$key].length}-->" <!--{if $arrForm[$key].value}--> checked <!--{/if}-->> ?????????????????????????????????????????????????????????
										</td>
										</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">????????????URL<span class="red">???</span></td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value=idnet_server_url}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<input id="<!--{$key}-->"
												   type="text"
												   name="<!--{$key}-->"
												   class="box40"
												   value="<!--{$arrForm[$key].value|escape}-->"
												   max_length="<!--{$arrForm[$key].length|escape}-->" <!--{$disable}-->>
										</td>
										</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">????????????ID<br>(GMO-PG)<span class="red">???</span></td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value=idnet_shop_id}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<input id="<!--{$key}-->"
												   type="text"
												   name="<!--{$key}-->"
												   class="box40"
												   value="<!--{$arrForm[$key].value|escape}-->"
												   max_length="<!--{$arrForm[$key].length|escape}-->" <!--{$disable}-->>
										</td>
										</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">???????????????????????????(GMO-PG)<span class="red">???</span></td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value=idnet_shop_pass}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<input id="<!--{$key}-->"
												   type="password"
												   name="<!--{$key}-->"
												   class="box40"
												   value="<!--{$arrForm[$key].value|escape}-->"
												   max_length="<!--{$arrForm[$key].length|escape}-->" <!--{$disable}-->>
										</td>
										</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">strmask????????????<span class="red">???</span></td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value=idnet_strmask_path}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<input id="<!--{$key}-->"
												   type="text"
												   name="<!--{$key}-->"
												   class="box40"
												   value="<!--{$arrForm[$key].value|escape}-->"
												   max_length="<!--{$arrForm[$key].length|escape}-->" <!--{$disable}-->>
										</td>
										</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">???????????????URL<span class="red">???</span></td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value=target_url}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<input id="<!--{$key}-->"
												   type="text"
												   name="<!--{$key}-->"
												   class="box40"
												   value="<!--{$arrForm[$key].value|escape}-->"
												   max_length="<!--{$arrForm[$key].length|escape}-->" <!--{$disable}-->>
										</td>
										</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">???????????????URL<span class="red">???</span></td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value=termurl}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<!--{$smarty.const.SSL_URL}--><br>
											<input id="<!--{$key}-->"
												   type="text"
												   name="<!--{$key}-->"
												   class="box40"
												   value="<!--{$arrForm[$key].value|escape}-->"
												   max_length="<!--{$arrForm[$key].length|escape}-->" <!--{$disable}-->>
										</td>
										</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">????????????ID<span class="red">???</span></td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value=shopid}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<input id="<!--{$key}-->"
												   type="text"
												   name="<!--{$key}-->"
												   class="box40"
												   value="<!--{$arrForm[$key].value|escape}-->"
												   max_length="<!--{$arrForm[$key].length|escape}-->" <!--{$disable}-->>
										</td>
										</td>
									</tr>
									<tr class="fs12n">
										<td bgcolor="#f3f3f3">???????????????????????????<span class="red">???</span></td>
										<td bgcolor="#ffffff">
											<!--{assign var=key value=shoppw}-->
											<span class="red"><!--{$arrErr[$key]}--></span>
											<input id="<!--{$key}-->"
												   type="password"
												   name="<!--{$key}-->"
												   class="box40"
												   value="<!--{$arrForm[$key].value|escape}-->"
												   max_length="<!--{$arrForm[$key].length|escape}-->" <!--{$disable}-->>
										</td>
										</td>
									</tr>
									</table>
									<table width="442" border="0" cellspacing="0" cellpadding="0" summary="">
										<tr>
											<td bgcolor="#cccccc"><img src="<!--{$TPL_DIR}-->img/common/_.gif" width="1" height="5" alt=""></td>
											<td><img src="<!--{$TPL_DIR}-->img/contents/tbl_top.gif" width="440" height="7" alt=""></td>
											<td bgcolor="#cccccc"><img src="<!--{$TPL_DIR}-->img/common/_.gif" width="1" height="5" alt=""></td>
										</tr>
										<tr>
											<td bgcolor="#cccccc"><img src="<!--{$TPL_DIR}-->img/common/_.gif" width="1" height="10" alt=""></td>
											<td bgcolor="#e9e7de" align="center">
											<table border="0" cellspacing="0" cellpadding="0" summary=" ">
												<tr>
													<td><input type="image" onMouseover="chgImgImageSubmit('<!--{$TPL_DIR}-->img/contents/btn_regist_on.jpg',this)" onMouseout="chgImgImageSubmit('<!--{$TPL_DIR}-->img/contents/btn_regist.jpg',this)" src="<!--{$TPL_DIR}-->img/contents/btn_regist.jpg" width="123" height="24" alt="???????????????????????????" border="0" name="subm"></td>
												</tr>
											</table>
											</td>
											<td bgcolor="#cccccc"><img src="<!--{$TPL_DIR}-->img/common/_.gif" width="1" height="10" alt=""></td>
										</tr>
										<tr>
											<td colspan="3"><img src="<!--{$TPL_DIR}-->img/contents/tbl_bottom.gif" width="442" height="8" alt=""></td>
										</tr>
									</table>
								</td>
								<td background="<!--{$TPL_DIR}-->img/contents/main_right.jpg"><img src="<!--{$TPL_DIR}-->img/common/_.gif" width="14" height="1" alt=""></td>
							</tr>
							<tr>
								<td colspan="3"><img src="<!--{$TPL_DIR}-->img/contents/main_bottom.jpg" width="470" height="14" alt=""></td>
							</tr>
							<tr><td height="30"></td></tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</form>
</table>

<!--???CONTENTS-->
</div>


</body>
</html>

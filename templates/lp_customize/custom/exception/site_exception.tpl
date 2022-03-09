<!--{*
 **    ____                        __     _____ __
 *    / __ \___  ____  ___  ____ _/ /_   / ___// /_____  ________
 *   / /_/ / _ \/ __ \/ _ \/ __ `/ __/   \__ \/ __/ __ \/ ___/ _ \
 *  / _, _/  __/ /_/ /  __/ /_/ / /_    ___/ / /_/ /_/ / /  /  __/
 * /_/ |_|\___/ .___/\___/\__,_/\__/   /____/\__/\____/_/   \___/
 *           /_/
 *
 * Repeat Store: Online shopping cart system for "Subscription and Distribution group"
 *
 * @category    application
 * @package     rpst
 *
*}-->
<!--▼CONTENTS-->
<div id="mypagecolumn">
	<div class="head">
		<h2 class="t_mypage">マイページ</h2>
	</div>
	<!--{include file=$tpl_navi}-->

	<div id="mycontentsarea">
		<p class="error btn_area_n2">システムエラーが発生しました。</p>

		<ul class="btn_area_l2">
			<li class="btn2">
				<span class="btn_prev"><a href="javascript:history.back()">前のページへ</a></span>
			</li>
		</ul>

		<div class="mg_change">
<!--{$stack_trace_html|escape}-->
		</div>
	</div>
</div>
<!--▲CONTENTS-->

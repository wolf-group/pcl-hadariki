<!--▼CONTENTS-->
<form name="form1" id="form1" method="post" action="<!--{$smarty.server.PHP_SELF|escape}-->">
	<input type="hidden" name="mode" value="confirm" />
	<div id="shoppingcolumn">
		<div class="shopping_inner">
			<h2>お届け間隔の指定</h2>
			<span class="attention"><!--{$arrErr.cycle_type}--></span>

			<!--{assign var=key1 value="cycle_date:monthly"}-->
			<!--{assign var=key2 value="cycle_date:day"}-->
			<!--{if $regular_product.$key1 && $regular_product.$key2}-->
			<div class="calender">
				<input type="radio" name="cycle_type" id="cycle_type1" value="1" <!--{if $arrForm.cycle_type == 1}-->checked="checked"<!--{/if}-->><label for="cycle_type1">日付で指定</label><br />
				<select name="cycle_date_monthly">
					<!--{foreach from=$regular_product.$key1 key=key item=val}-->
						<option value="<!--{$val}-->" <!--{if $arrForm.cycle_date_monthly == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_monthly.$val}--></option>
					<!--{/foreach}-->
				</select>
				<select name="cycle_date_day">
					<!--{foreach from=$regular_product.$key2 key=key item=val}-->
						<option value="<!--{$val}-->" <!--{if $arrForm.cycle_date_day == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_date_day.$val}--></option>
					<!--{/foreach}-->
				</select>
				にお届け
			</div>
			<!--{/if}-->

			<!--{assign var=key1 value="cycle_week:monthly"}-->
			<!--{assign var=key2 value="cycle_week:ordinal"}-->
			<!--{assign var=key3 value="cycle_week:week"}-->
			<!--{if $regular_product.$key1 && $regular_product.$key2 && $regular_product.$key3}-->
			<div class="calender">
				<input type="radio" name="cycle_type" id="cycle_type2" value="2" <!--{if $arrForm.cycle_type == 2}-->checked="checked"<!--{/if}-->><label for="cycle_type2">曜日で指定</label><br />
				<select name="cycle_week_monthly">
					<!--{foreach from=$regular_product.$key1 key=key item=val}-->
						<option value="<!--{$val}-->" <!--{if $arrForm.cycle_week_monthly == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_monthly.$val}--></option>
					<!--{/foreach}-->
				</select>
				<select name="cycle_week_ordinal">
					<!--{foreach from=$regular_product.$key2 key=key item=val}-->
						<option value="<!--{$val}-->" <!--{if $arrForm.cycle_week_ordinal == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_week_ordinal.$val}--></option>
					<!--{/foreach}-->
				</select>
				<select name="cycle_week_week">
					<!--{foreach from=$regular_product.$key3 key=key item=val}-->
						<option value="<!--{$val}-->" <!--{if $arrForm.cycle_week_week == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_week.$val}--></option>
					<!--{/foreach}-->
				</select>
				にお届け
			</div>
			<!--{/if}-->

			<!--{assign var=key1 value="cycle_interval:interval"}-->
			<!--{if $regular_product.$key1}-->
			<div class="calender">
				<input type="radio" name="cycle_type" id="cycle_type3" value="3" <!--{if $arrForm.cycle_type == 3}-->checked="checked"<!--{/if}-->><label for="cycle_type3">間隔で指定</label><br />
                <div id="cycle_interval_start_date_area">
					初回お届け日
					<div id="cycle_interval_start_date_area">
						<select name="cycle_interval_start_date" id="cycle_interval_start_date">
						<!--{section name=cnt start=0 loop=$regular_config.interval_range}-->
						<!--{assign var=time_ts value=" `$smarty.section.cnt.index` day"|strtotime:$regular_config.allowed_first_interval_date_ts}-->
						<!--{assign var=time value=$time_ts|date_format:"%Y-%m-%d"}-->
						<option value="<!--{$time}-->" <!--{if $arrForm.cycle_interval_start_date == $time}-->selected="selected"<!--{/if}-->><!--{$time_ts|date_format:"%Y年%m月%d日"}--></option>
						<!--{/section}-->
						</select>
						<input type="hidden" name="cycle_interval_start_date_dummy" id="cycle_interval_start_date_dummy" value="" >
					</div>
					から<br />
                </div>
				<select name="cycle_interval_interval">
					<!--{foreach from=$regular_product.$key1 key=key item=val}-->
						<option value="<!--{$val}-->" <!--{if $arrForm.cycle_interval_interval == $val}-->selected="selected"<!--{/if}-->><!--{$common_regular_param.cycle_interval.$val|escape}--></option>
					<!--{/foreach}-->
				</select>
				間隔でお届け
			</div>
			<!--{/if}-->

			<div class="btn_area">
                <!--{if $first_auto == 1}-->
                <input type="checkbox" name="first_quick_flag" id="first_quick_flag" value="1" <!--{if $arrForm.first_quick_flag == 1}-->checked="checked"<!--{/if}-->><label for="first_quick_flag">初回のみ即日発送を希望 ※翌営業日の発送になる場合もあります</label>
                <!--{else}-->
                <input type="checkbox" name="quick_flg" id="quick_flg" value="1" <!--{if $arrForm.quick_flg == 1}-->checked="checked"<!--{/if}-->><label for="quick_flg">最短でのお届けを希望</label>
                <!--{/if}-->
                <br /><br />
				<input type="submit" name="confirm" value="お 届 け 日 の 確 認"><br />
				<p>初回お届け日：<!--{$first_date_jp}--><br />
				2回目お届け日：<!--{$second_date_jp}--></p>
			</div>
			<div style = "text-align:left;margin:5px 5px 10px 5px">
			<!--▼カレンダーここから-->
				<!--{section name=num loop=$arrCalendar}-->
				<!--{assign var=arrCal value=`$arrCalendar[num]`}-->
				<!--{section name=cnt loop=$arrCal}-->
				<!--{if $smarty.section.cnt.first}-->
				<!--{*      <div id="block-calendar" style="width:230px;float:left;">*}-->
					<div id="block-calendar" style="width:310px;text-align:center; margin:5px auto;">
						<table style="width:300px;">
							<caption><!--{$arrCal[cnt].year}-->年<!--{$arrCal[cnt].month}-->月</caption>
							<thead><tr><th>日</th><th>月</th><th>火</th><th>水</th><th>木</th><th>金</th><th>土</th></tr></thead>
				<!--{/if}-->
				<!--{if $arrCal[cnt].first}-->
					<tr>
				<!--{/if}-->

							<!--{assign var=chk_date value="`$arrCal[cnt].year``$arrCal[cnt].month2``$arrCal[cnt].day2`"}-->

							<!--{if !$arrCal[cnt].in_month}-->
								<td></td>
							<!--{elseif $arrCal[cnt].holiday}-->
							<!--{if $first_data == $chk_date or $second_data == $chk_date}-->
								<td bgcolor="#00ffff">
							<!--{else}-->
								<td class="off">
							<!--{/if}-->
								<!--{$arrCal[cnt].day}--></td>
							<!--{else}-->
							<!--{if $first_data == $chk_date or $second_data == $chk_date}-->
								<td bgcolor="#00ffff">
							<!--{else}-->
								<td>
							<!--{/if}-->
								<!--{$arrCal[cnt].day}--></td>
							<!--{/if}-->
								<!--{if $arrCal[cnt].last}-->
							</tr>
							<!--{/if}-->
							<!--{/section}-->
							<!--{if $smarty.section.cnt.last}-->
						</table>
					</div>
				<!--{/if}-->
			<!--{/section}-->
		<!--▲カレンダーここまで-->
		</div>
	</div>
	<ul class="btn_area">
		<li class="prv_btn">
			<a href="/smp/cart/index.php">戻る</a>
		</li>
		<li class="nx_btn">
			<a href="javascript:void(0);" onclick="document.form1.submit();">次へ</a>
		</li>
	</ul>
</div>
</form>
<!--▲CONTENTS-->
<script type="text/javascript">
$(document).ready(function() {
  $("#first_quick_flag").click(function () {
    if($("#first_quick_flag:checked").val()){
      $("#cycle_interval_start_date_area").hide();
      $("#cycle_interval_start_date_dummy").val('<!--{$today}-->');
    }
    else{
      $("#cycle_interval_start_date_area").show();
      $("#cycle_interval_start_date_dummy").val('');
    }
  });

  if($("#first_quick_flag:checked").val()){
    $("#cycle_interval_start_date_area").hide();
    $("#cycle_interval_start_date_dummy").val('<!--{$today}-->');
  }
});
</script>

<!--{*
期間限定ブロック用(smp)
*}-->
<script type="text/javascript">
var objBlocTimers = new Array();
//<![[CDATA
$(document).ready(function() {
	var key = null;
<!--{foreach from=$arrPageLayout.LeftNavi item=navi_data key=idx}-->
	<!--{if $navi_data.term_flg == 1}-->
	key = 'left_' + '<!--{$idx}-->';
    objBlocTimers[key] = new BlocTimer('<!--{$navi_data.bloc_id}-->' , '<!--{$navi_data.expiration_start_date}-->' , '<!--{$navi_data.expiration_end_date}-->');
    objBlocTimers[key].start();
    <!--{/if}-->
<!--{/foreach}-->
<!--{foreach from=$arrPageLayout.MainHead item=navi_data key=idx}-->
	<!--{if $navi_data.term_flg == 1}-->
	key = 'header_' + '<!--{$idx}-->';
    objBlocTimers[key] = new BlocTimer('<!--{$navi_data.bloc_id}-->' , '<!--{$navi_data.expiration_start_date}-->' , '<!--{$navi_data.expiration_end_date}-->');
    objBlocTimers[key].start();
    <!--{/if}-->
<!--{/foreach}-->
<!--{foreach from=$arrPageLayout.MainFoot item=navi_data key=idx}-->
	<!--{if $navi_data.term_flg == 1}-->
	key = 'footer_' + '<!--{$idx}-->';
    objBlocTimers[key] = new BlocTimer('<!--{$navi_data.bloc_id}-->' , '<!--{$navi_data.expiration_start_date}-->' , '<!--{$navi_data.expiration_end_date}-->');
    objBlocTimers[key].start();
    <!--{/if}-->
<!--{/foreach}-->
<!--{foreach from=$arrPageLayout.RightNavi item=navi_data key=idx}-->
	<!--{if $navi_data.term_flg == 1}-->
	key = 'footer_' + '<!--{$idx}-->';
    objBlocTimers[key] = new BlocTimer('<!--{$navi_data.bloc_id}-->' , '<!--{$navi_data.expiration_start_date}-->' , '<!--{$navi_data.expiration_end_date}-->');
    objBlocTimers[key].start();
    <!--{/if}-->
<!--{/foreach}-->

});
//]]>
</script>

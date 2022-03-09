<!--▼CONTENTS-->
<div id="mypagecolumn">
	<div class="pankuzuarea">
    	<div><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a></div>
        <!--{* LINE連携ボタンを表示したい場合はコメントアウトを外してください *}-->
        <!--
        <!--{if 'basis-line_app'|get_option_use_flg && !$is_line_customer}-->
            ※ LINEアカウントと連携されるとLINEアカウントが友だち追加されてお知らせがLINEで受け取れます。<br />
            <a href="<!--{get_line_url|escape}-->"><img src="/img/line/line_button081_m_r.png" alt="LINE連携" /></a><br />
        <!--{/if}-->
        -->
		<!-- 現在のポイント ここから -->
            <!--{if $point_disp !== false}-->
                <p class="fl_l mgt5">
                     <span class="fts_02 ftw_b"><!--{$CustomerName1|escape}--><!--{$CustomerName2|escape}--> 様</span>
                </p>
                <p class="fl_r mgt5">   
                    <!--{if $point_flg != 2}-->
                        <span class="righttd">
                        	<span class="fts_03">保持ポイント: </span>
                            <span class="fts_02 ftw_b"><!--{$CustomerPoint|number_format|escape|default:"0"}--></span>pt
                         </span>
                    <!--{/if}-->
                </p>
            <!--{/if}-->
		<!-- 現在のポイント ここまで -->
    
    </div>
    <h2 class="subttl1 clear">マイページメニュー</h2>
	<!--{if $tpl_navi != ""}-->
		<!--{include file=$tpl_navi}-->
	<!--{else}-->
		<!--{include file=`$smarty.const.S_TEMPLATE_PATH`/mypage/navi.tpl}-->
	<!--{/if}-->
	
	<div class="mypage_inner">

	</div>
</div>

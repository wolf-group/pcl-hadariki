<!--▼CONTENTS-->
<div id="mypagecolumn">
	<div class="pankuzuarea">
    	<p style="letter-spacing:0.01em;font-size:80%;"><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./point_history.php">ポイント履歴</a></p>
    </div>
  <div class="mypage_inner">

            <h3>ポイント履歴</h3>
            <p class="pd10">こちらのページではポイントの獲得・利用状況や有効期限などを確認することができます。</p>
			<div class="pt_pos">
                <dl>
                    <dt>保有ポイント</dt>
                    <dd><!--{$CustomerPoint|number_format|escape|default:"0"}-->pt</dd>
                </dl>
            </div>

            <!--{if $tpl_linemax > 0}-->

			<h4 class="mycont_headttl mgt20 mg_shadow">▼ポイント履歴</h4>
			<div class="pg_num3">
            	<p>ポイント履歴:<!--{$tpl_linemax}-->件</p>
			</div>
            <div class="point_list">
                    <table summary="ポイント履歴">
                            <tr>
                                <th width="10%" class="centertd">獲得<br />利用日</th>
                                <th width="50%" class="centertd">内訳</th>
                                <th width="25%" class="centertd"　colspan="2">獲得・利用</th>
                                <th width="15%" class="centertd">備考</th>
                            </tr>
                            <!--{section name=cnt loop=$arrPointHistory}-->
                                  <tr>
                                    <td width="10%"  class="centertd">
                                        <div class="data"><!--{$arrPointHistory[cnt].create_date2}--></div>
                                    </td>
                                    <td width="50%"  class="centertd">
                                        <div class="service"><!--{$arrPointHistory[cnt].reason|escape}-->
                                        <!--{if $arrPointHistory[cnt].order_id}-->
                                            <a href="javascript:void(0);" onclick="pointHistoryDetail('<!--{$arrPointHistory[cnt].order_id|escape:javascript}-->'); return false;"><div class="mg_dtbtn3">詳細</div></a> <!--{/if}-->

                                        </div>
                                     </td>
                                     <td width="25%" class="centertd">
                                        <div class="point">
                                            <dl>
                                                <dt class="pt_<!--{$arrPointHistory[cnt].action|escape}-->">
                                                    <!--{if $arrPointHistory[cnt].action == 'get'}-->付与
                                                    <!--{elseif $arrPointHistory[cnt].action == 'use'}-->利用
                                                    <!--{elseif $arrPointHistory[cnt].action == 'adjust'}-->調整
                                                    <!--{elseif $arrPointHistory[cnt].action == 'lose'}-->失効
                                                    <!--{/if}-->
                                                </dt>
                                                <dd class="pt_<!--{$arrPointHistory[cnt].action|escape}-->bg"><!--{$arrPointHistory[cnt].change_point|number_format|escape}-->pt
                                                </dd>
                                            </dl>
                                        </div>
                                    </td>
                                    <td width="15%" class="centertd">
                                      <!--{if $arrPointHistory[cnt].order_id}-->
                                      <a href="javascript:void(0);" class="syncer-acdn" data-target="order_info_<!--{$smarty.section.cnt.iteration}-->"  alt="商品情報を見る" title="商品情報を見る" onclick="icon_change('<!--{$smarty.section.cnt.iteration}-->')"><span id="order_icon_<!--{$smarty.section.cnt.iteration}-->" class="icon plusicon"></span></a>
                                      <!--{/if}-->
                                    </td>
                                </tr>
                                <tr>
                                	<td colspan="4">
                                    	<div id="order_info_<!--{$smarty.section.cnt.iteration}-->" style="display:none;">
                                        	 <div class="receipt_dt">
                                            <!--{section name=info_cnt loop=$arrPointHistory[cnt].order_info}-->
                                              <!--{assign var=order_info value=$arrPointHistory[cnt].order_info[info_cnt]}-->
                                              <p class="mgb10">
                                                  商品名:<a href="/product/detail/<!--{$order_info.product_id}-->"><!--{$order_info.product_name|mb_truncate:20|escape}--></a><br />
                                                  価格:<!--{$arrPointHistory[cnt].payment_total|number_format}-->円
                                              </p>
                                              <!--{/section}-->
                                              <div class="bbtn centertd" onclick="$('#order_info_<!--{$smarty.section.cnt.iteration}-->').slideToggle(); icon_change('<!--{$smarty.section.cnt.iteration}-->')"><a href="javascript:void(0);">× 閉じる</a></div>
                                          </div>
                                        </div>
                                        <hr />
                                    </td>
                                </tr>

                            <!--{/section}-->
                   </table>

               </div>
               <div class="bg_pgnav">
					<!--▼ページナビ-->
					<!--{$history_navi}-->
					<!--▲ページナビ-->
				</div>
		<!--{else}-->
			<p class="no_data1">ポイント履歴はありません。</p>
		<!--{/if}-->

	</div>
    <!--{if $active_point_expire == true}-->
	<div class="mypage_inner">

			<!--{if $tpl_linemax > 0}-->
            <h4 class="mycont_headttl mg_shadow">▼ポイント有効期限</h4>
				<div class="point_list2">
                  <table summary="ポイント有効期限">
                      <tr>
                          <th class="centertd">有効期限</th>
                          <th class="centertd">対象<br />ポイント</th>
                          <th class="centertd">使用済<br />ポイント</th>
                          <th class="centertd">失効予定<br />ポイント</th>
                          <th class="centertd">失効後<br />ポイント残高</th>
                      </tr>

                      <!--{section name=cnt loop=$arrPointExpire}-->
                          <tr>
                              <td class="centertd"><!--{$arrPointExpire[cnt].expiration_date2}--></td>
                              <td class="centertd"><!--{$arrPointExpire[cnt].point|number_format|escape}-->pt</td>
                              <td class="centertd"><!--{$arrPointExpire[cnt].used_point|number_format|escape}-->pt</td>
                              <td class="centertd"><!--{$arrPointExpire[cnt].point2|number_format|escape}-->pt</td>
                              <td class="centertd"><!--{$arrPointExpire[cnt].after_point|number_format|escape}-->pt</td>
                          </tr>

                      <!--{/section}-->
                  </table>
                </div>
                <!--{if $expire_navi}-->
                <div class="bg_pgnav">
        					<!--▼ページナビ-->
        					<!--{$expire_navi}-->
        					<!--▲ページナビ-->
        				</div>
                <!--{/if}-->
		<!--{else}-->
			<p class="no_data1">ポイント有効期限情報はありません。</p>
		<!--{/if}-->
	</div>
	<!--{else}-->
	<p class="no_data1">現在ポイントの有効期限は設定されていません。</p>
	<!--{/if}-->
    <div class="mypage_back">
        <a href="./index.php">
            <div class="mg_back">戻る<input type="hidden" name="change" id="change" /></div>
        </a>
    </div>


</div>

<script type="text/javascript">
$(function()
{
    // [.syncer-acdn]にクリックイベントを設定する
    $( '.syncer-acdn' ).click( function()
    {
        // [data-target]の属性値を代入する
        var target = $( this ).data( 'target' ) ;

        // [target]と同じ名前のIDを持つ要素に[slideToggle()]を実行する
        $( '#' + target ).slideToggle() ;

        // 終了
        return false ;
    } ) ;

}) ;

function icon_change(cnt)
{
    // プラスアイコンとマイナスアイコン切り替え
    if($('#order_icon_' + cnt).get(0).className.split(" ")[1] == 'plusicon'){
        $('#order_icon_' + cnt).removeClass('plusicon').addClass('minusicon');
    }else{
        $('#order_icon_' + cnt).removeClass('minusicon').addClass('plusicon');
    }
}

</script>

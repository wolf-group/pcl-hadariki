<!--{*
/*
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
 */
*}-->
<!--▼CONTENTS-->
<div id="mypagecolumn">
	<div class="head">
		<h2 class="t_mypage">マイページ
        <!--{* ポイント表示 *}-->
        <!--{if $tpl_point}--><!--{include file=$tpl_point}--><!--{/if}-->
        </h2>
	</div>
    <div style="clear:both;"></div>
	<!--{if $tpl_navi != ""}-->
		<!--{include file=$tpl_navi}-->
	<!--{else}-->
		<!--{include file=`$smarty.const.TEMPLATE_DIR`mypage/navi.tpl}-->
	<!--{/if}-->
	<div id="mycontentsarea">

			<div class="mycont_head">
				<h3>ポイント履歴</h3>
			</div>

           <p class="mgtb15">こちらのページではポイントの獲得・利用状況や有効期限などを確認することができます。</p>

            <div class="point_list">
                <!--{if $point_disp !== false}-->
                <dl>
                   <dt>所持ポイント</dt>
                   <dd><!--{if $point_flg != 2}--><!--{$CustomerPoint|number_format|escape|default:"0"}-->pt<!--{/if}--></dd>
                </dl>
                <!--{/if}-->
			</div>

            <h3 class="mycont_headttl">▼ ポイント履歴</h3>
            <!--{if $tpl_linemax > 0}-->
                <p class="pdtb10"><!--{$tpl_linemax}-->件のポイント履歴があります。</p>
				<div class="use_point_tb">
                    <table summary="ポイント履歴">
                        <tr>
                            <th class="centertd">獲得<br />利用日</th>
                            <th class="centertd">内訳</th>
                            <th class="centertd" colspan="2">ポイント<br />利用・獲得</th>
                            <th class="centertd">ポイント<br />残高</th>
                            <th class="centertd">備考</th>
                        </tr>
                        <!--{section name=cnt loop=$arrPointHistory}-->
                        <tr>
                            <td class="centertd" width="10%"><!--{$arrPointHistory[cnt].create_date2}--></td>
                            <td class="centertd" width="25%">
                                <!--{$arrPointHistory[cnt].reason|escape}--><br />
                                <!--{if $arrPointHistory[cnt].order_id}-->
                                    <div class="btn_fv"><a href="javascript:void(0);" onclick="pointHistoryDetail('<!--{$arrPointHistory[cnt].order_id|escape:javascript}-->'); return false;" >詳細</a></div>
                                <!--{/if}-->
                            </td>
                            <td class="centertd pt_<!--{$arrPointHistory[cnt].action|escape}-->" >
                                <!--{if $arrPointHistory[cnt].action == 'get'}-->付与
                                <!--{elseif $arrPointHistory[cnt].action == 'use'}-->利用
                                <!--{elseif $arrPointHistory[cnt].action == 'adjust'}-->調整
                                <!--{elseif $arrPointHistory[cnt].action == 'lose'}-->失効<!--{/if}-->
                            </td>
                            <td class="centertd pt_<!--{$arrPointHistory[cnt].action|escape}-->bg" ><!--{$arrPointHistory[cnt].change_point|number_format|escape}-->pt</td>
                            <td class="centertd" style="background:#fffdd6;font-weight:bold;"><!--{$arrPointHistory[cnt].after_point|number_format|escape}-->pt</td>
                            <td class="lefttd">
                                <div class="pt_detail">
                                    <!--{if $arrPointHistory[cnt].order_id}-->
                                        <p style="line-height: 1rem;">
                                            <a href="javascript:void(0);" class="syncer-acdn" data-target="order_info_<!--{$smarty.section.cnt.iteration}-->"  alt="商品情報を見る" title="商品情報を見る">
                                            注文番号:<!--{$arrPointHistory[cnt].order_id}-->
                                            <img src="<!--{$TPL_DIR}-->img/mypage/receipt.png" /><br />
                                             <span class="pr_s">総合計:<!--{$arrPointHistory[cnt].payment_total|number_format}-->円</span>
                                            </a>
                                        </p>
                                    <!--{/if}-->
                                    <div id="order_info_<!--{$smarty.section.cnt.iteration}-->" style="display:none;position:absolute;">
                                      <div class="receipt_dt">
                                              <!--{section name=info_cnt loop=$arrPointHistory[cnt].order_info}-->
                                              <!--{assign var=order_info value=$arrPointHistory[cnt].order_info[info_cnt]}-->
                                              <p class="mgb10">
                                              <!--{*商品コード:<!--{$order_info.product_code|escape}-->*}-->
                                              商品名:<a href="/product/detail/<!--{$order_info.product_id}-->"><!--{$order_info.product_name|mb_truncate:22|escape}--></a><br />
                                              <!--{*価格:<!--{$order_info.|number_format}-->円*}-->
                                              </p>
                                              <!--{/section}-->
                                              <div class="bbtn centertd" onclick="$('#order_info_<!--{$smarty.section.cnt.iteration}-->').slideToggle();"><a href="javascript:void(0);">× 閉じる</a></div>
                                      </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <!--{/section}-->
                    </table>
                </div>

                <!--{if $history_navi}-->
                <div class="bg_pgnav">
					<!--▼ページナビ-->
					<!--{$history_navi}-->
					<!--▲ページナビ-->
				</div>
                <!--{/if}-->

			<!--{else}-->
				<p class="p_waku">ポイント履歴はありません。</p>
			<!--{/if}-->


				<h3 class="mycont_headttl mgt30">▼ ポイント有効期限</h3>

			<!--{if $tpl_linemax > 0}-->

				<!--{if $active_point_expire == true}-->

					<!--<p class="p_waku"><!--{$tpl_linemax}-->件のポイント履歴があります。</p>-->

					<div class="use_point_tb">
						<table summary="ポイント有効期限">
							<tr>
								<th class="centertd">有効期限</th>
								<th class="centertd">対象ポイント</th>
								<th class="centertd">使用済<br />ポイント</th>
								<th class="centertd">失効予定<br />ポイント</th>
								<th class="centertd">失効後<br />ポイント残高</th>
							</tr>
						<!--{section name=cnt loop=$arrPointExpire}-->
							<tr>
								<td class="centertd"><!--{if $arrPointExpire[cnt].no_limit_expire_flg == true}-->無期限<!--{else}--><!--{$arrPointExpire[cnt].expiration_date2}--><!--{/if}--></td>
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
					<div class="p_waku">現在ポイントに有効期限は設定されていません。</div>
				<!--{/if}-->
				<!--{else}-->
					<p class="p_waku">ポイント有効期限情報はありません。</p>
			<!--{/if}-->
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

</script>
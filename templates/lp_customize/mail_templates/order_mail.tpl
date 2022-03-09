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
<!--{$arrOrder.order_name01}--> <!--{$arrOrder.order_name02}--> 様

<!--{$tpl_header}-->

************************
　配送情報とご請求金額
************************

ご注文番号：<!--{$arrOrder.order_id}-->
お支払合計：￥ <!--{$arrOrder.payment_total|number_format|default:0}-->
ご決済方法：<!--{$arrOrder.payment_method}-->
<!--{$arrOrder.deliv_date_display}-->：<!--{$arrOrder.deliv_date|default:"指定なし"}-->
お届け時間：<!--{$arrOrder.deliv_time|default:"指定なし"}-->
<!--{if $arrOrder.deliv_no}-->
配送伝票番号：<!--{$arrOrder.deliv_no}-->
<!--{/if}-->
メッセージ：<!--{$Message_tmp}-->
◎お届け先
　お名前　：<!--{$arrOrder.deliv_name01}--> <!--{$arrOrder.deliv_name02}-->　様
　郵便番号：〒<!--{$arrOrder.deliv_zip01}-->-<!--{$arrOrder.deliv_zip02}-->
　ご住所　：<!--{$arrOrder.deliv_pref}--><!--{$arrOrder.deliv_addr01}--><!--{$arrOrder.deliv_addr02}-->
　電話番号：<!--{$arrOrder.deliv_tel01}-->-<!--{$arrOrder.deliv_tel02}-->-<!--{$arrOrder.deliv_tel03}-->

<!--{if $arrOther.title.value }-->
************************
　<!--{$arrOther.title.name}-->情報
************************

<!--{foreach key=key item=item from=$arrOther}-->
<!--{if $key != "title"}-->
<!--{if $item.name != ""}--><!--{$item.name}-->：<!--{/if}--><!--{$item.value}-->
<!--{/if}-->
<!--{/foreach}-->
<!--{/if}-->

************************
　ご注文商品明細
************************

<!--{section name=cnt loop=$arrOrderDetail}-->
<!--{assign var=product_code value=$arrOrderDetail[cnt].product_code}-->
商品名: <!--{$arrOrderDetail[cnt].product_name}--> <!--{$arrOrderDetail[cnt].classcategory_name1}--> <!--{$arrOrderDetail[cnt].classcategory_name2}--> <!--{foreach from=$arrOrderDetail[cnt].extra_classcategory_name item=item key=key}--><!--{$item}--> <!--{/foreach}-->

商品コード: <!--{$product_code|escape}-->
数量：<!--{$arrOrderDetail[cnt].quantity}-->
金額：￥ <!--{$product_tax_amount_list[$product_code].amount|number_format|escape}--> <!--{if $arrOrderDetail[cnt].tax_id == $tax_id_mitigation}-->※<!--{/if}-->

<!--{/section}-->
------------------------
小　計 ￥ <!--{$arrOrder.subtotal|number_format|default:0|escape}-->
<!--{foreach from=$tax_amount_list key="num" item="tax" name="tax_list"}-->
    <!--{$tax.tax_type_name|escape}-->対象（<!--{$tax.tax_rate|number_format|escape}-->％） ￥ <!--{$tax.amount|number_format|escape}-->
<!--{/foreach}-->
値引き ￥ <!--{$arrOrder.use_point+$arrOrder.discount|number_format|default:0}-->
<!--{foreach from=$tax_amount_list key="num" item="tax" name="tax_list"}-->
<!--{if $tax.proration_price}-->
    <!--{$tax.tax_type_name|escape}-->対象割引後（<!--{$tax.tax_rate|number_format|escape}-->％） ￥ <!--{$tax.proration_price|number_format|escape}-->
<!--{/if}-->
<!--{/foreach}-->
送　料 ￥ <!--{$arrOrder.deliv_fee|number_format|default:0}-->
<!--{if $arrOrder.sendingDetail }-->
<!--{foreach key=key item=item from=$arrOrder.sendingDetail}-->
<!--{if $item.sending_name}-->
<!--{$item.sending_name}--> \ <!--{$item.sending_price|number_format|default:0}-->
<!--{/if}-->
<!--{/foreach}-->
<!--{/if}-->
手数料 ￥ <!--{$arrOrder.charge|number_format|default:0}-->
<!--{if $arrOrder.relay_fee != 0}-->離島手数料 ￥ <!--{$arrOrder.relay_fee|number_format|default:0}--><!--{/if}-->

========================
合　計 ￥ <!--{$arrOrder.payment_total|number_format|default:0}-->
<!--{if $arrOrder.customer_id}-->
========================
<!--{if $point_flg != 2}-->
<!--{* ご注文前のポイント {$tpl_user_point} pt *}-->
ご使用ポイント <!--{$arrOrder.use_point|default:0}--> pt
今回加算される加算ポイント <!--{$arrOrder.add_point|default:0}--> pt
保持ポイント <!--{$arrCustomer.point|default:0}--> pt
<!--{/if}-->
<!--{/if}-->
<!--{if $arrOrder.special_affairs}-->
************************
　特記事項
************************
<!--{$arrOrder.special_affairs}-->
<!--{/if}-->
単価欄に※が表示されている商品は軽減税率対象です。
<!--{$tpl_footer}-->

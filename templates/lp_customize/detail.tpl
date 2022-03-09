<!--{*
 * Copyright(c) 2008 PakuReserve, Inc. All Rights Reserved.
 *}-->
<script type="text/javascript">//<![CDATA[
<!--{include file="`$smarty.const.TEMPLATE_DIR`countdown.tpl"}-->

// セレクトボックスに項目を割り当てる。
function lnSetSelect(form, name1, name2, val) {

      sele11 = document[form][name1];
      sele12 = document[form][name2];

      if(sele11 && sele12) {
              index = sele11.selectedIndex;

              // セレクトボックスのクリア
              count = sele12.options.length;
              for(i = count; i >= 0; i--) {
                      sele12.options[i] = null;
              }

              // セレクトボックスに値を割り当てる
              len = lists[index].length;
              for(i = 0; i < len; i++) {
                      sele12.options[i] = new Option(lists[index][i], vals[index][i]);
                      if(val != "" && vals[index][i] == val) {
                              sele12.options[i].selected = true;
                      }
              }
      }
}

$(document).ready(function() {
    $('#favorite').click(function(){
        $("#favorite").attr("disabled", "disabled");
        $.ajax({
            dataType: "text",
            data: {
                "product_id": "<!--{$arrProduct.product_id|escape}-->",
                "type": 1,
            },
            cache: false,
            url: "/products/add_favorite.php",
            success: function (data, status) {
                if(data == 'true'){
                    $("#favorite").text('お気に入りに追加しました');
                }
            },
            error : function(){
                alert('エラーが発生しました');
            }
        });
    });
});

function winOp(src_data, width, height){
    if(width > 500){
        width = 500;
    }
    if(height > 500){
        height = 500;
    }
    var popw = window.open('','_blank','width='+width+',height='+height+',resizable=yes,scrollbars=no,status=no');
    popw.window.document.open();
    var html = '<html>';
    html += '<head><title></title></head>';
    html += ' <body style="margin:0;padding:0;border:0;">';
    html += '  <img width="100%" src="'+src_data+'">';
    html += ' </body>';
    html += '</html>';
    popw.window.document.write(html);
    popw.window.document.close();
}
//]]>

</script>

<script type="text/javascript">//<![CDATA[
  function tweet() {
    var login  = '*****';
    var apiKey = '*****';
    bitly = 'http://api.bit.ly/shorten'
      + '?version=2.0.1&format=json&callback=callback'
      + '&login=' + login
      + '&apiKey=' + apiKey + '&longUrl=';
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = bitly + encodeURIComponent(location.href) ;
    document.body.appendChild(script);
  }

  function callback(bitlyResponse) {
    var title = '<!--{$arrProduct.name|escape}-->';
    var url = 'http://twitter.com/home/?status='
      + encodeURIComponent(
           title + ' ' + bitlyResponse.results[location.href]['shortUrl']
        );
    window.open(url);
  }
//]]>
</script>
<script type="text/javascript">

function chooseMatrix(isRegular){

    var res = $('input[name="classcategory_id_m"]:checked').val();
    if(res){
        pclass_str = $('input[name="classcategory_id_m"]:checked').val();
        if(!pclass_str){
            return;
        }
        pclass_arr = pclass_str.split(':');
        var formName = 'form1';
        if(isRegular==true){
            formName = 'form2';
        }
        if($('[name="classcategory_id1"]').size()==0){
            $('[name="'+formName+'"]').append('<input type="hidden" name="classcategory_id1" value="'+pclass_arr[0]+'">');
        }else{
            $('[name="classcategory_id1"]').val(pclass_arr[0]);
        }
        if(pclass_arr[1]){
            if($('[name="classcategory_id2"]').size()==0){
                $('[name="'+formName+'"]').append('<input type="hidden" name="classcategory_id2" value="'+pclass_arr[1]+'">');

            }else{
                $('[name="classcategory_id2"]').val(pclass_arr[1]);

            }
        }

    }
}
</script>



<!--{*
 * Copyright(c) 2008 PakuReserve, Inc. All Rights Reserved.
 *}-->
<script type="text/javascript">//<![CDATA[


function tweet() {
    var login  = '*****';
    var apiKey = '*****';
    bitly = 'http://api.bit.ly/shorten'
        + '?version=2.0.1&format=json&callback=callback'
        + '&login=' + login
        + '&apiKey=' + apiKey + '&longUrl=';
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = bitly + encodeURIComponent(location.href) ;
    document.body.appendChild(script);
}

function callback(bitlyResponse) {
    var title = '<!--{$arrProduct.name|escape}-->';
    var url = 'http://twitter.com/home/?status='
        + encodeURIComponent(
             title + ' ' + bitlyResponse.results[location.href]['shortUrl']
          );
    window.open(url);
}

$(function(){
    /* 画像click */
    $('img[id^=samimg]').click(function(){
        var ida = this.id.split('|');
        var img = $(this).attr('src').split('image=');              //click画像
        var img2 = $('#main_image').attr('src').split('/');         //メイン画像
        var img3 = $('#main_large_image').attr('href').split('/');  //拡大画像

        img2[img2.length-1] = img[img.length-1];
        //$('#main_image').attr({'src':img2.join('image=')});           //縮小
        $('#main_image').attr({'src':img2.join('/')});              //縮小

        img3[img3.length-1] = ida[2];
        $('#main_large_image').attr({'href':img3.join('/')});       //拡大

        $('.mousetrap').remove();
        $('.cloud-zoom, .cloud-zoom-gallery').unbind();
        $('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();

        var y  = (parseInt(ida[1]) - 1) * 95;
        $(".sub_img_frame").css({'top':y+'px'});
    });

    var pre_image = '';
    var pre_height = '';

    $('.sub_picture').hover(
        function(){
            pre_image = $('.picture').attr('src');
            pre_height = $('.picture').height();
            $('.picture').attr('src', $(this).attr('src'));
            $('.picture').css('height',pre_height+'px');
        },
        function(){
            $('.picture').attr('src', pre_image);
            pre_height = $('.picture').height();
            $('.picture').css('height',pre_height+'px');
        }
    );
    $('.sub_picture').click(function(){

    });
});

//]]>
</script>
<!--▼CONTENTS-->
<div id="productscolumn">
    <!--{assign var=session_customer_id value=$smarty.session.customer|@null_coalescing:"customer_id"}-->

    <!--▼ タイトルエリア ▼-->
    <!--<div id="detailtitle">
        <h2><!--{*$tpl_subtitle|escape*}--><!--{$arrProduct.name|escape}--></h2>
    </div>-->
    <!--▲ タイトルエリア ▲-->

    <div id="count_down_<!--{$arrProduct.product_id|escape}-->" ></div>


    <!--▼ ディティールエリア ▼-->
    <div id="detailarea">

        <!--▼ 商品画像エリア ▼-->
        <div id="detailphotoblock" style="<!--{if $arrFile.main_image.height < $arrFile.main_image.width}-->width: 36%;<!--{/if}-->">
            <!--{assign var=key value="main_image"}-->
            <!--{if $arrProduct.main_large_image != ""}-->

            <!--▼ 商品画像 ▼-->
                <a href="javascript:void(win01('/products/detail_image.php?product_id=<!--{$arrProduct.product_id}-->&amp;image=main_large_image<!--{if $smarty.get.admin == 'on'}-->&amp;admin=on<!--{/if}-->','detail_image','<!--{$arrFile.main_large_image.width > 325}-->', '<!--{$arrFile.main_large_image.height > 325}-->'))">
                    <img src="/resize_image.php?image=<!--{$arrProduct.main_image}-->&width=325&height=325" class="picture" alt="<!--{$arrProduct.name|escape}-->"/>
                </a>
            <!--{else}-->
                    <img src="/resize_image.php?image=<!--{$arrProduct.main_image}-->&width=325&height=325" class="picture" alt="<!--{$arrProduct.name|escape}-->"/>
            <!--{/if}-->
            <!--▲ 商品画像 ▲-->

            <!--▼ ギャラリーエリア ▼-->
            <!--{if $arrProduct.sub_title1 != ""}-->
            <div id="gallery" style="width: 260px !important;">
                <!--*{<!--{if $arrProduct.sub_title1 != ""}-->
                    <h2>その他の商品写真</h2>
                <!--{/if}-->*}-->

                <!--{section name=cnt loop=$smarty.const.PRODUCTSUB_MAX}-->
                <div class="sub_all">
                <!--{assign var=key value="sub_title`$smarty.section.cnt.iteration`"}-->
                <!--{if $arrProduct[$key] != ""}-->
                    <!--{*<h3 class="sub_h3"><!--★サブタイトル★--><!--{$arrProduct[$key]|escape}--></h3>*}-->
                <!--{assign var=ckey value="sub_comment`$smarty.section.cnt.iteration`"}-->

                <!-- Start Big Picture -->
                <!--{assign var=key value="sub_image`$smarty.section.cnt.iteration`"}-->
                <!--{assign var=lkey value="sub_large_image`$smarty.section.cnt.iteration`"}-->
                    <!--{if $arrFile[$key].filepath != ""}-->

                    <ul>
                        <li class="subphotoimg">
                            <!--{* 拡大画像がある場合のみ外部ポップアップを開く *}-->
                            <!--{if $arrFile[$lkey].filepath != ""}-->
                            <a href="javascript:void(winOp('<!--{$arrFile[$lkey].filepath}-->','<!--{$arrFile[$lkey].width}-->','<!--{$arrFile[$lkey].height}-->'))">
                            <!--{/if}-->
                            <!-- Sub Picture -->
                            <img src="<!--{$arrFile[$key].filepath}-->?<!--{$smarty.now}-->" alt="<!--{$arrProduct.name|escape}-->"<!--{if $arrFile[$key].width > 60}--> width="60"<!--{/if}--><!--{if $arrFile[$key].height > 60}--> height="60"<!--{/if}--> class="sub_picture"/>
                            <!--{if $arrFile[$lkey].filepath != ""}-->
                            </a>
                            <!--{/if}-->
                        </li>
                    </ul>
                    <!--{*
                    <div class="subtext"><!--★サブテキスト★--><!--{$arrProduct[$ckey]|nl2br}--></div>
                    *}-->

                    <!-- End Big Picture -->
                        <!--{else}-->
                            <!--{*<p><!--★サブテキスト★--><!--{$arrProduct[$ckey]|nl2br}--></p>*}-->
                    <!--{/if}-->
                <!--{/if}-->
                </div>
                <!--{/section}-->

            </div>
            <!--{/if}-->
            <!--▲ ギャラリーエリア ▲-->

        </div>
        <!--▲ 商品画像エリア ▲-->

        <!--▼ 商品情報エリア ▼-->
        <div id="detailrightblock">
            <!--▼ Start Icon ▼-->
            <!--{if count($arrProduct.product_flag) > 0}-->
            <ul>
                <!--{section name=flg loop=$arrProduct.product_flag|count_characters}-->
                <!--{if $arrProduct.product_flag[flg] == "1"}-->
                <li>
                <!--{assign var=key value="`$smarty.section.flg.iteration`"}-->
                    <img src="<!--{$TPL_DIR}--><!--{$arrSTATUS_IMAGE[$key]}-->" alt="<!--{$arrSTATUS[$key]}-->" title="<!--{$arrSTATUS[$key]}-->" id="icon<!--{$key}-->" />
                </li>
            <!--{/if}-->
            <!--{/section}-->
            </ul>
            <!--{/if}-->
            <!--▲ End Icon ▲-->

            <!--▼ 商品コード ▼-->
            <!--{assign var=codecnt value=$arrProductCode|@count}-->
            <!--{assign var=codemax value=`$codecnt-1`}-->
            <div>商品コード：
                <!--{if $codecnt > 1}-->
                <!--{$arrProductCode.0}-->～<!--{$arrProductCode[$codemax]}-->
                <!--{else}-->
                <!--{$arrProductCode.0}-->
                <!--{/if}-->
            </div>
            <!--▲ 商品コード ▲-->

            <!--▼ 商品名 ▼-->
            <h2><!--{$arrProduct.name|escape}--></h2>
            <!--▲ 商品名 ▲-->

        <div class="bd_area">
            <!--▼ 価　格 ▼-->
            <div class="ft_h2">
                <!--{$smarty.const.SALE_PRICE_TITLE}--><span class="mini">(税込)</span>：
                <span class="price">
                <!--{assign var=price02_min value=$arrProduct|@reduce_tax_min_price_from_product:$arrSiteInfo:$session_customer_id}-->
                <!--{assign var=price02_max value=$arrProduct|@reduce_tax_max_price_from_product:$arrSiteInfo:$session_customer_id}-->
                <!--{if $price02_min == $price02_max}-->
                    <!--{$price02_min|number_format|escape}-->
                <!--{else}-->
                    <!--{$price02_min|number_format|escape}-->～<!--{$price02_max|number_format|escape}-->
                <!--{/if}-->円</span>
            </div>
            <div id="enpt_area">
                <div class="en_area">
                <!--{if $arrProduct.price01_max > 0}-->
                    <img src="<!--{$TPL_DIR}-->img/icon/en_icon.png" alt="通常価格" title="通常価格" />
                    <span>
                    <!--{$smarty.const.NORMAL_PRICE_TITLE}-->：
                    <!--{assign var=price01_min value=$arrProduct|@tax_min_normal_price_from_product:$arrSiteInfo:$session_customer_id}-->
                    <!--{assign var=price01_max value=$arrProduct|@tax_max_normal_price_from_product:$arrSiteInfo:$session_customer_id}-->
                    <!--{if $price01_min == $price01_max}-->
                        <!--{$price01_min|number_format|escape}-->
                    <!--{else}-->
                        <!--{$price01_min|number_format|escape}-->～<!--{$price01_max|number_format|escape}-->
                    <!--{/if}-->円
                    </span>
                <!--{/if}-->
                </div>
            </div>
            <!--▲ 価　格 ▲-->

                <!--▼ ポイント ▼-->
                <!--{if $point_flg != 2}-->
                <div class="pt_area">
                   <img src="<!--{$TPL_DIR}-->img/icon/pt_icon.png" alt="ポイント" title="ポイント" />
                    <span>
                        <!--{if $arrProduct.price02_min == $arrProduct.price02_max}-->
                        <!--{$arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id}-->
                        <!--{else}-->
                        <!--{if $arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id == $arrProduct.price02_max|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id}-->
                        <!--{$arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id}-->
                        <!--{else}-->
                        <!--{$arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id}-->～<!--{$arrProduct.price02_max|sfPrePoint:$arrProduct.point_rate:$smarty.const.POINT_RULE:$arrProduct.product_id}-->
                        <!--{/if}-->
                        <!--{/if}-->Pt
                    </span>
                </div>
                <!--{/if}-->
                <!--▲ ポイント ▲-->
            </div>

            <!--▼ 在　庫 ▼-->
            <!--{if $sc_stock_config.view_flg == 'YES'}-->
            <div class="zaiko_area">
                <img src="<!--{$TPL_DIR}-->img/icon/zaiko_icon.png" alt="在庫" title="在庫" />
                <span>在庫：
                <!--{* 規格が設定されていない商品 *}-->

                <!--{if $class_cnt == '0'}-->
                    <!--{* 在庫無制限設定中の商品 *}-->
                        <!--{if $product_detail_arr[0][0].stock_unlimited == '1'}-->
                        <!--{$sc_stock_config.stock_unlimited_str|escape}-->
                        <!--{else}-->
                        <!--{* 在庫切れ *}-->
                            <!--{if $product_detail_arr[0][0].stock == '0'}-->
                            <!--{$sc_stock_config.out_of_stock_str|escape}-->
                            <!--{* 在庫切れの場合に入荷お知らせメールを表示 *}-->
                                <!--{if $req_link_flg}-->
                                    <a href="./request.php" onclick="win02('/products/request.php?product_id=<!--{$arrProduct.product_id}-->','request','<!--{$request_popup_width}-->','<!--{$request_popup_height}-->'); return false;" target="_blank">
                                    &gt;&gt;&nbsp;<!--{$product_request_config[1]|escape}-->
                                    </a>
                                <!--{/if}-->
                            <!--{else}-->
                                <!--{$product_detail_arr[0][0].stock|number_format}-->
                            <!--{/if}-->
                        <!--{/if}-->
                    <!--{* 規格が設定されている商品 *}-->

                <!--{else}-->

                <!--{* 全て在庫無制限 *}-->
                    <!--{if $max_min.all_stock_unlimited_flg}-->
                    <!--{$sc_stock_config.stock_unlimited_str|escape}-->
                    <!--{* 全て在庫切れ、且つ、入荷お知らせメールが無効の場合 *}-->
                    <!--{elseif $max_min.all_out_of_stock_flg && !$req_link_flg}-->
                    <!--{$sc_stock_config.out_of_stock_str|escape}-->

                    <!--{* 全て同一在庫 *}-->
                    <!--{elseif $max_min.all_same_stock_flg}-->
                        <!--{$max_min.stock_max|number_format}-->

                    <!--{else}-->

                        <!--{* 在庫状況詳細を折り畳む場合 *}-->
                        <!--{if $fold_flg}-->
                            <a href="#" onClick="PrShowHide('stock_detail');return false;">▼詳細を表示</a>
                        <!--{/if}-->
                        <div id="stock_detail"<!--{if $fold_flg}--> style="display:none;"<!--{/if}-->>
                            <table class="pr_stock_table">
                                <tr>
                                    <th><!--{$class_name1|escape}--></th>
                                        <!--{* 規格が2つ以上 *}-->
                                            <!--{if $class_cnt == 2}-->
                                                <th><!--{$class_name2|escape}--></th>
                                            <!--{/if}-->
                                    <th>在庫</th>
                                </tr>
                                <!--{foreach name=loop1 key=key item=val from=$product_detail_arr}-->
                                    <!--{foreach name=loop2 key=kkey item=vval from=$val}-->
                                    <tr>
                                        <!--{if $smarty.foreach.loop2.first}-->
                                            <td rowspan="<!--{$vval.cc_cnt}-->" style="vertical-align:top;"><!--{$vval.classcategory_name1|escape}--></td>
                                        <!--{/if}-->

                                        <!--{* 規格が2つ以上 *}-->
                                        <!--{if $class_cnt == 2}-->
                                            <td><!--{$vval.classcategory_name2|escape}--></td>
                                        <!--{/if}-->
                                        <td>
                                        <!--{if $vval.stock_unlimited == '1'}-->
                                            <!--{$sc_stock_config.stock_unlimited_str|escape}-->
                                        <!--{else}-->
                                            <!--{if $vval.stock == '0'}-->
                                        <!--{$sc_stock_config.out_of_stock_str|escape}-->
                                        <!--{* 在庫切れの場合に入荷お知らせメールを表示 *}-->
                                            <!--{if $req_link_flg}-->
                                                <br />
                                                    <a href="./request.php" onclick="win02('/products/request.php?product_id=<!--{$arrProduct.product_id}-->&classcategory_id1=<!--{$key}-->&classcategory_id2=<!--{$kkey}-->','request','<!--{$request_popup_width}-->','<!--{$request_popup_height}-->'); return false;" target="_blank">
                                                        &gt;&gt;&nbsp;<!--{$product_request_config[1]|escape}--></a>
                                            <!--{/if}-->
                                            <!--{else}-->
                                            <!--{$vval.stock|number_format}-->
                                            <!--{/if}-->
                                        <!--{/if}-->
                                        </td>
                                    </tr>
                                    <!--{/foreach}-->
                                <!--{/foreach}-->
                            </table>
                        </div>
                    <!--{/if}-->
                    </div>
                <!--{/if}-->
                </span>
            </div>

            <!--{/if}-->
            <!--▲ 商品情報 ▲-->

            <!--▼ 関連カテゴリ ▼-->
            <!--{if $arrCatNavi}-->
                <div class="bd_area">
                    <p>
                    関連カテゴリ：
                    <!--{foreach from=$arrCatNavi item=catNavi key=idx name=cat_navi}-->
                        <!--{foreach from=$catNavi item=navi key=idx2}-->
                            <!--{if $idx2 > 0}-->&gt;&nbsp;<!--{/if}--><a href="/product/list/<!--{$navi.category_id|escape}-->" ><!--{$navi.category_name|escape}--></a>
                        <!--{/foreach}-->
                        |
                    <!--{/foreach}-->
                    </p>
                </div>
            <!--{/if}-->
            <!--▲ 関連カテゴリ ▲-->

            <!--▼ 通常購入エリア ▼-->
                <form name="form1" id="form1" method="post" action="<!--{$smarty.server.REQUEST_URI|omit_query_part|escape}-->">
                    <input type="hidden" name="mode" value="cart" />
                    <input type="hidden" name="product_id" value="<!--{$tpl_product_id}-->" />
                    <input type="hidden" name="pageno" value="<!--{$tpl_pageno|escape}-->" />

                    <!--{if $arrProduct.regular_only_flg == 0}-->
                    <!--{* 定期購入設定中の商品で、都度購入用の「カゴに入れる」ボタンを非表示にする場合は、定期カゴ非表示タグのSTART、ENDのif文を有効にする *}-->
                    <!--{*if $arrProduct.regular != 1*}--><!--{*START 定期カゴ非表示タグ*}-->

                          <!--▼ 規格1 ▼-->
                          <!--{if $arrProduct.product_class_disp_setting != 1 && $tpl_classcat_find1}-->
                             <div class="bd_area">
                                  <dl>
                                      <dt><!--{$tpl_class_name1|escape}--></dt>
                                      <dd>
                                          <div class="custom-selectbox w100">
                                              <select name="classcategory_id1" style="<!--{$arrErr.classcategory_id1|sfGetErrorColor}-->" onchange="lnSetSelect('form1', 'classcategory_id1', 'classcategory_id2', ''); ">
                                                  <option value="">選択してください</option>
                                                  <!--{html_options options=$arrClassCat1 selected=$arrForm.classcategory_id1.value}-->
                                              </select>
                                          </div>
                                          <!--{if $arrErr.classcategory_id1 != ""}-->
                                          <br />
                                          <span class="attention">※ <!--{$tpl_class_name1|escape}-->を選択して下さい。</span>
                                          <!--{/if}-->
                                      </dd>
                                  </dl>
                              </div>
                          <!--{/if}-->

                        <!--{if $tpl_stock_find}-->
                            <!--▼ 規格2▼-->
                            <!--{if $arrProduct.product_class_disp_setting != 1 && $tpl_classcat_find2}-->
                                  <div class="bd_area">
                                      <dl>
                                          <dt><!--{$tpl_class_name2|escape}--></dt>
                                          <dd>
                                              <div class="custom-selectbox w100">
                                                  <select name="classcategory_id2" style="<!--{$arrErr.classcategory_id2|sfGetErrorColor}-->">
                                                      <option value="">選択してください</option>
                                                  </select>
                                              </div>
                                              <!--{if $arrErr.classcategory_id2 != ""}-->
                                              <br />
                                              <span class="attention">※ <!--{$tpl_class_name2|escape}-->を選択して下さい。</span>
                                              <!--{/if}-->
                                          </dd>
                                       </dl>
                                  </div>


                                <!-- ▼規格3以上▼ -->
                                <!--{if $pcc_list_extra}-->
                                    <!--{foreach from=$pcc_list_extra item=item key=key}-->
                                       <div class="bd_area">
                                        <dl>
                                            <dt><!--{$item.class_name|escape}--></dt>
                                            <dd>
                                                <!--{assign var="classcategory_id" value="classcategory_id`$key`"}-->
                                                <div class="custom-selectbox w100">
                                                    <select name="classcategory_id<!--{$key}-->" id="classcategory_id<!--{$key}-->>"
                                                         style="<!--{$arrErr.$classcategory_id|sfGetErrorColor}-->">
                                                        <option value="">選択してください</option>
                                                        <!--{html_options options=$item.classcategory selected=$arrForm.$classcategory_id.value}-->
                                                    </select>
                                                </div>
                                                <!--{if $arrErr.$classcategory_id != ""}-->
                                                    <br /><span class="attention">※ <!--{$item.class_name|escape}-->を選択して下さい。</span>
                                                <!--{/if}-->
                                            </dd>
                                        </dl>
                                       </div>
                                    <!--{/foreach}-->
                                <!--{/if}-->
                                <!-- ▲規格3以上▲ -->

                          <!--{/if}-->

                          <!--{* 規格マトリックス表示（通常購入）ここから *}-->
                          <!--{if $arrProduct.product_class_disp_setting == 1 && $tpl_classcat_find1}-->
                              <div class="kikaku_bl bd_area">
                                  <!--{if $arrErr.classcategory_id1 != ""}-->
                                      <br />
                                      <span class="attention">※ <!--{$tpl_class_name1|escape}-->を選択して下さい。</span>
                                  <!--{/if}-->
                                  <!--{if $arrErr.classcategory_id2 != ""}-->
                                      <br />
                                      <span class="attention">※ <!--{$tpl_class_name2|escape}-->を選択して下さい。</span>
                                  <!--{/if}-->
                                  <!--{$tpl_class_name1|escape}--> <!--{if $tpl_class_name2}-->× <!--{$tpl_class_name2|escape}--><!--{/if}-->
                                  <table cellspacing="1" cellpadding="4" border="0">
                                      <tr>
                                          <th class="" align="center">&nbsp;</th>
                                      <!--{foreach from=$arrClassCatMatrix2 key=key item=val name=arrClassCatMatrix2}-->
                                          <th nowrap="" class="" align="center"><!--{$val|default:'-'}--></th>
                                      <!--{/foreach}-->
                                      </tr>
                                      <!--{foreach from=$arrClassCatMatrix1 key=key item=val name=arrClassCatMatrix1}-->
                                          <tr>
                                              <th nowrap="" class="" align="center"><!--{$val}--></th>

                                              <!--{foreach from=$arrClassCatMatrix2 key=kkey item=vval name=arrClassCatMatrix2}-->
                                                  <td class="" align="center">
                                                      <!--{assign var=product_class_key value=$key:$kkey}-->
                                                      <!--{if $arrProductsClassAddKey[$product_class_key]}-->

                                                          <!--{if !$arrProductsClassAddKey[$product_class_key].stock && $arrProductsClassAddKey[$product_class_key].stock|strlen}-->
                                                              ×
                                                          <!--{else}-->
                                                              <input type="radio" id="classcategory_id_m_<!--{$key}-->:<!--{$kkey}-->" name="classcategory_id_m" align="center" value="<!--{$key}-->:<!--{$kkey}-->">
                                                              <!--{if $arrProduct.stock_alert_num|strlen && $arrProductsClassAddKey[$product_class_key].stock|strlen &&
                                                              $arrProductsClassAddKey[$product_class_key].stock <= $arrProduct.stock_alert_num}-->
                                                              ▲
                                                              <!--{/if}-->
                                                          <!--{/if}-->
                                                      <!--{else}-->
                                                          ×
                                                      <!--{/if}-->
                                                  </td>
                                              <!--{/foreach}-->
                                          </tr>
                                      <!--{/foreach}-->
                                  </table>

                                    <!-- ▼規格3以上▼ -->
                                    <!--{if $pcc_list_extra}-->
                                        <!--{foreach from=$pcc_list_extra item=item key=key}-->
                                        <div class="bd_area">
                                            <dl>
                                                <dt><!--{$item.class_name|escape}--></dt>
                                                <dd>
                                                    <!--{assign var="classcategory_id" value="classcategory_id`$key`"}-->
                                                    <div class="custom-selectbox w100">
                                                        <select name="classcategory_id<!--{$key}-->" id="classcategory_id<!--{$key}-->>"
                                                            style="<!--{$arrErr.$classcategory_id|sfGetErrorColor}-->" >
                                                            <option value="">選択してください</option>
                                                            <!--{html_options options=$item.classcategory selected=$arrForm.$classcategory_id.value}-->
                                                        </select>
                                                    </div>
                                                    <!--{if $arrErr.$classcategory_id != ""}-->
                                                        <br /><span class="attention">※ <!--{$item.class_name|escape}-->を選択して下さい。</span>
                                                    <!--{/if}-->
                                                </dd>
                                            </dl>
                                         </div>
                                        <!--{/foreach}-->
                                    <!--{/if}-->
                                    <!-- ▲規格3以上▲ -->
                                </div>
                            <!--{/if}-->
                            <!--{* 規格マトリックス表示（通常購入）ここまで *}-->

                        <!--{/if}-->

                        <dl>
                            <dd>
                                <!--{if $arrReturning != ""}-->
                                <!--{foreach from=$arrReturning key="id" item="returning" name="returning"}-->
                                <!--{$returning}-->
                                <!--{/foreach}-->
                                <!--{/if}-->
                            </dd>
                        </dl>
                        <!--{if $arrCatNavi}-->
                        <!--<p class="btn"></p>-->

                        <!--{/if}-->

                        <!--{if $tpl_stock_find}-->
                            <!--{if $tpl_message_upper_cart_btn != ""}-->
                              <!--<p class="btn"></p>-->
                                <p class="attention"><!--{$tpl_message_upper_cart_btn}--></p>
                            <!--{/if}-->

                            <!--▼通常購入ボタン ▼-->
                            <div class="bd_area" style="clear:both;">
                                <div class="numarea">
                                        数量
                                            <input type="text" name="quantity" class="box54" value="<!--{$arrForm.quantity.value|default:1}-->" maxlength="<!--{$smarty.const.INT_LEN}-->" style="<!--{$arrErr.quantity|sfGetErrorColor}-->" />
                                            <!--{if $arrErr.quantity != ""}-->
                                            <br />
                                            <span class="attention"><!--{$arrErr.quantity}--></span>
                                            <!--{/if}-->
                                </div>
                                <div class="cartbtn">
                                    <a href="<!--{if $arrProduct.product_class_disp_setting == 1}-->javascript:void(chooseMatrix(false));<!--{/if}-->javascript:void(document.form1.submit())">カゴに入れる<input type="hidden" name="cart" id="cart" /></a>
                                </div>
                             </div>
                            <!--{else}-->
                                <div class="attention">申し訳ございませんが、只今品切れ中です。</div>
                            <!--{/if}-->

                        <!--{*/if*}--><!--{*END 定期カゴ非表示タグ*}-->
                        <!--{/if}-->
                                </form>

                        <!--▲ 通常購入ボタン ▲-->

                          <!--▼ 入荷お知らせメール ▼-->
                            <div class="bd_area">
                              <!--{if $no_class_stock_flg}-->
                                <!--<p class="btn"></p>-->
                                    <div class="newbtn">
                                        <a href="./request.php"
                                        onclick="win02('/products/request.php?product_id=<!--{$arrProduct.product_id}-->','request','<!--{$request_popup_width}-->','<!--{$request_popup_height}-->'); return false;" target="_blank">
                                        入荷お知らせメール<input type="hidden" name="request" id="request" />
                                        </a>
                                    </div>
                              <!--{/if}-->
                              <!--▲ 入荷お知らせメール ▲-->

                              <!--▼ お気に入り ▼-->
                              <!--{if 'products-add_favorite'|get_option_use_flg == true}-->
                                  <!--{if $session_customer_id}-->
                                      <!--{if $favorite_count == 0}-->
                                      <div class="favoritebtn">
                                          <a id="favorite">お気に入りに追加する</a>
                                      </div>
                                      <!--{/if}-->
                                  <!--{/if}-->
                              <!--{/if}-->
                              <!--▲ お気に入り ▲-->

                </div>
            <!--▼ 通常購入エリア ▼-->

            <!--{if 'basis-lp_only'|get_option_use_flg == false}-->
                <!--▼ 定期購入エリア ▼-->
                <!--{if $arrProduct.regular != 0}-->
                <!--<p class="btn"></p>-->
                <div class="teiki_area">
                    <a name="regular" id="regular"></a>
                    <form name="form2" id="form2" method="post" action="<!--{$smarty.server.REQUEST_URI|omit_query_part|escape}-->">
                            <input type="hidden" name="mode" value="cart" />
                            <input type="hidden" name="regular" value="1" />
                            <input type="hidden" name="product_id" value="<!--{$tpl_product_id}-->" />
                            <input type="hidden" name="pageno" value="<!--{$tpl_pageno|escape}-->" />
                         <h3>
                            <span class="tx_teiki">定期購入</span>
                            <span class="tx_teiki_en">価格:<span class="price"><!--{$arrProduct.rg_fprice|number_format}-->円</span><span class="mini">(税込)</span></span>
                         </h3>
                        <!--{if $arrProduct.product_class_disp_setting != 1 && $tpl_classcat_find1}-->
                        <dl>
                            <dt><!--{$tpl_class_name1|escape}--></dt>
                            <dd>
                                <div class="custom-selectbox w100">
                                    <select name="classcategory_id1" style="<!--{$arrErr.classcategory_id1|sfGetErrorColor}-->" onchange="lnSetSelect('form2', 'classcategory_id1', 'classcategory_id2', ''); ">
                                        <option value="">選択してください</option>
                                    <!--{html_options options=$arrClassCat1 selected=$arrForm.classcategory_id1.value}-->
                                    </select>
                                </div>
                                <!--{if $arrErr.classcategory_id1 != ""}-->
                                <br />
                                <span class="attention">※ <!--{$tpl_class_name1|escape}-->を入力して下さい。</span>
                                <!--{/if}-->
                            </dd>
                        </dl>
                        <!--{/if}-->

                        <!--{if $tpl_stock_find}-->
                            <!--{if $arrProduct.product_class_disp_setting != 1 && $tpl_classcat_find2}-->
                            <div class="bd_area">
                                <dl>
                                    <dt><!--{$tpl_class_name2|escape}--></dt>
                                    <dd>
                                        <div class="custom-selectbox w100">
                                            <select name="classcategory_id2" style="<!--{$arrErr.classcategory_id2|sfGetErrorColor}-->">
                                                <option value="">選択してください</option>
                                            </select>
                                        </div>
                                        <!--{if $arrErr.classcategory_id2 != ""}-->
                                        <br />
                                        <span class="attention">※ <!--{$tpl_class_name2|escape}-->を入力して下さい。</span>
                                        <!--{/if}-->
                                    </dd>
                                </dl>
                            </div>
                            <!--{/if}-->

                            <!--{* 規格マトリックス表示（定期）ここから *}-->
                            <!--{if $arrProduct.product_class_disp_setting == 1 && $tpl_classcat_find1}-->
                                <div style="clear:both;"></div>
                                <div class="kikaku_bl">
                                    <!--{if $arrErr.classcategory_id1 != ""}-->
                                        <br /><span class="attention">※ <!--{$tpl_class_name1|escape}-->を選択して下さい。</span>
                                    <!--{/if}-->
                                    <!--{if $arrErr.classcategory_id2 != ""}-->
                                        <br /><span class="attention">※ <!--{$tpl_class_name2|escape}-->を選択して下さい。</span>
                                    <!--{/if}-->
                                    <!--{$tpl_class_name1|escape}--> <!--{if $tpl_class_name2}-->× <!--{$tpl_class_name2|escape}--><!--{/if}-->
                                    <table cellspacing="1" cellpadding="4" border="0">
                                        <tr>
                                            <th class="" align="center">&nbsp;</th>
                                            <!--{foreach from=$arrClassCatMatrix2 key=key item=val name=arrClassCatMatrix2}-->
                                                <th nowrap="" class="" align="center"><!--{$val|default:'-'}--></th>
                                            <!--{/foreach}-->
                                        </tr>
                                        <!--{foreach from=$arrClassCatMatrix1 key=key item=val name=arrClassCatMatrix1}-->
                                            <tr>
                                                <th nowrap="" class="" align="center"><!--{$val}--></th>
                                                <!--{foreach from=$arrClassCatMatrix2 key=kkey item=vval name=arrClassCatMatrix2}-->
                                                    <td class="" align="center">
                                                        <!--{assign var=product_class_key value=$key:$kkey}-->
                                                        <!--{if $arrProductsClassAddKey[$product_class_key]}-->
                                                            <!--{if !$arrProductsClassAddKey[$product_class_key].stock && $arrProductsClassAddKey[$product_class_key].stock|strlen}-->
                                                                ×
                                                            <!--{else}-->
                                                                <input type="radio" id="classcategory_id_m_r_<!--{$key}-->:<!--{$kkey}-->" name="classcategory_id_m" align="center" value="<!--{$key}-->:<!--{$kkey}-->">
                                                            <!--{/if}-->
                                                        <!--{else}-->
                                                            ×
                                                        <!--{/if}-->
                                                    </td>
                                                <!--{/foreach}-->
                                            </tr>
                                        <!--{/foreach}-->
                                    </table>
                                </div>
                            <!--{/if}-->
                            <!--{* 規格マトリックス表示（定期）ここまで *}-->
                        <!--{/if}-->

                        <!--▼ 定期購入カートボタン ▼-->
                        <!--{if $tpl_classcat_find1}-->
                            <!--{assign var=cart_btn_class value='bd_area'}-->
                        <!--{else}-->
                            <!--{assign var=cart_btn_class value='no_bd_area'}-->
                        <!--{/if}-->
                        <div class="<!--{$cart_btn_class}-->">
                            <!--{if $tpl_stock_find}-->
                                <div class="numarea">
                                    数量
                                    <input type="text" name="quantity" class="box54" value="<!--{$arrForm.quantity.value|default:1}-->" maxlength="<!--{$smarty.const.INT_LEN}-->" style="<!--{$arrErr.quantity|sfGetErrorColor}-->" />
                                        <!--{if $arrErr.quantity != ""}-->
                                        <br />
                                        <span class="attention"><!--{$arrErr.quantity}--></span>
                                        <!--{/if}-->

                                </div>

                                <div class="t_cartbtn">
                                    <a href="<!--{if $arrProduct.product_class_disp_setting == 1}-->javascript:void(chooseMatrix(true));<!--{/if}-->javascript:void(document.form2.submit())">定期購入する<input type="hidden" name="cart2" id="cart2" /></a>
                                </div>
                            <!--{else}-->
                                <div class="attention">申し訳ございませんが、只今品切れ中です。</div>
                            <!--{/if}-->
                       </div>
                        <!--▲ 定期購入カートボタン ▲-->

                    </form>
                </div>
                <!--{/if}-->
                <!--▲ 定期購入エリア ▲-->
            <!--{/if}-->

            <!--{* オペビルダー用 *}-->
            <!--{if "sfViewDetailOpe"|function_exists === TRUE}-->
            <!--{include file=`$smarty.const.MODULE_PATH`mdl_opebuilder/detail_ope_view.tpl}-->
            <!--{/if}-->
        </div>
    </div>
    <!--▲ 商品情報エリア ▲-->


       <!--▼ 詳細メインコメント ▼-->
          <div class="dt_comment" style="clear:both;display:block;">
            <h3><span>商品詳細情報</span></h3>
            <p class="detail_p"><!--{$arrProduct.main_comment|nl2br}--></p>
          </div>
        <!--▲ 詳細メインコメント ▲-->


        <!--▼ お客様の声エリア▼-->
        <!--{if $arrReviewView == "ON"}-->
            <div id="customervoicearea">
                <div class="title"><h2>この商品に対するお客様の声</h2></div>
                <!--{if $reviewWritableFlg}-->
                    <!--★新規コメントを書き込む★-->
                    <div class="btn_review">
                        <a href="./review.php" onclick="win02('/products/review.php?product_id=<!--{$arrProduct.product_id}-->','review','720','640'); return false;" target="_blank">
                        新規コメントを書き込む<input type="hidden" name="review" id="review" /></a>
                    </div>
                <!--{/if}-->

                <!--{if $tpl_linemax > 0}-->
                    <div class="head_review">
                        <span style="font-weight:bold;color:#ff0000;"><!--{$tpl_linemax}--></span>件のレビューがございます。&nbsp;&nbsp;&nbsp;&nbsp;
                        <!--{$tpl_strnavi}-->
                    </div>
                <!--{/if}-->

                <!--{if count($arrReview) > 0}-->
                    <ul>
                        <!--{section name=cnt loop=$arrReview}-->
                        <li>
                            <p class="voicedate"><!--{$arrReview[cnt].create_date|sfDispDBDate:false}-->投稿者：<!--{if $arrReview[cnt].reviewer_url}--><a href="<!--{$arrReview[cnt].reviewer_url}-->" target="_blank"><!--{$arrReview[cnt].reviewer_name|escape}--></a><!--{else}--><!--{$arrReview[cnt].reviewer_name|escape}--><!--{/if}-->　おすすめレベル：<span class="price"><!--{assign var=level value=$arrReview[cnt].recommend_level}--><!--{$arrRECOMMEND[$level]|escape}--></span></p>
                            <!--{if $arrReview[cnt].title}-->
                            <p class="voicetitle"><!--{$arrReview[cnt].title|escape}--></p>
                            <!--{/if}-->
                            <p class="voicecomment"><!--{$arrReview[cnt].comment|escape|nl2br}--></p>
                        </li>
                    <!--{/section}-->
                    </ul>
                <!--{/if}-->
                </div>
        <!--{/if}-->
        <!--▲ お客様の声エリア▲-->

        <!--▼トラックバックエリア▼-->
        <!--{if $arrTrackbackView == "ON"}-->
            <div id="trackbackarea">
                <div class="head"><h2>この商品に対するトラックバック</h2></div>
                <h3>この商品のトラックバック先URL</h3>
                <input type="text" name="trackback" value="<!--{$trackback_url}-->" size="100" class="box500" onclick="this.select(0,this.value.length)" readonly />

                <!--{if $arrTrackback}-->
                <ul>
                <!--{section name=cnt loop=$arrTrackback}-->
                    <li><strong><!--{$arrTrackback[cnt].create_date|sfDispDBDate:false}-->　<a href="<!--{$arrTrackback[cnt].url}-->" target="_blank"><!--{$arrTrackback[cnt].title|escape}--></a> from <!--{$arrTrackback[cnt].blog_name|escape}--></strong>
                    <p><!--{$arrTrackback[cnt].excerpt|escape|mb_strimwidth:0:200:"..."}--></p></li>
                    <!--{/section}-->
                </ul>
                <!--{/if}-->
            </div>
        <!--{/if}-->
        <!--▲トラックバックエリア▲-->

        <!--▼関連商品エリア▼-->
        <!--{if $arrRecommend}-->
            <div id="whoboughtarea">
                <div class="head">
                    <h2>関連商品</h2>
                </div>
                <div class="whoboughtblock">
                    <!--{section name=cnt loop=$arrRecommend}-->
                        <!--▼ 01 ▼-->
                        <!--{if ($smarty.section.cnt.index % 2) == 0}-->
                            <!--{if $arrRecommend[cnt].product_id}-->

                            <!--▼ 01 ▼-->
                            <div class="whoboughtleft">
                                <!--{if $arrRecommend[cnt].main_list_image != ""}-->
                                    <!--{assign var=image_path value="`$arrRecommend[cnt].main_list_image`"}-->
                                <!--{else}-->
                                    <!--{assign var=image_path value="`$smarty.const.NO_IMAGE_DIR`"}-->
                                <!--{/if}-->
                                <h3><a href="<!--{$smarty.const.DETAIL_P_HTML}--><!--{$arrRecommend[cnt].product_id}-->"><!--{$arrRecommend[cnt].name|escape}--></a></h3>
                                <a href="<!--{$smarty.const.DETAIL_P_HTML}--><!--{$arrRecommend[cnt].product_id}-->">
                                    <img src="/resize_image.php?image=<!--{$image_path|sfRmDupSlash}-->&amp;width=100&amp;height=100" alt="<!--{$arrRecommend[cnt].name|escape}-->" />
                                </a>
                                <!--{assign var=price02_min value=$arrRecommend|@reduce_tax_min_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.section.cnt.index}-->
                                <!--{assign var=price02_max value=$arrRecommend|@reduce_tax_max_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.section.cnt.index}-->
                                <p><span class="price">
                                    <!--{if $price02_min == $price02_max}-->
                                        <!--{$price02_min|number_format|escape}-->
                                    <!--{else}-->
                                        <!--{$price02_min|number_format|escape}-->&nbsp;～&nbsp;
                                        <!--{$price02_max|number_format|escape}-->
                                    <!--{/if}-->円</span><br /><span class="mini">(税込)</span>
                                        </p>
                                    <p class="mini"><!--{$arrRecommend[cnt].comment|escape|nl2br}--></p>
                            </div>
                        <!--▲ 01 ▲-->
                            <!--{/if}-->
                        <!--{/if}-->


                        <!--{if ($smarty.section.cnt.index % 2) != 0}-->
                            <!--{* assign var=nextCnt value=$smarty.section.cnt.index+1 *}-->
                            <!--{if $arrRecommend[cnt].product_id}-->

                            <!--▼ 02 ▼-->
                            <div class="whoboughtleft">
                                    <!--{if $arrRecommend[cnt].main_list_image != ""}-->
                                        <!--{assign var=image_path value="`$arrRecommend[cnt].main_list_image`"}-->
                                    <!--{else}-->
                                        <!--{assign var=image_path value="`$smarty.const.NO_IMAGE_DIR`"}-->
                                    <!--{/if}-->
                                <h3><a href="<!--{$smarty.const.DETAIL_P_HTML}--><!--{$arrRecommend[cnt].product_id}-->"><!--{$arrRecommend[cnt].name|escape}--></a></h3>
                                <a href="<!--{$smarty.const.DETAIL_P_HTML}--><!--{$arrRecommend[cnt].product_id}-->">
                                    <img src="/resize_image.php?image=<!--{$image_path|sfRmDupSlash}-->&amp;width=100&amp;height=100" alt="<!--{$arrRecommend[cnt].name|escape}-->" />
                                </a>
                                <!--{assign var=price02_min value=$arrRecommend|@reduce_tax_min_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.section.cnt.index}-->
                                <!--{assign var=price02_max value=$arrRecommend|@reduce_tax_max_price_from_product:$arrSiteInfo:$session_customer_id:$smarty.section.cnt.index}-->
                                <p><span class="price">
                                    <!--{if $price02_min == $price02_max}-->
                                        <!--{$price02_min|number_format|escape}-->
                                    <!--{else}-->
                                        <!--{$price02_min|number_format|escape}-->&nbsp;～&nbsp;
                                        <!--{$price02_max|number_format|escape}-->
                                    <!--{/if}-->円</span><br /><span class="mini">(税込)</span>
                                </p>
                                <p class="mini"><!--{$arrRecommend[cnt].comment|escape|nl2br}--></p>
                            </div>
                            <!--▲ 02 ▲-->

                            <!--{/if}-->
                        <!--{/if}-->

                    <!--{/section}-->
            </div>
            <!--▲関連商品エリア▲-->

        </div>
        <!--{/if}-->
        <!--▲ディティールエリア▲-->
</div>
<!--▲CONTENTS▲-->

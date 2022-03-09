<!--{if 'basis-friend_coupon'|get_option_use_flg == true}-->
<div id="mypagecolumn">
	<div class="head">
		<h2 class="t_mypage">マイページ
		<!--{* ポイント表示 *}-->
		<!--{if $tpl_point}--><!--{include file=$tpl_point}--><!--{/if}-->
		</h2>
	</div>
	<!--{if $tpl_navi != ""}--><!--{include file=$tpl_navi}--><!--{else}--><!--{include file=`$smarty.const.TEMPLATE_DIR`mypage/navi.tpl}--><!--{/if}-->
	
	<div id="mycontentsarea">
		<form action="" method="get" name="form1" id="form1">
		<div class="area_coupon">
			<div class="mycont_head">
				<h3>マイクーポン</h3>
			</div>
			<p class="pdtb10">こちらのページでは割引チケットの取得・利用状況を確認することができます。<br /></p>
			<div class="area_coupon">
					<h3 class="mycont_headttl">▼ <span id="coupon_mes"></span></h3>

						

				<!--{* 使用可能クーポン *}-->
				<div id="unused_coupon"></div>
				<!--{* ページャー表示 *}-->
				<div class="pg_nav pst-10" id="pg_nav"></div>
			</div>

			<div class="area_coupon">
				<h3 class="mycont_headttl">▼ <span id="used_coupon_mes"></span></h3>

				<!--{* 使用済クーポン *}-->
				<div class="used_coupon" id ="used_coupon">
					<table id="used_coupon_list">
						<thead>
							<tr>
								<th class="centertd">クーポン内容</th>
								<th class="centertd">詳細</th>
								<th class="centertd">有効期間</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
                <!--{* ページャー表示 *}-->
				<div class="used_pg_nav pg_nav" id="used_pg_nav"></div>
			</div>
		</div>
		</form>
	</div>
	
</div>
<!--{/if}-->


<div id="used_coupon_template" class="template" style="display: none;">
<!--使用可能クーポン一覧テンプレート-->
	<div class="cpon">
		<p class="pdt15">使用期限あと<span class="expiration_date_diff"></span></p>
		<div class="qp_box">
			<h3 class="qp_ttl memo"></h3>
			<p class="ft-size120 pd10 c_price"></p>
			<p class="expiration"></p>
		</div>
		<!--詳細内容-->
		<div class="qp_dtl">
			<ul>
				<li class="memo"></li>
				<li><span style="font-size:12px;display:block;">クーポン利用条件</span><span class="c_price"></span></li>
				<li><span style="font-size:12px;display:block;">利用期限</span><span class="create"></span></li>
			</ul>
		</div>
	</div>

<!--使用済みクーポン一覧テンプレート-->
	<table id="used_coupon_template_table">
		<tr>
			<th class="centertd">クーポン内容</th>
			<th class="centertd">詳細</th>
			<th class="centertd">有効期間</th>
		</tr>
		<tr>
			<td class="memo" width="33.2%"></td>
			<td class="c_price" width="33.2%"></td>
			<td class="expiration" width="33.2%"></td>
		</tr>
	</table>
</div>

<script type="text/javascript">
// DOMを全て読み込んでから処理する
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
	GetCouponList(1);
	GetUsedCouponList(1);
}) ;

//使用可能クーポン情報追加
function Add_coupon(data)
{
/*
data
{
    "coupon_count": 全クーポン数,
    "coupon_list": クーポン情報配列
    [
        {
            "coupon_code": クーポンコード,
            "coupon_id": クーポンID,
            "create_date": 生成日(YYYY-MM-DD HH:MM:SS),
            "expiration_date": 有効期限(YYYY-MM-DD HH:MM:SS),
            "expiration_date_str": 有効期限(YYYY年MM月DD日 HH:MM),
            "memo": クーポン名,
            "memo_short": クーポン名,
            "price": 値引き額,
            "use_price": 使用可能値段
        },
        ・・・
    ]
    "paging": ページングHTML,
}
 */
    $('#unused_coupon').children().remove();
    if(data['coupon_count'] > 0){
        $('#coupon_mes').text('使用可能クーポン(全' + data['coupon_count'] + 'クーポン)');
        $('#pg_nav').html(data['paging']);
        //クーポン数分ループ
        $.each(data['coupon_list'], function(index, pon_data) {
            //テンプレートクローン
            var $coupon = $("#used_coupon_template .cpon").clone();
            //テンプレートにクーポン情報挿入
            $('.expiration_date_diff', $coupon).text(pon_data['expiration_date_diff'] + '日');
            $('.qp_box .memo', $coupon).text(pon_data['memo']);

            if(pon_data['use_price'] > 0){
                mes = '<br />(' + pon_data['use_price'] + '円以上の購入でご利用可能)';
            }else{
                mes = '';
            }
            $('.qp_box .c_price', $coupon).html(pon_data['price'] + '円割引き' + mes);
            $('.qp_box .expiration', $coupon).text('有効期間:' + pon_data['expiration_date_str'] + '迄');

            $('.qp_dtl ul .memo', $coupon).html('<h3>' + pon_data['memo'] + '</h3>');
            $('.qp_dtl ul .c_price', $coupon).text(pon_data['price'] + '円OFF(' + pon_data['use_price'] + '円以上の購入でご利用可能)');
            $('.qp_dtl ul .create', $coupon).text(pon_data['create_date'] + '取得〜' + pon_data['expiration_date_str']);
            //テンプレートappend
            $( "#unused_coupon" ).append($coupon);
        });
    }else{//クーポン0件
        $('#unused_coupon').html('<div class="p_waku">使用可能クーポンはありません</div>');
        $('#coupon_mes').text('使用可能クーポン(全0クーポン)');
        $('#pg_nav').text('');
    }
}

//使用済みクーポン情報挿入
function Add_used_coupon(data)
{
/*
data
{
    "coupon_count": 全クーポン数,
    "coupon_list": クーポン情報配列
    [
        {
            "coupon_code": クーポンコード,
            "coupon_id": クーポンID,
            "create_date": 生成日(YYYY-MM-DD HH:MM:SS),
            "expiration_date": 有効期限(YYYY-MM-DD HH:MM:SS),
            "expiration_date_str": 有効期限(YYYY年MM月DD日 HH:MM),
            "memo": クーポン名,
            "memo_short": クーポン名,
            "price": 値引き額,
            "use_price": 使用可能値段
        },
        ・・・
    ]
    "paging": ページングHTML,
}
 */
    $('#used_coupon_list tbody').children().remove();
    if(data['coupon_count'] > 0){
        $('#used_coupon_mes').text('使用済み、期限切れクーポン(全' + data['coupon_count'] + 'クーポン)');
        $('#used_pg_nav').html(data['paging']);
        //クーポン数分ループ
        $.each(data['coupon_list'], function(index, pon_data){
            //テンプレートクローン
            var $coupon = $("#used_coupon_template_table tr:first").next().clone();
            //クーポン名表示最大文字数
            var $coupon_name_maxlen = 15;
            //クーポン情報挿入
            if(pon_data['memo'].length > $coupon_name_maxlen){
                pon_data['memo'] = pon_data['memo'].substr(0, $coupon_name_maxlen) + '…';
            }
            $('.memo', $coupon).html(pon_data['memo']);
            if(pon_data['use_price'] > 0){
                mes = '(' + pon_data['use_price'] + '円以上の購入でご利用可能)';
            }else{
                mes = '';
            }
            $('.c_price', $coupon).text(pon_data['price'] + '円割引' + mes);
            if(pon_data['use_flg'] == 1){
                mes = '(使用済み)';
            }else{
                mes = '(期限切れ)';
            }
            $('.expiration', $coupon).html(mes + '<br />' + pon_data['expiration_date_str'] + '迄');
            //テンプレートappend
            $( "#used_coupon_list" ).append($coupon);
        });
    }else{//0件
        $('#used_coupon_list').remove();
        $('#used_coupon').html('<div class="p_waku">使用済み、期限切れクーポンはありません</div>');
        $('#used_coupon_mes').text('使用済み、期限切れクーポン(全0クーポン)');
        $('#used_pg_nav').text('');
    }
}

</script>

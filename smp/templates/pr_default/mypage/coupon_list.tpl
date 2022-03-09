<div id="mypagecolumn">
	<div class="pankuzuarea">
		<p><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./coupon_list.php">マイクーポン</a></p>
	</div>
	<div class="mypage_inner">
		<h3>割引クーポン一覧</h3>
		<p class="pd10">こちらのページでは割引チケットの取得・利用状況を確認することができます。</p>
		<h4 class="mycont_headttl mg_shadow"><span id="coupon_mes"></span></h4>

		

		<!--{* 使用可能クーポン *}-->
		<div id="unused_coupon"></div>
		<!--{* ページャー表示 *}-->
		<div class="pg_nav bg_pgnav2" id="pg_nav"></div>

		<div style="padding-bottom:20px;">
		<h4 class="mycont_headttl"><span id="used_coupon_mes"></span></h4>

			<!--{* 使用済クーポン *}-->
			<div class="qupon_list" id="used_coupon">
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
                <!--{* ページャー表示 *}-->
			<div class="used_pg_nav bg_pgnav2" id="used_pg_nav"></div>
			</div>
            
		</div>
        
        <div class="mypage_back">
            <a href="./index.php">
                <div class="mg_back">戻る</div>
            </a>
        </div>
	</div>
</div>

<div id="used_coupon_template" class="template" style="display: none;">
<!--使用可能クーポン一覧テンプレート-->
	<div class="cpon">
		<div class="area_coupon">
				<p class="pdt15 expiration_date_diff"></p>
				<div class="qp_box">
					<div class="qp_ttl memo"></div>
					<p class="c_price"></p>
					<p class="expiration"></p>
				</div>
		</div>
		<div class="syncer-acdn toggle_txt" onclick=""><a href="javascript:void(0);">クーポン詳細を見る</a></div>
		<div class="qp_detail" id="" style="display:none;">
		 <div class="qp_dtbox">
			<div class="qp_dtl">
				<ul>
					<li class="memo"></li>
					<li><span style="font-size:12px;display:block;">クーポン利用条件</span><span class="c_price"></span></li>
					<li><span style="font-size:12px;display:block;">利用期限</span><span class="create"></span></li>
				</ul>
			</div>
		 </div>
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
			<td class="memo" style="width:33%;background-color:#fee;"></td>
			<td class="c_price" style="width:33%;background-color:#fee;"></td>
			<td class="expiration" style="width:33%;background-color:#fee;"></td>
		</tr>
	</table>
</div>


<script type="text/javascript">
// DOMを全て読み込んでから処理する
$(function()
{
	GetCouponList(1);
	GetUsedCouponList(1);

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
      $('#coupon_mes').html('使用可能クーポン(全' + data['coupon_count'] + 'クーポン)');
      $('#pg_nav').html(data['paging']);
      $.each(data['coupon_list'], function(index, pon_data){
          //クーポンテンプレートクローン
          var $coupon = $("#used_coupon_template .cpon").clone();
          //クーポン情報セット
          $('.expiration_date_diff', $coupon).text('使用期限あと' + pon_data['expiration_date_diff'] + '日');
          $('.qp_box .memo', $coupon).text(pon_data['memo']);

          if(pon_data['use_price'] > 0){
              mes = '<br />(' + pon_data['use_price'] + '円以上の購入でご利用可能)';
          }else{
              mes = '';
          }
          $('.qp_box .c_price', $coupon).html(pon_data['price'] + '円割引き' + mes);
          $('.qp_box .expiration', $coupon).text('有効期間:' + pon_data['expiration_date_str'] + '迄');

          $('.toggle_txt', $coupon).attr('onclick', '$("#coupon_' + pon_data['id'] + '").slideToggle();');
          $('.qp_detail', $coupon).attr('id', 'coupon_' + pon_data['id']);

          $('.qp_dtl ul .memo', $coupon).html('<h4>' + pon_data['memo'] + '</h4>');
          $('.qp_dtl ul .c_price', $coupon).text(pon_data['price'] + '円OFF(' + pon_data['use_price'] + '円以上の購入でご利用可能)');
          $('.qp_dtl ul .create', $coupon).text(pon_data['create_date'] + '取得〜' + pon_data['expiration_date_str']);
          //テンプレートappend
          $( "#unused_coupon" ).append($coupon);
      });
    }else{//0件
      $('#unused_coupon').html('<div class="no_data1">使用可能クーポンはありません</div>');
      $('#coupon_mes').text('使用可能クーポン(全0クーポン)');
      $('#pg_nav').text('');
    }
}

//使用済みクーポン情報挿入
function Add_used_coupon(data)
{
    $('#used_coupon_list tbody').children().remove();
    if(data['coupon_count'] > 0){
      $('#used_coupon_mes').text('使用済み、期限切れクーポン(全' + data['coupon_count'] + 'クーポン)');
      $('#used_pg_nav').html(data['paging']);
      $.each(data['coupon_list'], function(index, pon_data) {
          var $coupon = $("#used_coupon_template_table tr:first").next().clone();
          var $coupon_name_maxlen = 15;

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

          $( "#used_coupon_list" ).append($coupon);
      });
    }else{//0件
      $('#used_coupon_list').remove();
      $('#used_coupon').html('<div class="no_data1">使用済み、期限切れクーポンはありません</div>');
      $('#used_coupon_mes').text('使用済み、期限切れクーポン(全0クーポン)');
      $('#used_pg_nav').text('');
    }
}

</script>

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
		<!--{if $friend_coupon_flg}-->
		<div class="friend_area">
			<div class="mycont_head">
				<h3>友達紹介キャンペーン</h3>
			</div>
			<div class="pdtb10">
				お友達に<!--{$arrSiteInfo.shop_name}-->を紹介して、お友達が会員になり商品を購入してくれると、
				あなたとお友達にそれぞれ割引チケットがもらえます。
			</div>
			
			<div class="fr_intro">
				<!--{if $err_flg==false}-->
                ↓↓↓方法は簡単、下記のURLをお友達に教えてあげてください。↓↓↓
                <div>紹介URL:<input type="text" value="<!--{$url}-->" class="fr_input" /></div>
					<ul>
						<li><a href="mailto:?body=<!--{$url|escape:"url"}-->">メールで教える</a></li>
						<li><a href="http://www.facebook.com/sharer.php?u=<!--{$url|escape:"url"}-->" target="_blank">Facebookで教える</a></li>
						<li><a href="http://twitter.com/home?status=<!--{$url|escape:"url"}-->" target="_blank">Twitterで教える</a></li>
					</ul>
				<!--{else}-->
					申し訳ございません。読み込みに失敗しました。<br />
					ページを更新し、再度読み込みを行なってください。<br />
				<!--{/if}-->
			</div>
			
			<div class="fr_attend">
				■注意<br />
				※友達紹介URLをパソコン、スマートフォンで遷移後はブラウザを閉じてしまうと無効となってしまいます。最終アクセスより24時間有効となります。<br />
				※クーポンは1回の決済に付き1枚までご利用になれます。<br />
				※紹介された側は初めての登録である必要があります。<br />
				※ご自分自身に招待を送った場合などは無効となりますのでご了承ください。<br />
				※クーポンには有効期間が御座います。<br />
				※購入手続き完了後にクーポンを適用させることはできませんのでご注意ください。<br />
			</div>
		</div>
		<!--{/if}-->
	</div>
</div>
<!--{/if}-->

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


}) ;
</script>

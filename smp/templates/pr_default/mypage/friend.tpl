<!--{if 'basis-friend_coupon'|get_option_use_flg == true}-->
<div id="mypagecolumn">
	<div class="pankuzuarea">
    	<p style="letter-spacing:0.01em;font-size:80%;"><a href="/smp/">HOME</a> &gt; <a href="/smp/mypage/login.php">マイページ</a> &gt; <a href="./point_friend.php">お友達紹介</a></p>
    </div>	

	<!--{if $friend_coupon_flg}-->
	<a name="friend"></a>
    	
        <h3>友達紹介キャンペーン</h3>
          <div class="friend_area">
            <div class="pdtb10">
                お友達に<!--{$arrSiteInfo.shop_name}-->を紹介すると、お友達が会員になり商品を購入してくれると、
                あなたとお友達にそれぞれ割引チケットがもらえます。<br />
            </div>
            
            <div class="fr_intro">
                <!--{if $err_flg==false}-->
                    <h4 class="mycont_headttl mg_shadow centertd">↓下記のURLをお友達に教えよう。↓ </h4>
                    <div style="border-bottom:1px solid #ccc;">
                        <div class="mgtb10">
                            <input type="text" value="<!--{$url}-->" class="boxLong top text h30" />
                        </div>
                    </div>
                   
                    <ul>
                        <li><a href="mailto:?body=<!--{$url|escape:"url"}-->">メール</a></li>
                        <li><a href="http://www.facebook.com/sharer.php?u=<!--{$url|escape:"url"}-->" target="_blank">Facebook</a></li>
                        <li><a href="http://twitter.com/home?status=<!--{$url|escape:"url"}-->" target="_blank">Twitter</a></li>
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
    <div class="mypage_back">
        <a href="./index.php">
            <div class="mg_back">戻る<input type="hidden" name="change" id="change" /></div>
        </a>
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

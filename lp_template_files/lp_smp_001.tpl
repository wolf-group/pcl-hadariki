<!--{if $layout == 'lp_header'}-->
<!--{* ↓↓ヘッダーデザイン↓↓ *}-->
<link rel="stylesheet" href="/gold/lp_001/css/style.css">
<div id="content">
  <img src="/gold/lp_001/images/image_01.png" alt="">
  <div class="cv_area">
    <img src="/gold/lp_001/images/cv_area.png" alt="">
    <a href="#" data-value-name="3" class="auto_select_name" style="cursor: pointer">
      <img src="/gold/lp_001/images/button.png" alt="">
    </a>
  </div>
  <img src="/gold/lp_001/images/image_02.png" alt="">
  <img src="/gold/lp_001/images/image_03.png" alt="">
  <img src="/gold/lp_001/images/image_04.png" alt="">
  <img src="/gold/lp_001/images/image_05.png" alt="">
  <img src="/gold/lp_001/images/image_06.png" alt="">
  <img src="/gold/lp_001/images/image_07.png" alt="">
  <div class="cv_area">
    <img src="/gold/lp_001/images/cv_area.png" alt="">
    <a href="#kakunin">
      <img src="/gold/lp_001/images/button.png" alt="">
    </a>
  </div>
  <img src="/gold/lp_001/images/image_08.png" alt="">
  <img src="/gold/lp_001/images/image_09.png" alt="">
  <img src="/gold/lp_001/images/image_10.png" alt="">
  <img src="/gold/lp_001/images/image_11.png" alt="">
  <img src="/gold/lp_001/images/image_12.png" alt="">
  <img src="/gold/lp_001/images/image_13.png" alt="">
  <div class="cv_area">
    <img src="/gold/lp_001/images/cv_area.png" alt="">
    <a href="#" data-value-name="3" class="auto_select_name" style="cursor: pointer">
      <img src="/gold/lp_001/images/button.png" alt="">
    </a>
  </div>
  <img src="/gold/lp_001/images/image_14.png" alt="">
  <img src="/gold/lp_001/images/image_15.png" alt="">
  <div class="cv_area">
    <img src="/gold/lp_001/images/image_16.png" alt="">
    <a href="#" data-value-name="3" class="auto_select_name tokuten" style="cursor: pointer">
      <img src="/gold/lp_001/images/button.png" alt="">
    </a>
  </div>
  <img src="/gold/lp_001/images/image_17.png" alt="">
  <img src="/gold/lp_001/images/image_18.png" alt="" id="kakunin">
</div>
<!--{* ↑↑ヘッダーデザイン↑↑ *}-->
<!--{/if}-->
<!--{if $layout == 'lp_product'}-->
<!--{* ↓↓商品リスト↓↓ *}-->
<option value="3" selected="selected">HADARIKI　薬用リンクルクリーム（トクトクコース）</option>
<!--{* ↑↑商品リスト↑↑ *}-->
<!--{/if}-->

<!--{if $layout == 'lp_footer'}-->
<!--{* ↓↓フッターデザイン↓↓ *}-->
<dl id="attentionResale">
	<dt>ご注意ください！</dt>
	<dd>商品は必ず弊社公式ショップサイトおよびAmazon.co.jp内の<strong style="font-weight:bold;color:red;">弊社公式販売店</strong>よりお買い求めください。公式サイト以外でご購入された商品につきまして、返品・返金、返金保証などはご対応致しかねます。<br>また品質の保証も致しかねますので、予めご了承ください。
	</dd>
</dl>
<script>
  // $(function(){
  //   $('a[href^="#"]').click(function() {
  //     let speed = 400;
  //     let href = $(this).attr("href");
  //     let target = $(href == "#" || href == "" ? 'html' : href);
  //     let position = target.offset().top;
  //     $('body,html').animate({
  //       scrollTop: position
  //     }, speed, 'swing');
  //     return false;
  //   });
  // });
  $(function(){
    $(".auto_select_name").click(function(){
      var product_id = $(this).attr("data-value-name");
      $("#product_id").val(product_id);
      $('#class_category_select').empty();
      lp_init(product_id, $('#quantity').val(), null);
      lp.adjustScroll(
        '#kakunin', <!--{* 基準となる位置のidを指定してください *}-->
        -20,           <!--{* この数値は適宜修正してください *}-->
        true           <!--{* スクロールアニメーションが不要の場合は false にしてください。 *}-->
      );
      return false;
    });
  });
</script>
<!--{* ↑↑フッターデザイン↑↑ *}-->
<!--{/if}-->

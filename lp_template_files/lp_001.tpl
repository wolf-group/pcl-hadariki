<!--{if $layout == 'lp_header'}-->
<!--{* ↓↓ヘッダーデザイン↓↓ *}-->

<link rel="stylesheet" href="/gold/lp_001/css/style.css">
<div id="content">
  <img src="/gold/lp_001/images/image_01@2x.png" alt="">
  <div class="cv_area">
    <img src="/gold/lp_001/images/cv_area@2x.png" alt="">
    <a href="#" data-value-name="3" class="auto_select_name" style="cursor: pointer">
      <img src="/gold/lp_001/images/button@2x.png" alt="">
    </a>
  </div>
  <img src="/gold/lp_001/images/image_02@2x.png" alt="">
  <img src="/gold/lp_001/images/image_03@2x.png" alt="">
  <img src="/gold/lp_001/images/image_04@2x.png" alt="">
  <img src="/gold/lp_001/images/image_05@2x.png" alt="">
  <img src="/gold/lp_001/images/image_06@2x.png" alt="">
  <img src="/gold/lp_001/images/image_07@2x.png" alt="">
  <div class="cv_area">
    <img src="/gold/lp_001/images/cv_area@2x.png" alt="">
    <a href="#" data-value-name="3" class="auto_select_name" style="cursor: pointer">
      <img src="/gold/lp_001/images/button@2x.png" alt="">
    </a>
  </div>
  <img src="/gold/lp_001/images/image_08@2x.png" alt="">
  <img src="/gold/lp_001/images/image_09@2x.png" alt="">
  <img src="/gold/lp_001/images/image_10@2x.png" alt="">
  <img src="/gold/lp_001/images/image_11@2x.png" alt="">
  <img src="/gold/lp_001/images/image_12@2x.png" alt="">
  <img src="/gold/lp_001/images/image_13@2x.png" alt="">
  <div class="cv_area">
    <img src="/gold/lp_001/images/cv_area@2x.png" alt="">
    <a href="#" data-value-name="3" class="auto_select_name" style="cursor: pointer">
      <img src="/gold/lp_001/images/button@2x.png" alt="">
    </a>
  </div>
  <img src="/gold/lp_001/images/image_14@2x.png" alt="">
  <img src="/gold/lp_001/images/image_15@2x.png" alt="">
  <div class="cv_area">
    <img src="/gold/lp_001/images/image_16@2x.png" alt="">
    <a href="#" data-value-name="3" class="auto_select_name tokuten" style="cursor: pointer">
      <img src="/gold/lp_001/images/button@2x.png" alt="">
    </a>
  </div>
  <img src="/gold/lp_001/images/image_17@2x.png" alt="">
  <img src="/gold/lp_001/images/image_18@2x.png" alt="" id="kakunin">
  <h2 class="h_form" id="form-area">ご注文受付フォームはこちら</h2>
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
<script>
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

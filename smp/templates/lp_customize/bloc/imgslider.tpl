<div id="newitemarea">
	<h2>NEW ITEMS</h2>
</div>
<div id="flexslider" class="flexslider"></div>
	<script src="/smp/js/jquery.flexslider-min.js"></script>
	<script type="text/javascript">
		$(window).load(function(){
			$.ajax({
				type: 'post',
				url: '/api/',
				data: {"jb":"api-best_products", "group_id":"1"},
				success: function(res){
					var obj = res.result;
					var str = '<ul class="slides">';
					for(var v in obj){
						str += '<li><a href="/smp/product/detail/'+ obj[v].product_id +'"><img style="margin:0 auto;" src="/resize_image.php?image='+ obj[v].main_list_image +'&width=120&height=120" alt="'+ obj[v].name +'" title="'+ obj[v].name +'"></a></li>';
					}
					str += '</ul>';
					$('#flexslider').html(str);
					$('.flexslider').flexslider({
						animation:'slide',			/* fade or slide */
						slideshowSpeed: 2000,		/* def 7000 切り替わるスピード */
						animationDuration: 200,		/* def 600 移動にかかる時間 */
						directionNav:true,			/* 左右のnaviを非表示に */
						prevText:'<img src="<!--{$TPL_DIR}-->img/slider/left_arrow.png">',		/* 戻る */
						nextText:'<img src="<!--{$TPL_DIR}-->img/slider/right_arrow.png">',		/* 進む */
						controlNav:true,			/* 下のコントローラーを非表示にする場合はfalse */
						manualControls:''
					});
				}
			});
		});
	</script>
<style type="text/css">
	.flex-control-nav li a {background: url(<!--{$TPL_DIR}-->img/slider/bg_control_nav.png) no-repeat;}	/* ナビ用の「○」画像を変更する場合はこのファイルを変更 */
</style>
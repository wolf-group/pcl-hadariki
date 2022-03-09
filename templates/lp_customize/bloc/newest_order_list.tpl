<script type="text/javascript">
var NewestOrders = function() {
    this._intervalId = null;
    var objDate = new Date();
    this._objBaseDate = objDate;
    this._prevTime = this._objBaseDate.getTime();
    this.initialize();
};

NewestOrders.prototype = {
    initialize:function() {
        //TODO初期リスト取得
        this._getDefault();
        this.startUpdateTimer();
    },
    startUpdateTimer:function() {
        var ref = this;
        this._intervalId = setInterval(function() { ref._update();} , 5000);
    },
    _getDefault:function() {
        var ref = this;
        params = {
            url:'/api/?jb=api-newest_order_list',
            param:{mode:'default',max:100},
            callback:function (res) { ref._setDefault(res); }
        };
        this._sendRequest(params);
    },
    _setDefault:function(res) { 
        res.result.reverse();
        for (key in res.result) {
            var tr =  $('<tr class="orders">').append(
                                    $('<td>').html($('<img src="' + res.result[key]['site_url'] + 'resize_image4.php?image=' + res.result[key]['main_list_image'] + '&width=50&height=50">'))
                               ).append(
                                    $('<td>').html(res.result[key]['create_date'])
                               ).append(
                                    $('<td>').html(res.result[key]['order_id'])
                               ).append(
                                    $('<td>').html(res.result[key]['product_name'])
                               ).append(
                                    $('<td>').html(res.result[key]['payment_method'])
                               ).append(
                                    $('<td>').html(res.result[key]['pref_name'])
                               ).append(
                                    $('<td>').html(res.result[key]['payment_total2'] + '円')
                               );
            tr.children('td').wrapInner('<div />');
            $('#order_list_header').after(tr);
        }
        $('.orders:first').addClass('lastOrder');
        var ref = this;
        this._intervalId2 = setInterval(function () { ref._scrollOrders(); } , 3000);
        this._setUpdatedDate();
    },
    _scrollOrders:function() {
        $('.orders:last').children('td').children('div').hide();
        $('#order_list_header').after($('.orders:last'));
        $('.orders:first').children('td').children('div').animate(
           {height:"toggle"},
           {duration:1200}
        );
    },
    _sendRequest:function(params) {
        $.ajax({
           url:params['url'],
           data:params['param'],
           dataType:'json',
           type:'POST',
           cache:false,
           success:params['callback'],
           error:function(res) {

           }
        }); 
    },
    _update:function(){
        //TODO新規の受注があれば取得しリスト更新
        var ref = this;
        params = {
           url:'/api/?jb=api-newest_order_list',
           param:{mode:'update',max:100 , base_start_date:this._prevTime , base_end_date:this._objBaseDate.getTime()},
           callback:function(res) { ref._updateNewestOrder(res); } 
        };
        this._sendRequest(params);
    },
    _updateNewestOrder:function(res) {
        res.result.reverse();
        var className = '__updated__' + this._objBaseDate.getTime();
        var i = 0;
        $('.orders').each(function(idx , elm) {
              var i = idx + 1;
              if (( $('.orders').length - res.result.length ) < i) {
                  $(this).remove();

              }
        });
        var i = 1;
        for (key in res.result) {
            var tr = $('<tr class="orders ' + className + '">').append(
                           $('<td>').html($('<img src="' + res.result[key]['site_url'] + 'resize_image4.php?image=' + res.result[key]['main_list_image'] + '&width=50&height=50">'))
                      ).append(
                             $('<td>').html(res.result[key]['create_date'])
                      ).append(
                             $('<td>').html(res.result[key]['order_id'])
                      ).append(
                             $('<td>').html(res.result[key]['product_name'])
                      ).append(
                             $('<td>').html(res.result[key]['payment_method'])
                      ).append(
                             $('<td>').html(res.result[key]['pref_name'])
                      ).append(
                             $('<td>').html(res.result[key]['payment_total2'] + '円')
                      );
            tr.children('td').wrapInner('<div />');
            $('.lastOrder').before(tr);
            if (i == res.result.length) {
                $('.lastOrder').removeClass('lastOrder');   
                tr.addClass('lastOrder');
            }
            i++;
        }
         
        this._prevTime = this._objBaseDate.getTime();
        this._objBaseDate = new Date();
        this._setUpdatedDate(); 
    },
    _setUpdatedDate:function() {
        var date_str = '';
        date_str += this._objBaseDate.getFullYear() + "年";
        date_str += (this._objBaseDate.getMonth() + 1) + "月";
        date_str += this._objBaseDate.getDate() + "日 ";
        date_str += this._objBaseDate.getHours() + "時";
        date_str += this._objBaseDate.getMinutes() + "分";
        $('#order_list_updated_date').html(date_str);
    }
};
$(document).ready(function() {
    var objNewestOrders = new NewestOrders();
});
</script>
<style>
.newest_order_list_th {
    background-color:#F9C;
    color:#fff;
    font-weight:bold;
}
.orders {
    font-size:8px;
}
</style>
<div style="height:300px;width:100%;overflow:scroll">
<table id="newest_order_list_tb">
<tr class="head">
    <th class="newest_order_list_th" colspan="8">現在の注文状況(最新100件)<span id="order_list_updated_date"></span>更新</th>
</tr>
<tr class="index" id="order_list_header">
    <th width="15%" class="newest_order_list_th" nowrap>写真</th>
    <th width="10%" class="newest_order_list_th" nowrap>日時</th>
    <th width="10%" class="newest_order_list_th" nowrap>注文番号</th>
    <th width="30%" class="newest_order_list_th" nowrap>商品名</th>
    <th width="5%" class="newest_order_list_th" nowrap>支払い</th>
    <th width="15%" class="newest_order_list_th" nowrap>住所</th>
    <th width="15%" class="newest_order_list_th" nowrap>金額</th>
</tr>
</table>
</div>
</body>
</html>
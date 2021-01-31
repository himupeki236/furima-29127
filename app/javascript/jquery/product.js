
$(function() {
  // 価格入力時にイベント発火
  $('#item-price').on('input', function() {
    // 価格の値を取得
    var i = $('#item-price').val();
    // 販売手数料の計算
    var result_a = i * 0.1
    // 販売利益の計算
    var result_p = i - result_a
    // 販売手数料の値を変更
    $('#add-tax-price').text(result_a);
    // 販売利益の値を変更
    $('#profit').text(result_p);
  });
});


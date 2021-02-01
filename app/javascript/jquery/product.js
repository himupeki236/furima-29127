
$(function() {
  // 価格入力時にイベント発火
  $('#item-price').on('input', function() {
    // 価格の値を取得
    const value = $('#item-price').val();
    // 販売手数料の計算
    const commission = value * 0.1
    // 販売利益の計算
    const profit = value - commission
    // 販売手数料の値を変更
    $('#add-tax-price').text(commission);
    // 販売利益の値を変更
    $('#profit').text(profit);
  });
});



window.addEventListener('load', function(){
  // 価格入力時にイベント発火
  document.getElementById("item-price").onchange = function() {
    console.log("イベント発火")
    // 価格の値を取得
    const value = document.getElementById("item-price").value;
    // 販売手数料のidを取得
    const addTaxPrice = document.getElementById("add-tax-price")
    // 販売利益のidを取得
    const profit = document.getElementById("profit")
    // 販売手数料の計算
    const commission = value * 0.1
    // 販売利益の計算
    const saleProfit = value - commission
    // 販売手数料の値を変更
    addTaxPrice.innerHTML = commission
    // 販売利益の値を変更
    profit.innerHTML = saleProfit
  };
})

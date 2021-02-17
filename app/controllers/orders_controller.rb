class OrdersController < ApplicationController
  # パラメータと一致するidのレコードを取得
  before_action :set_product, only: [:index, :create]
  # カレントユーザー取得
  before_action :authenticate_user!, only: [:index, :create]
  # 商品出品者と購入済商品の場合画面非表示
  before_action :check_user_product

  def index
    # view側でエラー表示させるためにモデルのインスタンスを渡す必要がある。
    @order = Order.new
  end

  def create
    # フォームオブジェクト「order」を保存
    @order = Order.new(order_params)
    if @order.valid?
      # クレジットカード決済機能の実装
      pay_item
      @order.save
      redirect_to root_path
    else
      # index画面
      render :index
    end
  end

  private
  
  # フォームオブジェクト「order」のDB更新条件
  def order_params
    # indexで@orderのインスタンスを作成したためorderをrequireしてあげる必要がある。でないとorderの中身のパラメーターにアクセスできない。
    # フォームオブジェクトにはpermitメソッドのデータもmergeメソッドのデータも渡せるので重複しないようにする。
    # クレジットカード決済機能のためtoken追加
    params.require(:order).permit(:zip_cd, :prefecture_id, :municipality, :address, :building, :tel).merge(user_id: current_user.id, product_id: @product.id, token: params[:token])
  end

  def set_product
    # パラメータと一致するidのレコードを取得(product_idはリクエスト{"product_id"=>"1"}に合わせる)
    @product = Product.find(params[:product_id])
  end

  # クレジットカード決済機能の実装
  def pay_item
    # JavaScriptで環境変数を呼び込み
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]      # 自身のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @product.price,     # 商品の値段     
      card: order_params[:token],     # カードトークン
      currency: 'jpy'     # 通貨の種類（日本円）
    )
  end

  # 商品出品者と購入済商品の場合画面非表示
  def check_user_product
    # 商品idに紐づくユーザーがログインユーザーと一致する場合と商品idに紐づくorder_userテーブルのレコードがnilでない場合
    if @product.user_id == current_user.id or @product.order_user != nil
      redirect_to root_path
    end
  end

end


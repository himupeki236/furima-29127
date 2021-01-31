class ProductsController < ApplicationController
  # カレントユーザー取得
  before_action :authenticate_user!
  before_action :login_check, only: [:new]

  def index
    # @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    # 何を新しく保存するか指定
    @product = Product.new(product_params)  
    # もし保存ができたらindexに遷移
    if @product.save   
      redirect_to root_path
    # できなければnewに遷移
    else   
      render :new
    end
  end

  private

  # ログインしてない場合サインインページに遷移する
  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  # 登録するカラムを制御をする
  def product_params
    params.require(:product).permit(:image, :name, :describe, :category_id, :state_id, :ship_charge_id, :prefectures_id, :ship_day_id, :price).merge(user_id: current_user.id)
  end
end


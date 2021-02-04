class ProductsController < ApplicationController
  # カレントユーザー取得
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @products = Product.order("created_at DESC")
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

  # 登録するカラムを制御をする
  def product_params
    params.require(:product).permit(:image, :name, :describe, :category_id, :state_id, :ship_charge_id, :prefectures_id, :ship_day_id, :price).merge(user_id: current_user.id)
  end
end


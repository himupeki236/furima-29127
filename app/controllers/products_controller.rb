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

  def show
    # パラメータと一致するidのレコードを取得
    @product = Product.find(params[:id])
    # user_idを取得
    user_id = @product.user_id
    # Productモデルのuser_idと一致するUserモデルのレコードを取得
    @user = User.find(user_id)
    # user_idと一致するUserモデルのレコードを取得
    # @order = OrderUser.find(user_id)
  end

  private

  # 登録するカラムを制御をする
  def product_params
    params.require(:product).permit(:image, :name, :describe, :category_id, :state_id, :ship_charge_id, :prefecture_id, :ship_day_id, :price).merge(user_id: current_user.id)
  end
end


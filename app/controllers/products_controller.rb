class ProductsController < ApplicationController
  # カレントユーザー取得
  before_action :authenticate_user!, only: [:new, :create]
  # パラメータと一致するidのレコードを取得
  before_action :set_product, only: [:show, :edit, :update, :destroy]

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

  end

  def edit
    
  end 

  def update
    # もし保存ができたらshowに遷移
    if @product.update(product_params)
      redirect_to product_path(@product.id)
      # できなければeditに遷移
    else
      render :edit
    end
  end

  def destroy
    if current_user.id = @product.id
      @product.destroy
      redirect_to root_path
    end
  end

  private

  # 登録するカラムを制御をする
  def product_params
    params.require(:product).permit(:image, :name, :describe, :category_id, :state_id, :ship_charge_id, :prefecture_id, :ship_day_id, :price).merge(user_id: current_user.id)
  end

  def set_product
    # パラメータと一致するidのレコードを取得
    @product = Product.find(params[:id])
  end
end
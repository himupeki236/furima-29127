class Order
  include ActiveModel::Model
  # DB登録するする「order_user」モデルと「address」モデルのカラム、orderコントローラーのストロングパラメータと一致させる
  # クレジットカード決済機能のためtoken追加
  attr_accessor :zip_cd, :prefecture_id, :municipality, :address, :building, :tel, :user_id, :product_id, :token
  
  # DB登録するする「order_user」モデルと「address」モデルのバリデーションをまとめてかく
  with_options presence: true do
    validates :zip_cd
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :tel
    # tokenが空では保存できない（クレジットカード決済機能）
    validates :token
    validates :user_id
    validates :product_id
  end
  validates :zip_cd, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :tel, length: { maximum: 11 }
  validates :tel, numericality: { only_integer: true }

  def save
    # order_userモデルの登録するカラムにattr_accessorの変数をセットする（左がカラム・右が変数）
    order_user = OrderUser.create(user_id: user_id, product_id: product_id)
    # addressモデルの登録するカラムにattr_accessorの変数をセットする
    Address.create(zip_cd: zip_cd, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, tel: tel, order_user_id: order_user.id)
  end
end
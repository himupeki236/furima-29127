require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '出品登録ができるとき' do
    it "image、name、describe、price、category_id、state_id、ship_charge_id、prefectures_id、ship_day_idが存在すれば登録できる" do
      expect(@product).to be_valid
    end
  end

  describe '出品登録ができないとき' do
    it "imageが空では投稿できない" do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end
    it "nameが空では投稿できない" do
      @product.name = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "nameが41文字以上であれば登録できない" do
      @product.name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      @product.valid?
      expect(@product.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
    end
    it "describeが空では投稿できない" do
      @product.describe = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Describe can't be blank")
    end
    it "describeが1001文字以上であれば登録できない" do
      @product.describe = "lamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamontlamoa"
      @product.valid?
      expect(@product.errors.full_messages).to include("Describe is too long (maximum is 1000 characters)")
    end
    it "category_idが1では投稿できない" do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Category must be other than 1")
    end
    it "state_idが1では投稿できない" do
      @product.state_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("State must be other than 1")
    end
    it "ship_charge_idが1では投稿できない" do
      @product.ship_charge_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Ship charge must be other than 1")
    end
    it "prefectures_idが1では投稿できない" do
      @product.prefectures_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Prefectures must be other than 1")
    end
    it "ship_day_idが1では投稿できない" do
      @product.ship_day_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Ship day must be other than 1")
    end
    it "category_idが空では投稿できない" do
      @product.category_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    it "state_idが空では投稿できない" do
      @product.state_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("State can't be blank")
    end
    it "ship_charge_idが空では投稿できない" do
      @product.ship_charge_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Ship charge can't be blank")
    end
    it "prefectures_idが空では投稿できない" do
      @product.prefectures_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Prefectures can't be blank")
    end
    it "ship_day_idが空では投稿できない" do
      @product.ship_day_id = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Ship day can't be blank")
    end
    it "priceが空では投稿できない" do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが299では投稿できない" do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "priceが10000000では投稿できない" do
      @product.price = 10000000
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it "priceが数字以外(あ)では投稿できない" do
      @product.price = "あ"
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is not a number")
    end
    it "priceが数字以外(a)では投稿できない" do
      @product.price = "a"
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is not a number")
    end
    it "priceが半角英数混合ではでは投稿できない" do
      @product.price = "2000a"
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is not a number")
    end
    it 'userが紐付いていないと保存できないこと' do
      @product.user = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("User must exist")
    end
  end
end

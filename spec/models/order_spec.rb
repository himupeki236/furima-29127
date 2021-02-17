require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    # user.idを取得するためcreateする
    user = FactoryBot.create(:user)
    # product.idを取得するためcreateする
    product = FactoryBot.create(:product)
    # user.idとproduct.idを使ってorderを生成する
    @order = FactoryBot.build(:order, user_id: user.id, product_id: product.id)
    # DBのエラー対応（beforeに処理が多い時にエラーが発生するため）
    sleep(0.5)
  end

  describe '購入ができるとき' do
    it "zip_cd、prefecture_id、municipality、building、address、tel、user_id、user_id、tokenが存在すれば登録できる" do
      expect(@order).to be_valid
    end

    it "buildingがなくても登録できる" do
      @order.building = nil
      expect(@order).to be_valid
    end
  end

  describe '購入ができないとき' do
    it "zip_cdがのフォーマットが不正（ハイフンが含まれない）では登録できないこと" do
      @order.zip_cd = '6510065'
      @order.valid?
      expect(@order.errors.full_messages).to include("Zip cd is invalid")
    end

    it "zip_cdがのフォーマットが不正（最初が4桁）では登録できないこと" do
      @order.zip_cd = '6510-0065'
      @order.valid?
      expect(@order.errors.full_messages).to include("Zip cd is invalid")
    end

    it "zip_cdがのフォーマットが不正（ハイフン以降が3桁）では登録できないこと" do
      @order.zip_cd = '651-065'
      @order.valid?
      expect(@order.errors.full_messages).to include("Zip cd is invalid")
    end

    it "zip_cdがのフォーマットが不正（文字が含まれている）では登録できないこと" do
      @order.zip_cd = 'a51-0065'
      @order.valid?
      expect(@order.errors.full_messages).to include("Zip cd is invalid")
    end

    it "prefecture_idがが空では登録できないこと" do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "prefecture_idがが1では登録できないこと" do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "municipalityがが空では登録できないこと" do
      @order.municipality = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipality can't be blank")
    end
    
    it "addressがが空では登録できないこと" do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it "telが空では登録できないこと" do
      @order.tel = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Tel can't be blank")
    end

    it "telが12行では登録できないこと" do
      @order.tel = '080973941050'
      @order.valid?
      expect(@order.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
    end

    it "telが数字以外では登録できないこと" do
      @order.tel = '0809739410a'
      @order.valid?
      expect(@order.errors.full_messages).to include("Tel is not a number")
    end

    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

    it "product_idが空では登録できないこと" do
      @order.product_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Product can't be blank")
    end

    it "user_idが空では登録できないこと" do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
  end
end

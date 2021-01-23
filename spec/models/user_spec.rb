require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nickname、email、password、password_confirmation、name_sei、name_mei、name_kana_sei、name_kana_mei、birth_dateが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが40文字以下であれば登録できる" do
      @user.nickname = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      expect(@user).to be_valid
    end
    it "passwordとpassword_confirmationが英数字を含んだ6文字以上であれば登録できる" do
      @user.password = "a12345"
      @user.password_confirmation = "a12345"
      expect(@user).to be_valid
    end
    it "name_seiが全角カナであれば登録できる" do
      @user.name_sei = "ア"
      expect(@user).to be_valid
    end
    it "name_seiがひらがなであれば登録できる" do
      @user.name_sei = "あ"
      expect(@user).to be_valid
    end
    it "name_seiが漢字であれば登録できる" do
      @user.name_sei = "阿"
      expect(@user).to be_valid
    end
    it "name_meiが全角カナであれば登録できる" do
      @user.name_mei = "ア"
      expect(@user).to be_valid
    end
    it "name_meiがひらがなであれば登録できる" do
      @user.name_mei = "あ"
      expect(@user).to be_valid
    end
    it "name_meiが漢字であれば登録できる" do
      @user.name_mei = "阿"
      expect(@user).to be_valid
    end
    it "name_kana_seiが全角カナであれば登録できる" do
      @user.name_kana_sei = "ア"
      expect(@user).to be_valid
    end
    it "name_kana_meiが全角カナであれば登録できる" do
      @user.name_kana_mei = "ア"
      expect(@user).to be_valid
    end
  end

  describe '新規登録がうまくいかないとき' do
    it "nicknameが空では登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "nicknameが41文字以上であれば登録できない" do
      @user.nickname = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 40 characters)")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = 'a1234'
      @user.password_confirmation = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが数字のみでは登録できない" do
      @user.password = '123456'
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが英字のみでは登録できない" do
      @user.password = 'aaaaaa'
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password = 'a12345'
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "name_seiが空では登録できない" do
      @user.name_sei = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Name sei can't be blank"
    end
    it "name_seiが英字では登録できない" do
      @user.name_sei = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include "Name sei is invalid"
    end
    it "name_seiが数字では登録できない" do
      @user.name_sei = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include "Name sei is invalid"
    end
    it "name_seiが半角カナでは登録できない" do
      @user.name_sei = "ｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Name sei is invalid"
    end
    it "name_meiが空では登録できない" do
      @user.name_mei = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Name mei can't be blank"
    end
    it "name_meiが英字では登録できない" do
      @user.name_mei = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include "Name mei is invalid"
    end
    it "name_meiが数字では登録できない" do
      @user.name_mei = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include "Name mei is invalid"
    end
    it "name_meiが半角カナでは登録できない" do
      @user.name_mei = "ｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Name mei is invalid"
    end
    it "name_kana_seiが空では登録できない" do
      @user.name_kana_sei = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kana sei can't be blank"
    end
    it "name_kana_seiが英字では登録できない" do
      @user.name_kana_sei = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kana sei is invalid"
    end
    it "name_kana_seiが数字では登録できない" do
      @user.name_kana_sei = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kana sei is invalid"
    end
    it "name_kana_seiが半角カナでは登録できない" do
      @user.name_kana_sei = "ｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kana sei is invalid"
    end
    it "name_kana_seiがひらがなでは登録できない" do
      @user.name_kana_sei = "あ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kana sei is invalid"
    end
    it "name_kana_seiが漢字では登録できない" do
      @user.name_kana_sei = "阿"
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kana sei is invalid"
    end
    it "name_kana_meiが空では登録できない" do
      @user.name_kana_mei = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kana mei can't be blank"
    end
    it "name_kana_meiが英字では登録できない" do
      @user.name_kana_mei = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kana mei is invalid"
    end
    it "name_kana_meiが数字では登録できない" do
      @user.name_kana_mei = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kana mei is invalid"
    end
    it "name_kana_meiが半角カナでは登録できない" do
      @user.name_kana_mei = "ｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kana mei is invalid"
    end
    it "name_kana_meiがひらがなでは登録できない" do
      @user.name_kana_mei = "あ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kana mei is invalid"
    end
    it "name_kana_meiが漢字では登録できない" do
      @user.name_kana_mei = "阿"
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kana mei is invalid"
    end
    it "birth_dateが空では登録できない" do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '#create' do
    context 'ユーザー登録ができる場合' do
      it 'nickname、email、passwordとpassword_confirmation、ユーザー本名とフリガナ、生年月日が存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない場合' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it 'emailが@を含まないと登録できないこと' do
        @user.email = 'hogehogehoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが6文字以上でないと登録できないこと' do
        @user.password = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it 'passwordは半角英字のみでは登録できないこと' do
        @user.password = 'hogehoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英字と数字両方を含めて設定してください")
      end

      it 'passwordは半角数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英字と数字両方を含めて設定してください")
      end

      it 'password_confirmationが空では登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'passwordとpassword_confirmationの値が一致しないと登録できないこと' do
        @user.password_confirmation = 'hoge12'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'ユーザー本名名字が空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end

      it 'ユーザー本名名字は、全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
        @user.last_name = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は全角で入力して下さい")
      end

      it 'ユーザー本名名前が空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it 'ユーザー本名名前は、全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
        @user.first_name = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角で入力して下さい")
      end

      it 'ユーザー本名名字フリガナが空では登録できないこと' do
        @user.last_kana_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)を入力してください")
      end

      it 'ユーザー本名名前フリガナが空では登録できないこと' do
        @user.first_kana_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end

      it 'ユーザー本名名字フリガナは、全角カタカナでないと登録できないこと' do
        @user.last_kana_name = 'ほげ'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)は全角カナで入力して下さい")
      end

      it 'ユーザー本名名前フリガナは、全角カタカナでないと登録できないこと' do
        @user.first_kana_name = 'ほげ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)は全角カナで入力して下さい")
      end

      it '生年月日が空では登録できないこと' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end

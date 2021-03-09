require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nameとemail、passwordとpassword_confirmation,family_name,first_name,\
      family_name_furi,first_name_furi,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'emailに@がない場合は登録できないこと ' do
        @user.email = 'hogehuga.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが6文字以下では登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 7 characters)')
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = 'asdzxc'
        @user.password_confirmation = 'asdzxc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角でなければ登録できない' do
        @user.password = 'ABc１２３'
        @user.password_confirmation = 'ABc１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_name_furiが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_name_furiが空では登録できない' do
        @user.family_name_furi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name furi can't be blank")
      end
      it 'first_name_furiが空では登録できない' do
        @user.first_name_furi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furi can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'family_nameが全角でなければ登録できない' do
        @user.family_name = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name 全角で入力してください')
      end
      it 'first_nameが全角でなければ登録できない' do
        @user.first_name = 'huga'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角で入力してください')
      end
      it 'family_name_furiが全角カタカナでなければ登録できない' do
        @user.family_name_furi = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name furi 全角（カタカナ）で入力してください')
      end
      it 'first_name_furiが全角カタカナでなければ登録できない' do
        @user.first_name_furi = 'huga'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name furi 全角（カタカナ）で入力してください')
      end
      it 'family_name_furiが全角カタカナでなければ登録できない' do
        @user.family_name_furi = 'ああｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name furi 全角（カタカナ）で入力してください')
      end
      it 'first_name_furiが全角カタカナでなければ登録できない' do
        @user.first_name_furi = 'ああｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name furi 全角（カタカナ）で入力してください')
      end
    end
  end
end

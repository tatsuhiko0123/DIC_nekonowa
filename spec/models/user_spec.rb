require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user2) }

  describe 'ユーザーの新規作成時バリデーションテスト' do
    context 'ユーザー登録時にname,email,passwordを正しく入力した場合,' do
      it 'サインアップできる' do
        expect(user).to be_valid
      end
    end

    context 'nameが空の場合,' do
      it 'バリデーションエラーとなる' do
        user.name = ""
        expect(user).to be_invalid
      end
    end

    context 'nameが15文字を超える場合,' do
      it 'バリデーションエラーとなる' do
        user.name = 'a'*15
        expect(user).to be_valid
      end
    end

    context 'emailが空の場合,' do
      it 'バリデーションエラーとなる' do
        user.email = ""
        expect(user).to be_invalid
      end
    end

    context 'emailが無効な値の場合,' do
      it 'バリデーションエラーとなる' do
        user.email = 'hoge'
        expect(user).to be_invalid
      end
    end

    context 'emailが重複した場合,' do
      it 'バリデーションエラーとなる' do
        User.create!(
          name: 'kuro',
          email: 'kuro@gmail.com',
          password: '111111',
          password_confirmation: '111111',
        )
        user = User.new(
          name: 'kuro',
          email: 'kuro@gmail.com',
          password: '111111',
          password_confirmation: '111111',
        )
        expect(user).to be_invalid
      end
    end

    context 'passwordが空の場合,' do
      it 'バリデーションエラーとなる' do
        user.password = ""
        expect(user).to be_invalid
      end
    end

    context 'passwordが6文字に満たない場合,' do
      it 'バリデーションエラーとなる' do
        user.password = 'a'*5
        user.password_confirmation = 'a'*5
        expect(user).to be_invalid
        user.password = 'a'*6
        user.password_confirmation = 'a'*6
        expect(user).to be_valid
      end
    end
  end

  describe 'ユーザーの編集時バリデーションテスト' do
    context '画像について' do
      it 'プロフィール画像を登録することができる' do
        expect(user).to be_valid
      end
    end

    context '画像が空の場合でも,' do
      it '登録することができる' do
        user.image = ""
        expect(user).to be_valid
      end
    end
  end
end
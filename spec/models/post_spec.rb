require 'rails_helper'

describe '投稿モデルテスト', type: :model do
  let!(:user) { FactoryBot.create(:user)}
  let!(:post) { FactoryBot.create(:post, user_id: user.id)}

  describe 'バリデーションテスト' do
    context '画像の入力が正しい場合' do
      it '新規作成ができる' do
        expect(post).to be_valid
      end
    end

    context '画像が空の場合' do
      it 'バリデーションエラーとなる' do
        post.image = nil
        expect(post).to be_invalid
      end
    end

    context 'コメントの入力が正しい場合' do
      it '新規作成ができる' do
        expect(post).to be_valid
      end
    end

    context 'コメントが空の場合' do
      it 'バリデーションエラーとなる' do
        post.comment = nil
        expect(post).to be_invalid
      end
    end
  end
end
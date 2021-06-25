require 'rails_helper'

RSpec.describe 'ユーザー機能',type: :system do
  let!(:user) { FactoryBot.create(:user) }

  before do
    visit root_path
  end

  describe 'devise機能' do
    context '入力内容が正しい場合' do
      it '新規アカウントを登録できる' do
        click_link '新規アカウント登録'
        attach_file :user_image, "./app/assets/images/2.JPG"
        fill_in :user_name, with: "natu"
        fill_in :user_comment, with: "ナツです"
        fill_in :user_email, with: "natu@gmail.com"
        fill_in :user_password, with: "111111"
        fill_in :user_password_confirmation, with: "111111"
        sleep(0.5)
        click_button 'commit'
        expect(page).to have_content '投稿一覧'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
    
    context '入力内容に漏れが合った場合' do
      it '新規アカウント作成できない' do
        click_link '新規アカウント登録'
        click_button 'commit'
        expect(page).to have_content "名前を入力してください"
        expect(page).to have_content "メールアドレスを入力してください"
        expect(page).to have_content "パスワードを入力してください"
      end
    end

    context '全ての入力内容が正しい場合' do
      it 'ログインできる' do
        click_link 'ログイン'
        fill_in :user_email, with: "kuro@gmail.com"
        fill_in :user_password, with: "111111"
        click_button 'commit'
        expect(page).to have_content '投稿一覧'
        expect(page).to have_content 'ログインしました。'
      end
    end

    context 'メールアドレスとパスワードが一致しない場合' do
      it 'ログインできない' do
        click_link 'ログイン'
        fill_in :user_email, with: "kuro@gmail.com"
        fill_in :user_password, with: "222222"
        click_button 'commit'
        expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
        expect(current_path).to have_content '/users/sign_in'
      end
    end
  end

  describe 'ログイン後' do
    context 'ログアウトした場合' do
      it  'トップページに戻りログイン状態が解除される' do
        visit root_path
        click_link 'ログイン'
        fill_in :user_email, with: "kuro@gmail.com"
        fill_in :user_password, with: "111111"
        click_button 'commit'
        expect(page).to have_content '投稿一覧'
        expect(page).to have_content 'ログインしました。'
        click_on 'ログアウト'
        expect(page).to have_content 'ログアウトしました。'
        expect(current_path).to have_content '/users'
      end
    end
  end
end
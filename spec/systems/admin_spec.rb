require 'rails_helper'
RSpec.describe 'Admin', type: :system do

  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:user2) { FactoryBot.create(:user2) }
  let!(:post2) { FactoryBot.create(:post2, user: user2) }
  let!(:favorite) { FactoryBot.create(:favorite, post: post2, user: admin_user) }
  let!(:conversation) { FactoryBot.create(:conversation, sender_id: admin_user.id, recipient_id: user2.id)}
  let!(:message) { Message.create(body: "message", read:"false", user_id: admin_user.id, conversation_id: conversation.id)}
  let!(:other_post){ FactoryBot.create(:other_post, post_id: post2.id)}


  describe '管理者機能' do
    before do 
      visit root_path
      click_link 'ログイン'
      fill_in :user_email, with: "goma@gmail.com"
      fill_in :user_password, with: "111111"
      click_button 'ログイン'
      # binding.irb
      click_on '管理画面'
    end

    context '管理者の場合,' do
      it '管理者ページにアクセスできて投稿の編集ができる。' do
        expect(current_path).to eq rails_admin_path
        # binding.irb
        find('.nav-pills').find_link('投稿').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(9)').find(".list-inline").find_link('編集').click
        click_button '保存'
        expect(page).to have_content '投稿の更新に成功しました'
      end
    end
  
    context '管理者の場合,' do
      it '管理者ページにアクセスできて投稿の削除ができる。' do
        expect(current_path).to eq rails_admin_path
        find('.nav-pills').find_link('投稿').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(9)').find(".list-inline").find_link('削除').click
        # binding.irb
        click_button('実行する')
        expect(page).to have_content '投稿の削除に成功しました'
      end
    end

    context '管理者の場合,' do
      it 'お気に入りを削除することができる。' do
        expect(current_path).to eq rails_admin_path
        find('.nav-pills').find_link('Favorite').click
        # binding.irb
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(7)').find(".list-inline").find_link('削除').click
        click_button('実行する')
        expect(page).to have_content 'Favoriteの削除に成功しました'
      end
    end

    context '管理者の場合,' do
      it '管理者ページにアクセスできてユーザーの編集ができる。' do
        expect(current_path).to eq rails_admin_path
        find('.nav-pills').find_link('ユーザー').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(9)').find(".list-inline").find_link('編集').click
        # binding.irb
        click_button '保存'
        expect(page).to have_content 'ユーザーの更新に成功しました'
      end
    end

    context '管理者の場合,' do
      it '管理者ページにアクセスできてユーザーの削除ができる。' do
        expect(current_path).to eq rails_admin_path
        find('.nav-pills').find_link('ユーザー').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(9)').find(".list-inline").find_link('削除').click
        click_button '実行する'
        expect(page).to have_content 'ユーザーの削除に成功しました'
      end
    end

    context '管理者の場合,' do
      it '管理者ページにアクセスできてメッセージの編集ができる。' do
        expect(current_path).to eq rails_admin_path
        find('.nav-pills').find_link('Message').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(9)').find(".list-inline").find_link('編集').click
        click_button '保存'
        # binding.irb
        expect(page).to have_content 'Messageの更新に成功しました'
      end
    end

    context '管理者の場合,' do
      it '管理者ページにアクセスできてメッセージの削除ができる。' do
        expect(current_path).to eq rails_admin_path
        find('.nav-pills').find_link('Message').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(9)').find(".list-inline").find_link('削除').click
        click_button '実行する'
        # binding.irb
        expect(page).to have_content 'Messageの削除に成功しました'
      end
    end

    context '管理者の場合,' do
      it '管理者ページにアクセスできて詳細情報の編集ができる。' do
        expect(current_path).to eq rails_admin_path
        find('.nav-pills').find_link('詳細情報投稿').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(9)').find(".list-inline").find_link('編集').click
        click_button '保存'
        # binding.irb
        expect(page).to have_content '詳細情報投稿の更新に成功しました'
      end
    end

    context '管理者の場合,' do
      it '管理者ページにアクセスできて詳細情報の削除ができる。' do
        expect(current_path).to eq rails_admin_path
        find('.nav-pills').find_link('詳細情報投稿').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(9)').find(".list-inline").find_link('削除').click
        # binding.irb
        click_button '実行する'
        expect(page).to have_content '詳細情報投稿の削除に成功しました'
      end
    end

  end

  describe '管理者ログイン' do
    context '管理者の場合,' do
      it '管理者ページにログインできる。' do
        visit root_path
        click_link 'ログイン'
        fill_in :user_email, with: "goma@gmail.com"
        fill_in :user_password, with: "111111"
        click_button 'ログイン'
        sleep(0.5)
        click_on '管理画面'
        expect(page).to have_content 'サイト管理'
      end
    end
  end

  describe 'ゲスト管理者ログイン' do
    context 'ゲスト管理者の場合,' do
      it '管理者ページにログインできる。' do
        visit root_path
        click_link 'ゲストログイン（管理者）'
        expect(page).to have_content 'ログインしました。(管理者ゲスト)'
        click_on '管理画面'
        expect(page).to have_content 'サイト管理'
      end
    end
  end
end
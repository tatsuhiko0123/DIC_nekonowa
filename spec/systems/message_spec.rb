require 'rails_helper'
RSpec.describe 'メッセージ機能', type: :system do

  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:user2) { FactoryBot.create(:user2) }
  let!(:post2) { FactoryBot.create(:post2, user: user2) }
  let!(:conversation) { FactoryBot.create(:conversation, sender_id: admin_user.id, recipient_id: user2.id)}
  let!(:message) { Message.create(body: "message", read:"false", user_id: admin_user.id, conversation_id: conversation.id)}

  before do
    visit root_path
    click_link 'ログイン'
    fill_in :user_email, with: "goma@gmail.com"
    fill_in :user_password, with: "111111"
    click_button 'commit'

  end

  describe 'メッセージ送信機能' do
    context 'メッセージを送信した場合' do
      it '送信したメッセージが表示される' do
        click_link 'クロ'
        sleep(0.5)
        click_link 'この投稿者にメッセージ'
        fill_in :message_body, with: "こんにちは"
        expect(page).not_to have_content 'こんにちは'
        click_button 'commit'
        expect(page).to have_content '未読'
        expect(page).to have_content 'こんにちは'
      end
    end
  end

  describe 'メッセージ一覧' do
    context 'メッセージ一覧を押した場合' do
      it 'メッセージ一覧画面が表示される' do
        click_link 'プロフィール', match: :first
        sleep(0.5)
        click_link 'メッセージ一覧'
        expect(page).to have_content 'メッセージ一覧'
      end
    end

    context 'メッセージ一覧でユーザー名を押した場合' do
      it 'ユーザーとのメッセージ画面が表示される' do
        click_link 'プロフィール', match: :first
        sleep(0.5)
        click_link 'メッセージ一覧'
        expect(page).to have_content 'メッセージ一覧'
        click_link 'tora'
        expect(page).to have_content 'goma'
      end
    end
  end  
end
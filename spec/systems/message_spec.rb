require 'rails_helper'
RSpec.describe 'メッセージ機能', type: :system do
  let!(:post) { FactoryBot.create(:post) }
  let!(:post2) { FactoryBot.create(:post2) }

  before do
    visit root_path
    click_link 'ログイン'
    fill_in :user_email, with: "kuro@gmail.com"
    fill_in :user_password, with: "111111"
    click_button 'commit'
  end

  describe 'メッセージ送信機能' do
    context 'メッセージを送信した場合' do
      it '送信され一覧にコメントが表示される' do
        click_link 'ゴマ'
        sleep(0.5)
        click_link 'この投稿者にメッセージ'
        fill_in :message_body, with: "こんにちは"
        click_button 'commit'
        expect(page).to have_content '未読'
      end
    end
  end
end
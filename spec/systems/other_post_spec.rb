require 'rails_helper'

RSpec.describe '投稿機能', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:post) { FactoryBot.create(:post, user_id: user.id) }
  let!(:post2) { FactoryBot.create(:post2, user_id: user.id) }
  let!(:other_post){ FactoryBot.create(:other_post, post_id: post.id)}

  before do
    visit new_user_session_path
    fill_in :user_email, with: "kuro@gmail.com"
    fill_in :user_password, with: "111111"
    click_button 'commit'
    # binding.irb
  end

  describe '詳細情報の追加機能' do
    context '詳細情報を追加した場合' do
      it '作成した詳細情報が表示される' do
        click_link 'クロ'
        click_on '詳細情報を追加する'
        find("#other_post_vaccination").find("option[value='未接種']").select_option
        find("#other_post_operation").find("option[value='未手術']").select_option
        find("#other_post_single").find("option[value='可']").select_option
        find("#other_post_old_age").find("option[value='可']").select_option
        fill_in :other_post_health_status, with: "良好"
        fill_in :other_post_character, with: "おっとり"
        fill_in :other_post_surrender, with: "自転車オッケー"
        fill_in :other_post_note, with: "特に無し"
        click_on '詳細情報を追加する'
        expect(page).to have_content '詳細情報を追加しました！'
      end
    end

    context '詳細情報を編集した場合' do
      it '編集した詳細情報が表示される' do
        click_link 'ゴマ'
        click_on '詳細情報を編集する'
        find("#other_post_vaccination").find("option[value='未接種']").select_option
        find("#other_post_operation").find("option[value='未手術']").select_option
        find("#other_post_single").find("option[value='可']").select_option
        find("#other_post_old_age").find("option[value='可']").select_option
        fill_in :other_post_health_status, with: "良好"
        fill_in :other_post_character, with: "おっとり"
        fill_in :other_post_surrender, with: "自転車オッケー"
        fill_in :other_post_note, with: "特に無し"
        click_on '詳細情報を更新する'
        expect(page).to have_content '詳細情報を編集しました！'
      end
    end
  end
end
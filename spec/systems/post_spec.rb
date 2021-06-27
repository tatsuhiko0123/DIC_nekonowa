require 'rails_helper'

RSpec.describe '投稿機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user2) }
  let!(:favorite){ FactoryBot.create(:favorite, post_id: post2.id, user_id: user.id)}
  let!(:post) { FactoryBot.create(:post, user_id: user.id) }
  let!(:post2) { FactoryBot.create(:post2, user_id: user2.id) }
  let!(:post3) { FactoryBot.create(:post3, user_id: user2.id) }

  before do
    visit new_user_session_path
    fill_in :user_email, with: "kuro@gmail.com"
    fill_in :user_password, with: "111111"
    click_button 'commit'
  end

  describe '新規作成機能' do
    context '新規作成した場合' do
      it '作成した投稿が表示される' do
        # binding.irb
        click_on '新規投稿', match: :first
        sleep(0.5)
        attach_file :post_image, "./app/assets/images/1.JPG"
        fill_in :post_comment, with: "クロ"
        fill_in :post_breed, with: "雑種"
        find("#post_gender").find("option[value='♂　オス']").select_option
        find("#post_age").find("option[value='１週間']").select_option
        find("#post_prefecture").find("option[value='北海道']").select_option
        fill_in :post_address, with: "茨城県つくばみらい市福田195"
        click_on '投稿する'
        expect(page).to have_content 'クロ'
        expect(page).to have_content '雑種'
      end
    end

    context '投稿作成した際に画像が登録されていない場合' do
      it '新規投稿できない' do
        click_on '新規投稿', match: :first
        sleep(0.5)
        fill_in :post_comment, with: "クロ"
        fill_in :post_breed, with: "雑種"
        find("#post_gender").find("option[value='♂　オス']").select_option
        find("#post_age").find("option[value='１週間']").select_option
        find("#post_prefecture").find("option[value='北海道']").select_option
        fill_in :post_address, with: "茨城県つくばみらい市福田195"
        click_on '投稿する'
        expect(page).to have_content '画像を入力してください'
      end
    end

    context '投稿作成した際にコメントが登録されていない場合' do
      it '新規投稿できない' do
        click_on '新規投稿', match: :first
        sleep(0.5)
        attach_file :post_image, "./app/assets/images/1.JPG"
        fill_in :post_comment, with: ""
        fill_in :post_breed, with: "雑種"
        find("#post_gender").find("option[value='♂　オス']").select_option
        find("#post_age").find("option[value='１週間']").select_option
        find("#post_prefecture").find("option[value='北海道']").select_option
        fill_in :post_address, with: "茨城県つくばみらい市福田195"
        click_on '投稿する'
        # binding.irb
        expect(page).to have_content '紹介文を入力してください'
      end
    end

    context '投稿作成に失敗した場合' do
      it '画面遷移せずそのまま新規投稿画面にいること' do
        click_on '新規投稿', match: :first
        click_on '投稿する'
        expect(current_path).to have_content '/posts'
      end
    end
  end

  describe '投稿一覧機能' do
    context '投稿一覧画面に遷移した場合' do
      it '作成済みの投稿一覧が表示される' do
        visit posts_path
        expect(page).to have_content '投稿一覧'
      end
    end
  end

  describe '詳細表示機能' do
    context '任意の投稿詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        visit post_path(post.id)
        expect(page).to have_content '猫のステータス'
      end
    end
  end

  describe '投稿編集機能' do
    context '自分の投稿を編集する場合' do
      it '投稿が編集される' do
        # binding.irb
        click_link 'ゴマ'
        click_link '投稿を編集する'
        expect(page).to have_content "投稿を編集する"
        fill_in :post_comment, with: "クロを編集"
        click_on '投稿する'
        expect(page).to have_content "猫のステータス"
        expect(page).to have_content "投稿を編集しました！"
      end
    end
  end

  describe '投稿削除機能' do
    context '自分の投稿を削除する場合' do
      it '投稿が削除される' do
        click_link 'ゴマ'
        click_link '投稿を削除する'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "投稿を削除しました！"
      end
    end
  end

  describe 'お気に入り機能' do
    context 'お気に入りした場合' do
      it 'お気に入り登録できる' do
        click_link 'トラ'
        click_on '気になる一覧に登録'
        expect(page).to have_content '猫のステータス'
      end
    end
  end

  describe 'お気に入り機能' do
    context 'お気に入り解除した場合' do
      it 'お気に入り一覧に表示されなくなる' do
        click_link 'クロ'
        click_on '気になる一覧から削除'
        # binding.irb
        expect(current_path).to have_content '/posts'
        expect(page).to have_content '投稿一覧'
      end
    end
  end
 
  describe '検索機能' do
    context 'エリア検索をした場合' do
      it "検索したエリアの投稿が表示されること" do
        find("#search_prefecture").find("option[value='北海道']").select_option
        click_on '検索'
        # binding.irb
        expect(page).to have_content '北海道'
        expect(page).not_to have_content 'クロ'
      end
    end
  end
end 
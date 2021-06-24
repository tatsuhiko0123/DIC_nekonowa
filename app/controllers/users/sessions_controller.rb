class Users::SessionsController < Devise::SessionsController

  def new_guest
    user = User.guest
    sign_in user   # ユーザーをログインさせる
    redirect_to posts_path, notice: 'ログインしました(ゲスト)'
  end

  def new_admin_guest
    guest_user = User.admin_guest
    sign_in guest_user   # ユーザーをログインさせる
    redirect_to posts_path, notice: 'ログインしました。(管理者ゲスト)'
  end

end
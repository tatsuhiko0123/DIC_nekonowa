class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :comment])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :comment])
  end

  def after_sign_in_path_for(resource)
    posts_path
  end

  def after_sign_out_path_for(resource)
    users_path # ログアウト後に遷移するpathを設定
  end
end

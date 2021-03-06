class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  skip_before_action :authenticate_user!, only: [:index]

  def index
  end

  def show
    @favorite = current_user.favorite_posts
    @users = current_user.posts
  end

  private
  def user_params
    params.require(:user).permit(:image, :image_cache, :name, :comment)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
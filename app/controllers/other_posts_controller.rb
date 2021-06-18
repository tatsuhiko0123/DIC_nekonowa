class OtherPostsController < ApplicationController
  before_action :set_other_post, only: [:edit, :update]

  def index
    @other_posts = OtherPost.all
  end

  def new
    @other_post = OtherPost.new
  end

  def create
    @other_post = OtherPost.new(other_post_params)
    if @other_post.save
      redirect_to other_posts_path, notice: "追加情報を作成しました！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @other_post.update(other_post_params)
      redirect_to other_posts_path, notice: "追加情報を編集しました！"
    else
      render :edit
    end
  end

  def confirm
  end

  private
  def other_post_params
    params.require(:other_post).permit(:vaccination, :operation, :single, :old_age,
                                       :health_status, :character, :surrender, :note)
  end

  def set_other_post
    @other_post = OtherPost.find(params[:id])
  end
end

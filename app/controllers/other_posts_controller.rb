class OtherPostsController < ApplicationController
  before_action :set_other_post, only: [:update, :edit]
  before_action :set_post

  def new
    @other_post = @post.build_other_post
  end

  def create
    @other_post = @post.build_other_post(other_post_params)
    if @other_post.save
      redirect_to posts_path, notice: "詳細情報を追加しました！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @other_post.update(other_post_params)
      redirect_to posts_path, notice: "詳細情報を編集しました！"
    else
      render :edit
    end
  end
  
  private
  def other_post_params
    params.require(:other_post).permit(:vaccination, :operation, :single, :old_age,
                                       :health_status, :character, :surrender, :note)
  end

  def set_other_post
    @other_post = OtherPost.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end

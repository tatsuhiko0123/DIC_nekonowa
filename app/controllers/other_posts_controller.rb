class OtherPostsController < ApplicationController
  before_action :set_other_post, only: [:edit, :update]

  def edit
  end

  def update
    if @other_post.update(other_post_params)
      redirect_to posts_path(post_id: @post.id), notice: "詳細情報を編集しました！"
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
    @other_post = Post.find(params[:post_id])
  end
end

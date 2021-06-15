class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to posts_path, notice: "新規投稿を作成しました！"
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "投稿を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"投稿を削除しました！"
  end

  def confirm
  end
  private
  def post_params
    params.require(:post).permit(:comment)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

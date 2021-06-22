class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :baria_user, only: [:edit, :destroy, :update]

  def index
    @posts = Post.all.page(params[:page]).per(10)
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "新規投稿を作成しました！"
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @other_post = OtherPost.find_by(post_id: @post.id)
  end

  def edit
  end

  def update
    redirect_to posts_path if @post.user != current_user
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: "投稿を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"投稿を削除しました！"
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end
  private
  def post_params
    params.require(:post).permit(:image, :image_cache, :comment, :breed, :gender, :age, :prefecture, :address, :latitude, :longitude)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def baria_user
    unless Post.find(params[:id]).user.id.to_i == current_user.id
        redirect_to posts_path(current_user)
    end
  end
end

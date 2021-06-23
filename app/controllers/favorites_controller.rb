class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to post_path("#{params[:post_id]}"), notice: "#{favorite.post.user.name}さんの投稿を気になる一覧に登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_path, notice: "#{favorite.post.user.name}さんの投稿を気になる一覧から削除しました"
  end
end

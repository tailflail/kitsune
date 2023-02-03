class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    redirect_to post
  end

  def destroy
    post = Favorite.find(params[:id]).post
    current_user.unfavorite(post)
    redirect_to post
  end
end

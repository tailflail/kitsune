class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    post = Post.find(params[:post_id])
    authorize post, policy_class: FavoritePolicy
    current_user.favorite(post)
    redirect_to post
  end

  def destroy
    post = Favorite.find(params[:id]).post
    authorize post, policy_class: FavoritePolicy
    current_user.unfavorite(post)
    redirect_to post
  end
end

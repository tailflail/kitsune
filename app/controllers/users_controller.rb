class UsersController < ApplicationController
  before_action :find_user
  def show
    unless @user
      raise ActionController::RoutingError.new('Not Found')
    end

    redirect_to gallery_user_path(@user)
  end

  def gallery
    @posts = @user.posts.order(created_at: :desc)
  end

  def following
    @following = @user.following
  end

  def followers
    @followers = @user.followers
  end

  def favorites
    @favorites = @user.favorite_posts
  end

  private

  def find_user
    @user = User.includes(:profile).find_by(username: params[:username])
  end
end

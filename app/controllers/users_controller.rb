class UsersController < ApplicationController
  before_action :find_user
  def show
    unless @user
      raise ActionController::RoutingError.new('Not Found')
    end
    @posts = @user.posts.order(created_at: :desc)
  end

  def following
    @following = @user.following
  end

  def followers
    @followers = @user.followers
  end

  private

  def find_user
    @user = User.find_by(username: params[:username])
  end
end

class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    unless @user
      raise ActionController::RoutingError.new('Not Found')
    end
    @posts = @user.posts.order(created_at: :desc)
  end
end

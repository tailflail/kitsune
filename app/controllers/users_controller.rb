class UsersController < ApplicationController
  def show
    @user = User.find_by_username(params[:username])
    unless @user
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end

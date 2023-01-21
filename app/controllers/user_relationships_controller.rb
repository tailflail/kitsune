class UserRelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    followed_user = User.find(params[:followed_id])
    authorize followed_user, policy_class: UserRelationshipPolicy
    current_user.follow(followed_user)
    redirect_to followed_user
  end

  def destroy
    followed_user = UserRelationship.find(params[:id]).followed
    current_user.unfollow(followed_user)
    redirect_to followed_user
  end
end

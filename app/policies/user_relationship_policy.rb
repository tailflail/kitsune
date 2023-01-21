class UserRelationshipPolicy
  attr_reader :user, :followed_user

  def initialize(user, followed_user)
    @user = user
    @followed_user = followed_user
  end

  def create?
    @user != @followed_user
  end
end
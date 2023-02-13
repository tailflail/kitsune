class ProfilePolicy
  attr_reader :user, :profile

  def initialize(user, profile)
    @user = user
    @profile = profile
  end

  def edit?
    @profile == @user.profile
  end

  def update?
    @profile == @user.profile
  end
end
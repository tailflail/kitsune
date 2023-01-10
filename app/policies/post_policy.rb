class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def edit?
    @user == @post.user
  end

  def update?
    @user == @post.user
  end

  def destroy?
    @user == @post.user
  end
end
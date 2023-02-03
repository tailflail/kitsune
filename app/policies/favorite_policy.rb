class FavoritePolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    first = !@user.has_favorite_post?(@post)
    second = @user != @post.user

    first && second
  end

  def destroy?
    @user.has_favorite_post?(@post)
  end
end
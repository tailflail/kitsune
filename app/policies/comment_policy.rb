class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def edit?
    @user == @comment.user
  end

  def update?
    @user == @comment.user
  end

  def destroy?
    @user == @comment.user
  end
end
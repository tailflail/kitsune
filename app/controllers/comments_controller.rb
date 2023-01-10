class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_and_authorize_comment, only: [:destroy, :edit, :update]
  before_action :find_post, only: [:create, :edit, :update]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post
    end
  end

  def destroy
    @post = @comment.post
    @comment.destroy
    redirect_to @post
  end

  def update
    if @comment.update(comment_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def find_and_authorize_comment
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end

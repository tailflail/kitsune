class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_and_authorize_comment, only: [:destroy, :edit, :update]

  def new
    @comment = current_user.comments.build
  end

  def create
    @comment = current_user.comments.build(comment_params)

    if @comment.save
      redirect_to @comment.post
    end
  end

  def destroy
    @post = @comment.post
    @comment.destroy
    redirect_to @post
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def find_and_authorize_comment
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def comment_params
    params.require(:comment).permit(:body, :parent_id, :post_id)
  end
end

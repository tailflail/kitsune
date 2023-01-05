class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_post, only: [:edit, :update, :destroy]
  def new
    @post = current_user.posts.build
  end

  def show
    @post = Post.includes(:user, :comments).find(params[:id])
    @comments = @post.comments.includes(:user)
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end

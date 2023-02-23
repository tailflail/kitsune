class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_and_authorize_post, only: [:edit, :update, :destroy]
  def new
    @post = current_user.posts.build
  end

  def show
    @post = Post.includes(:user, :comments).find(params[:id])
    @comments = @post.comments.includes(:user)

    # Provides links in the sidebar to view other posts by the author
    @recent_posts = Post.where(user_id: @post.user_id).where.not(id: @post.id).order(created_at: :desc).limit(6)
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
    params.require(:post).permit(:title, :description, :image, :tag_list)
  end

  def find_and_authorize_post
    @post = Post.find(params[:id])
    authorize @post
  end
end
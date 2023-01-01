class StaticController < ApplicationController
  def home
    @posts = Post.all.order(created_at: :desc).limit(50)
  end
end

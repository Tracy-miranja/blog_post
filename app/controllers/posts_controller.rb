class PostsController < ApplicationController
 layout 'standard'
  def index
    @posts = Post.all
    @users= User.all
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = Comment.where(post_id: params[:id])
  end
end

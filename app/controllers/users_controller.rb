class UsersController < ApplicationController
  layout 'standard'
  def index
    @users = User.all
    @posts = Post.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
    puts @posts
  end
end

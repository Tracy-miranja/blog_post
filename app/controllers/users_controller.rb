class UsersController < ApplicationController
  layout 'standard'
  def index
    @users = User.all
    @posts = Post.all
  end

  def show
    @users = User.find(params[:id])
    @posts = Post.all
  end
end

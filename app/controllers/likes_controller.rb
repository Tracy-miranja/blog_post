class LikesController < ApplicationController
  def new
    @like = Like.new
    @post = Post.find(params[:post_id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author: current_user)
    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'Liked post successfully.'
    else
      redirect_to user_post_path(@user, @post), alert: ' created.'
    end
  end
end

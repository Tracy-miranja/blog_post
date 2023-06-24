class LikesController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @user = User.find(params[:user_id])
      # @like = Like.new(author_id: @user.id, post_id: params[:post_id])
      
      # if @like.save
      #   redirect_to user_post_path(@user, @post)
      #   puts 'likes is working'
      # else 
      #   puts 'likes is not working'
      # end
      like = Like.new(author_id: @user.id, post_id: params[:post_id])
    like.save
    puts like.errors.full_messages

    end
end
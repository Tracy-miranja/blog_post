class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(text: comment_params[:text], post_id: params[:post_id], author_id: current_user[:id])

    if @comment.save
      redirect_to user_post_path(author_id: params[:author_id], id: params[:post_id]),
                  notice: 'Comment created successfully.'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

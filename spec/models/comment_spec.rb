require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(name: 'Shafiu', photo: 'shafiu.jpg', bio: 'Software Engineer', post_counter: 0)
    @post = Post.create(title: 'Post 1', text: 'Post body', author: @user, comments_counter: 0, likes_counter: 3)
    @comment = Comment.create(post: @post, author: @user, text: 'Great')
    @post.reload # Refresh the post object to reflect the updated comment_counter
  end

  context 'comment' do
    it 'should contain the comment' do
      text = @comment.text
      expect(text).to eq 'Great'
    end

    it 'expect comment counter to increase' do
      expect do
        Comment.create(post: @post, author: @user, text: 'New Comment')
        @post.reload
      end.to change { @post.comments_counter }.by(1)
    end

    it 'will have the Post comment_counter through update_post_comment_counter' do
      expect do
        Comment.create(post: @post, author: @user, text: 'New Comment')
        @post.reload # Refresh the post object after creating a new comment
      end.to change { @post.comments_counter }.from(1).to(2) # Use `comments_counter` instead of `comment_counter`
    end
  end
end

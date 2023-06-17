require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @author = User.create(name: 'Shafiu', photo: 'https://avatars.githubusercontent.com/u/118063058?v=4',
                          bio: 'Software developer')
    @post = Post.create(author: @author, title: 'Post one', text: 'Post')
    @like = Like.create(author_id: @author, post_id: @post)
  end

  it 'Update likes counter' do
    expect(@post.likes_counter).to eq 0
  end
end

require 'rails_helper'
RSpec.describe 'Posts', type: :system do
  before do
    driven_by(:rack_test)
  end
  describe 'Post show page' do
    user = User.create(name: 'Lilly', photo: 'https://randomuser.me/api/portraits/women/67.jpg', bio: 'Project manager')
    post = Post.create(author: user, title: 'First post', text: 'First post', comments_counter: 2, likes_counter: 2)
    comment1 = Comment.create(author: user, post:, text: 'Great post!')
    comment2 = Comment.create(author: user, post:, text: 'Nice work!')
    before do
      visit user_post_path(user, post)
    end
    scenario "displays the post's title, author name, comments count, likes count, post body, username of each commenter, comments" do
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.author.name)
      expect(page).to have_content("comments: #{post.comments_counter}")
      expect(page).to have_content("likes: #{post.likes_counter}")
      expect(page).to have_content(post.text)
      expect(page).to have_content(comment1.author.name)
      expect(page).to have_content(comment1.text)
      expect(page).to have_content(comment2.author.name)
      expect(page).to have_content(comment2.text)
    end
  end
end

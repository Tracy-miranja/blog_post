require 'rails_helper'
RSpec.describe 'Posts', type: :system do
  before do
    driven_by(:rack_test)
  end
  scenario "displays user profile picture, username, number of posts, post's title, post's body, comments count, likes" do
    user = User.create(name: 'Anna', photo: 'https://randomuser.me/api/portraits/women/67.jpg', bio: 'Project manager')
    Post.create(author: user, title: 'First post', text: 'First post', comments_counter: 2, likes_counter: 2)
    visit user_posts_path(user)
    profile_picture = find('img')
    expect(profile_picture).to be_visible
    expect(profile_picture['src']).to eq user.photo
    expect(page).to have_content('Anna')
    expect(page).to have_content('First post')
    expect(page).to have_content('Comments: 2')
    expect(page).to have_content('Likes: 2')
  end
end

require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario "displays the username, profile picture, and number of posts for each user" do
    user = User.create(name: 'Lilly', posts_counter: 3, photo: 'https://randomuser.me/api/portraits/women/70.jpg',
      bio: 'Teacher from Poland.')

    visit user_path(user)

    profile_picture = find('img')

    expect(page).to have_content(user.name)
    expect(profile_picture).to be_visible
    expect(profile_picture['src']).to eq user.photo
    expect(page).to have_content(3)
  end

  scenario 'redirects to user show page when clicking on a user' do
    user = User.create(name: 'Lilly', posts_counter: 4, photo: 'https://randomuser.me/api/portraits/women/70.jpg',
                       bio: 'Teacher from Poland.')
    user_show_page_url = "#{Capybara.app_host}/users/#{user.id}"

    visit users_path(user)

    within('.user-details') do
      click_link 'Lilly'
    end

    expect(page).to have_current_path(user_show_page_url)
  end

  describe 'User show page' do
    scenario 'displays the user profile picture, username, number of posts, bio, and first 3 posts' do
      user = User.create(name: 'Lilly', posts_counter: 3,  photo: 'https://randomuser.me/api/portraits/women/70.jpg',
                         bio: 'Teacher from Poland.' )

      first_post = Post.create(author: user, title: 'Post 1', text: 'This is my first post')
      second_post = Post.create(author: user, title: 'Post 2', text: 'This is my second post')
      third_post = Post.create(author: user, title: 'Post 3', text: 'This is my third post')

      visit user_path(user)

      profile_picture = find('img')

      expect(profile_picture).to be_visible
      expect(profile_picture['src']).to eq user.photo
      expect(page).to have_content(user.name)
      expect(page).to have_content(user.posts_counter)
      expect(page).to have_content(user.bio)

      expect(page).to have_content(first_post.title)
      expect(page).to have_content(second_post.title)
      expect(page).to have_content(third_post.title)
      expect(page).to have_content(first_post.text)
      expect(page).to have_content(second_post.text)
      expect(page).to have_content(third_post.text)
    end

    scenario 'redirects to post show page when clicking on see all posts' do
      user = User.create(name: 'Lilly', posts_counter: 4, photo: 'https://randomuser.me/api/portraits/women/70.jpg',
                       bio: 'Teacher from Poland.')
      post = Post.create(title: 'new post', text: 'hello world', author: user)
      post_show_page_url = "#{Capybara.app_host}/users/#{user.id}/posts/#{post.id}"

      visit user_path(user)
      click_link post.title

      expect(page).to have_current_path(post_show_page_url)
    end

    scenario 'redirects to the user\'s posts index page when the "See all posts" button is clicked' do
        user = User.create(name: 'Lilly', posts_counter: 4, photo: 'https://randomuser.me/api/portraits/women/70.jpg',
        bio: 'Teacher from Poland.')
        post = Post.create(title: 'new post', text: 'hello world', author: user)
        posts_index_page_url = "#{Capybara.app_host}/users/#{user.id}/posts"

        visit user_path(user)
        click_link 'See All Posts'

        expect(page).to have_current_path(posts_index_page_url)
    end
  end

end


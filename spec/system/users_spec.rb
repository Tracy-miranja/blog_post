require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario 'displays the username, profile picture, and number of posts for each user' do
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
    user = User.create(name: 'joy', posts_counter: 4, photo: 'https://randomuser.me/api/portraits/women/70.jpg',
                       bio: 'Teacher from Poland.')
    user_show_page_url = "#{Capybara.app_host}/users/#{user.id}"

    visit users_path(user)

    click_link 'joy'

    expect(page).to have_current_path(user_show_page_url)
  end

  scenario 'displays a button to view all of a user\'s posts' do
    user = User.create(name: 'Lilly', posts_counter: 4, photo: 'https://randomuser.me/api/portraits/women/70.jpg',
                       bio: 'Teacher from Poland.')

    visit user_path(user)

    expect(page).to have_link('See All Posts')
  end
end

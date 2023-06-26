require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario "displays the username, profile picture, and number of posts for each user" do
    user = User.create(name: 'Lilly', posts_counter: 3)

    visit user_path(user)
    
    expect(page).to have_content('Lilly')
   
    expect(page).to have_content(3)
  end
  
  scenario 'redirects to user show page when clicking on a user' do 
    user = User.create(name: 'Lilly', posts_counter: 2, photo: 'https://randomuser.me/api/portraits/women/70.jpg',
                       bio: 'Teacher from Poland.')
  
    visit users_path(user)
  
    expect(page).to have_content('Lilly')
  
    within('.user-details') do
      click_link 'Lilly'
    end
  
    expect(page).to have_content('Lilly')
  end
  
end


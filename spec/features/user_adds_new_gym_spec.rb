require 'rails_helper'

feature 'user signs in', %Q{
  As a user
  I want to be able to create a gym
  So that I can start advertising it
} do

  scenario 'user adds a new gym' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link 'Add Gym'

    expect(page).to have_content "Add New Gym"

    fill_in 'Gym Name', with: "Globo Gym"
    fill_in 'Street Address', with: "33 Harrison Ave"
    fill_in 'State', with: "MA"
    fill_in 'Zipcode', with: "02116"
    fill_in 'Phone Number', with: "781-799-9434"

    click_button 'Submit'
    redirect_to "/gyms"
    expect(page).to have_content "Globo Gym"
  end

end

require 'rails_helper'

feature 'user signs in', %Q{
As a user
I want to be able to edit a gym's details
So that I can update phone numbers if they change
} do

  scenario 'user adds new gym and views gym details' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    click_link 'Add Gym'

    fill_in 'Gym Name', with: "Globo Gym"
    fill_in 'Street Address', with: "33 Harrison Ave"
    fill_in 'State', with: "MA"
    fill_in 'Zipcode', with: "02116"
    fill_in 'Phone Number', with: "781-799-9434"

    click_button 'Submit'

    visit '/gyms'
    click_link 'Globo Gym'
    click_link 'Edit Info'

    fill_in 'Phone Number', with: "617-851-8077"
    click_button 'Update'
    save_and_open_page
    binding.pry

    expect(page).to have_content "617-851-8077"
  end

end

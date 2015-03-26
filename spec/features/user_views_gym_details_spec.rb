require 'rails_helper'

feature 'user signs in', %Q{
As a visitor
I want to view a specific gyms details
So that I can learn more about it
} do

  scenario 'user adds new gym and views gym details' do
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

    visit '/gyms'
    expect(page).to have_content 'Globo Gym'
    click_link 'Globo Gym'

    expect(page).to have_content "Globo Gym"
    expect(page).to have_content "33 Harrison Ave"
    expect(page).to have_content "MA"
    expect(page).to have_content "02116"
  end
end

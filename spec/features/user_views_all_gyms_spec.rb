require 'rails_helper'

feature 'user signs in', %Q{
As a visitor
I want to view a list of all gyms
So that I can see which one looks like a good fit.
} do
  scenario 'user adds two new gyms and views them in list' do
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

    visit '/gyms/new'

    fill_in 'Gym Name', with: "Pyah Gym 2"
    fill_in 'Street Address', with: "332 Harrison Ave"
    fill_in 'State', with: "MA"
    fill_in 'Zipcode', with: "02116"
    fill_in 'Phone Number', with: "781-799-9434"

    click_button 'Submit'
    visit '/gyms'

    expect(page).to have_content "Globo Gym"
    expect(page).to have_content "Pyah Gym 2"
  end

end

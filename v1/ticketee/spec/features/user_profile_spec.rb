require 'spec_helper'

feature "Profile page" do
  scenario "viewing" do
    user = FactoryGirl.create(:user)

    visit user_path(user)

    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
  end
end

feature "Editing Users" do
  scenario "Updating a project" do
    user = FactoryGirl.create(:user)

    visit user_path(user)
    click_link "Edit Profile"

    fill_in "Username", with: "new_username"
    click_button "Update profile"

    expect(page).to have_content("User has been updated.")
  end
end

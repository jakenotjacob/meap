require 'spec_helper'

feature "Editing Projects" do
  before do
    FactoryGirl.create(:project, name: "TextMate2")

    visit "/"
    click_link "TextMate2"
    click_link "Edit Project"
  end

  scenario "Updating a project" do
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content("Project has been updated.")
  end
end

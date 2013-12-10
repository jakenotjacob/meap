require 'spec_helper'

feature "Assigning permissions" do
  let!(:admin) { FactoryGirl.create(:admin_user) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:project) { FactoryGirl.create(:project) }
  let!(:ticket) { FactoryGirl.create(:ticket, project: project, user: user) }

  before do
    sign_in_as!(admin)

    click_link "Admin"
    click_link "Users"
    click_link user.email
    click_link "Permissions"

    State.create!(name: "Open")
  end

  scenario "Viewing a project" do
    check_permission_box("view", project)

    click_button "Update"
    click_link "Sign out"

    sign_in_as!(user)
    expect(page).to have_content(project.name)
  end

  scenario "Creating tickets for a project" do
    check_permission_box "view", project
    check_permission_box "create_tickets", project
    click_button "Update"
    click_link "Sign out"

    sign_in_as!(user)
    click_link project.name
    click_link "New Ticket"
    fill_in "Title", with: "Shiny!"
    fill_in "Description", with: "Make it so!"
    click_button "Create"

    expect(page).to have_content("Ticket has been created.")
  end

  scenario "Updating a ticket for a project" do
    check_permission_box "view", project
    check_permission_box "create_tickets", project
    click_button "Update"
    click_link "Sign out"

    sign_in_as!(user)
    click_link project.name
    click_link ticket.title
    click_link "Edit Ticket"
    fill_in "Title", with: "Really shiny!"
    click_button "Update Ticket"

    expect(page).to have_content("Ticket has been updated.")
  end

  scenario "Deleting a ticket for a project" do
    check_permission_box "view", project
    check_permission_box "delete_tickets", project

    click_button "Update"
    click_link "Sign out"

    sign_in_as!(user)
    click_link project.name
    click_link ticket.title
    click_link "Delete Ticket"

    expect(page).to have_content("Ticket has been deleted.")
  end

  scenario "Changing states for a ticket" do
    check_permission_box "view", project
    check_permission_box "change_states", project
    click_button "Update"
    click_link "Sign out"

    sign_in_as!(user)
    click_link project.name
    click_link ticket.title
    fill_in "Text", with: "Opening this ticket."
    select "Open", from: "State"
    click_button "Create Comment"
    page.should have_content("Comment has been created.")
    page.should have_selector('.state', text: 'Open')
    #within("#ticket .state") do
    #  page.should have_content("Open")
    #end
  end
  scenario "A user without permission cannot change the state" do
    sign_in_as!(user)
    click_link project.name
    click_link ticket.title
    #find_element = lambda { find("#comment_state_id") }
    #message = "Expected not to see #comment_state_id, but did."
    #find_element.should raise_error(Capybara::ElementNotFound, message)
    page.should_not have_selector('.state')
  end

end


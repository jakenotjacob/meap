require 'spec_helper'

feature "Viewing tickets" do
  before do
    user = FactoryGirl.create(:user)
    project = FactoryGirl.create(:project,
                                name: "TextMate 2",
                                description: "Standards compliance.")
    ticket = FactoryGirl.create(:ticket, project: project, 
                       title: "Make it shiny!", 
                       description: "Gradients! Starbursts! Oh my!")
    ticket.update(user: user)

    define_permission!(user, "view", project)
    visit '/'
    sign_in_as!(user)
  end

  #=>Scenarios below
  scenario "Viewing tickets for a given project" do
    click_link "TextMate 2"

    expect(page).to have_content("Make it shiny!")
    expect(page).to_not have_content ("Standards compliance")

    click_link "Make it shiny!"
    #CSS selector ("#ELE_ID ELE_TYPE")
    within("#ticket h2") do
      expect(page).to have_content("Make it shiny!")
    end
    expect(page).to have_content("Gradients! Starbursts! Oh my!")
  end

end

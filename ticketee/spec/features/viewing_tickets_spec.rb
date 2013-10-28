require 'spec_helper'

feature "Viewing tickets" do
  before do
    textmate_2 = FactoryGirl.create(:project,  name: "TextMate 2")
    internet_explorer = FactoryGirl.create(:project, name: "Internet Explorer")

    FactoryGirl.create(:ticket, title: "Standards compliance", description: "Isn't a joke.")
    visit '/'
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

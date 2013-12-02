require 'spec_helper'

feature "Seed Data" do
  scenario "The basics" do
    #Load bin/rake task code prior to running
    load Rails.root + "db/seeds.rb"
    user = User.where(email: "admin@example.com").first!
    project = Project.where(name: "Ticketee Beta").first!
  end
end

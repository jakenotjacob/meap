require 'spec_helper'

describe TicketsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:ticket) { FactoryGirl.create(:ticket, project: project, user: user) }

  context "with permission to view the project" do
    before do
      sign_in(user)
      define_permission!(user, "view", project)
    end

    def cannot_create_tickets!
      response.should redirect_to(project)
      message = "You cannot create tickets on this project."
      flash[:alert].should eql(message)
    end

    def cannot_update_tickets!
      expect(response).to redirect_to(project)
      expect(flash[:alert]).to eql("You cannot edit tickets on this project.")
    end

    it "cannot begin to create a ticket" do
      get :new, project_id: project.id
      cannot_create_tickets!
    end

    it "cannot create a ticket without permission" do
      post :create, project_id: project.id
      cannot_create_tickets!
    end

    it "cannot edit a ticket without permission" do
      get :edit, { project_id: project.id, id: ticket.id }
      cannot_update_tickets!
    end

    it "cannot update a ticket without permission" do
      #Pass empty hash so params[:ticket] is set
      put :update, { project_id: project.id, id: ticket.id, ticket: {} }
      cannot_update_tickets!
    end
  end

end


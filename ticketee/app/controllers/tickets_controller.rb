class TicketsController < ApplicationController
  before_action :set_project
  def new
    #build instantiates new record for Tickets assocation on Proj obj
    @ticket = @project.tickets.build
  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end
end

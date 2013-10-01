class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new( params[:object] )

    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      # Nadar en la piscina
    end
  end

end

class TicketsController < ApplicationController
  before_action :require_signin! #except: [:show, :index] (temp-disabled)
  before_action :set_project
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  #Restrict Permissions (creating tickets)
  before_action :authorize_create!, only: [:new, :create]
  before_action :authorize_update!, only: [:edit, :update]
  before_action :authorize_delete!, only: :destroy

  def new
    #build instantiates new record for Tickets assocation on Proj obj
    @ticket = @project.tickets.build
    @ticket.assets.build
  end

  def create
    if cannot?(:tag, @project)
      params[:ticket].delete(:tag_names)
    end
    @ticket = @project.tickets.build(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render action: "new"
    end
  end

  def show
    @comment = @ticket.comments.build
    @states = State.all
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket has been updated."

      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."

      render action: "edit"
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket has been deleted."

    redirect_to @project
  end

  def search
    @tickets = @project.tickets.search(params[:search])
    render "projects/show"
  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:title, :description,
                                   { assets_attributes: [:asset] },
                                  :tag_names)
  end

  def authorize_create!
    if !current_user.admin? && cannot?("create tickets".to_sym, @project)
      flash[:alert] = "You cannot create tickets on this project."
      redirect_to @project
    end
  end

  def authorize_update!
    if !current_user.admin? && cannot?("edit tickets".to_sym, @project)
      flash[:alert] = "You cannot edit tickets on this project."
      redirect_to @project
    end
  end

  def authorize_delete!
    if !current_user.admin? && cannot?("delete tickets".to_sym, @project)
      flash[:alert] = "You cannot delete tickets from this project."
      redirect_to @project
    end
  end

end


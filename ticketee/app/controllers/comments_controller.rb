class CommentsController < ApplicationController
  before_filter :require_signin!
  before_filter :find_ticket

  def create
    authorize_change_state!
    @comment = @ticket.comments.build( comment_params )
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to [@ticket.project, @ticket]
    else
      @states = State.all
      flash[:alert] = "Comment has not been created."
      render template: "tickets/show"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text, :state_id)
    end

    def find_ticket
      @ticket = Ticket.find(params[:ticket_id])
    end

    def authorize_change_state!
      if cannot?("change states".to_sym, @ticket.project)
        params[:comment].delete(:state_id)
      end
    end
   
end


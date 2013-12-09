class Comment < ActiveRecord::Base
  before_create :set_previous_state
  after_create :set_ticket_state

  belongs_to :ticket
  belongs_to :user
  belongs_to :state
  #Tell Rails what class holds this record
  belongs_to :previous_state, class_name: "State"
  validates :text, presence: true

  #Setup ticket->project association
  delegate :project, to: :ticket

  private
    def set_ticket_state
      self.ticket.state = self.state
      self.ticket.save!
    end

    def set_previous_state
      self.previous_state = ticket.state
    end
end


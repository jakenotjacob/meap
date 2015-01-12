class Comment < ActiveRecord::Base
  before_create :set_previous_state
  after_create :set_ticket_state, :associate_tags_with_ticket

  belongs_to :ticket
  belongs_to :user
  belongs_to :state
  #Tell Rails what class holds this record
  belongs_to :previous_state, class_name: "State"
  validates :text, presence: true

  #Setup ticket->project association
  delegate :project, to: :ticket

  def tag_names
    @tag_names
  end

  def tag_names=(names)
    @tag_names = names
  end

  private
    def set_ticket_state
      self.ticket.state = self.state
      self.ticket.save!
    end

    def set_previous_state
      self.previous_state = ticket.state
    end

    def associate_tags_with_ticket
      if tag_names
        tags = tag_names.split(" ").map do |name|
          Tag.find_or_create_by(name: name)
        end
        self.ticket.tags += tags
        self.ticket.save
      end
    end
end


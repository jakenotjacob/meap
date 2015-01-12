class State < ActiveRecord::Base
  #belongs_to :comment
  def to_s
    name
  end

  def default!
    #'first' as WHERE returns objects within ActiveRecord::Relation
    current_default_state = State.where(default: true).first
    
    self.default = true
    self.save!

    if current_default_state
      current_default_state.default = false
      current_default_state.save!
    end
  end

end


class State < ActiveRecord::Base
  #belongs_to :comment
  def to_s
    name
  end
end

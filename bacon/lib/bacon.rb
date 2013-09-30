class Bacon
  attr_accessor :expired

  #Am I?
  def self.edible?
    true
  end

  #Are we?
  def edible?
    !expired
  end

  def expired!
    self.expired = true
  end

end

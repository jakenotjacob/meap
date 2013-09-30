require 'bacon'

describe Bacon do

  #Instance-of-Class test
  it "is edible" do
    expect(Bacon.new.edible?).to be_true
  end

  #Class test
  it "am edible" do
    expect(Bacon.edible?).to be_true
  end

  it "expired!" do
    bacon = Bacon.new
    bacon.expired!
    expect(bacon).to_not be_edible
  end

end

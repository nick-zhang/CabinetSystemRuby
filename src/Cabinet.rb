class Cabinet 
  
  def initialize(capacity)
    @capacity = capacity
    @usedBoxes = 0
  end
  
  public
  def hasEmptyBox
    @usedBoxes < @capacity
  end
  
end
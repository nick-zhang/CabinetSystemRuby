require_relative './Ticket'

class Cabinet 
  
  def initialize(capacity)
    @capacity = capacity
    @usedBoxes = 0
    @storedBags = {}
  end
  
  public
  def hasEmptyBox
    @usedBoxes < @capacity
  end
  
  def store bag
    return nil if !hasEmptyBox
    
    ticket =  Ticket.new()
    @storedBags[ticket] = bag
    ticket
  end
  
  def pick ticket
    @storedBags[ticket]
  end
  
end
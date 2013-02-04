require_relative 'Ticket'
require_relative 'CabinetException'

class Cabinet 
  
  def initialize(capacity)
    @capacity = capacity
    @storedBags = {}
  end
  
  public
  def hasEmptyBox
    @storedBags.length < @capacity
  end
  
  def emptyBoxNum
    @capacity - @storedBags.length 
  end
  
  def store bag
    raise CabinetException.new("The ticket is invalid." ) unless hasEmptyBox
    
    ticket =  Ticket.new()
    @storedBags[ticket] = bag
    ticket
  end
  
  def pick ticket
    return nil unless @storedBags.has_key?(ticket)
    
    @storedBags.delete(ticket)
  end
  
end
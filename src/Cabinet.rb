require_relative 'Ticket'
require_relative 'InvalidTicketException'

class Cabinet 
  
  def initialize(capacity)
    @capacity = capacity
    @storedBags = {}
  end
  
  public
  def hasEmptyBox
    @storedBags.length < @capacity
  end
  
  def store bag
    return nil unless hasEmptyBox
    
    ticket =  Ticket.new()
    @storedBags[ticket] = bag
    ticket
  end
  
  def pick ticket
    raise InvalidTicketException.new("The ticket is invalid." ) unless @storedBags.has_key?(ticket)
    
    @storedBags.delete(ticket)
  end
  
end
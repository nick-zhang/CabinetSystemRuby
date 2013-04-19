require_relative 'Ticket'
require_relative 'CabinetException'
require_relative "Reporter"

class Cabinet 
  include Reporter 
  
  def initialize(capacity)
    @capacity = capacity
    @storedBags = {}
  end
  
  public
  def hasEmptyBox?
    @storedBags.length < @capacity
  end
  
  def emptyBoxNum?
    @capacity - @storedBags.length 
  end
  
  def vacancyRate?
    emptyBoxNum? / @capacity
  end
  
  def emptyBoxReport? level
    "#{indent? level}Cabinet#{self.object_id}:#{emptyBoxNum?}\n"
  end
  
  def store bag
    raise CabinetException.new("There is no available box!" ) unless hasEmptyBox?
    
    ticket =  Ticket.new()
    @storedBags[ticket] = bag
    ticket
  end
  
  def pick ticket
    return nil unless @storedBags.has_key?(ticket)
    
    @storedBags.delete(ticket)
  end
  
end
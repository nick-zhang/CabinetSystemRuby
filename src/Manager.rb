require_relative "Reporter"

class Manager
  include Reporter
  
  def initialize(*storables)
    @storables = storables
  end
  
  public
  def hasEmptyBox?
    @storables.each do |storable|
      return true if storable.hasEmptyBox?
    end
    
    false
  end
  
  def emptyBoxReport? level
    report = "#{indent? level}Manager#{self.object_id}\n"
    
    @storables.each do |storable|
      report << "#{storable.emptyBoxReport? level+1}" unless storable.nil?
    end
    report
  end
  
  
  def store bag
    @storables.each do |storable|
      return storable.store(bag) if storable.hasEmptyBox?
    end 
    nil
  end
  
  def pick ticket
    @storables.each do |storable|
      bag = storable.pick(ticket)
      return bag if !bag.nil?
    end
    
    nil
  end
  
end
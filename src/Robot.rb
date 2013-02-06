class Robot
  
  def initialize(*cabinets, cabinetSelector)
    @cabinets = cabinets
    @selector = cabinetSelector
  end
  
  public
  def hasEmptyBox?
    @cabinets.each do |cabinet|
      return true if cabinet.hasEmptyBox?
    end
    
    false
  end
  
  def emptyBoxReport?
    report = "Robot#{self.object_id}\n"
    @cabinets.each do |cabinet|
      report << "  #{cabinet.emptyBoxReport?}\n"
    end
    report
  end
  
  def store bag
    cabinet = @selector.selectCabinet(@cabinets)
    
    return nil if cabinet.nil?
    
    return cabinet.store(bag)
  end
  
  def pick ticket
    @cabinets.each do |cabinet|
      bag = cabinet.pick(ticket)
      return bag if !bag.nil?
    end
    
    nil
    
  end
  
end
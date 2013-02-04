class Robot
  
  def initialize(*cabinets, cabinetSelector)
    @cabinets = cabinets
  end
  
  public
  def hasEmptyBox
    @cabinets.each do |cabinet|
      return true if cabinet.hasEmptyBox
    end
    
    false
  end
  
  def store bag
    cabinet = findCabinetWithEmptyBox
    
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
  
  private 
  def findCabinetWithEmptyBox
    @cabinets.each do |cabinet|
      return cabinet if cabinet.hasEmptyBox
    end
    nil
  end
  
  
end
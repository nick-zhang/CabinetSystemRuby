class Robot
  
  def initialize(cabinets)
    @cabinets = cabinets
  end
  
  public
  def hasEmptyBox
    @cabinets.each do |cabinet|
      return true if cabinet.hasEmptyBox
    end
    
    false
  end
  
end
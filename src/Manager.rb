class Manager
  
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
  
  def store bag
    @storables.each do |storable|
      return storable.store(bag) if storable.hasEmptyBox?
    end 
    nil
  end
  
end
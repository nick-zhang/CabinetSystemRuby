require_relative 'CabinetSelector'

class MostAvailableBoxSelector < CabinetSelector
  def selectCabinet (cabinets)
    return cabinets.max { |c1, c2| c1.emptyBoxNum? <=> c2.emptyBoxNum?} 
  end
  
  def name? 
    "Smart"
  end
end
require_relative 'CabinetSelector'

class MostAvailableBoxSelector < CabinetSelector
  def selectCabinet (cabinets)
    cabinets.sort! { |c1, c2| c2.emptyBoxNum? <=> c1.emptyBoxNum?} 
    return cabinets[0].hasEmptyBox? ? cabinets[0] : nil
  end
  
end
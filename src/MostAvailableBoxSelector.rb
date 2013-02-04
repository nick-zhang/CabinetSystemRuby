require_relative 'CabinetSelector'

class MostAvailableBoxSelector < CabinetSelector
  def selectCabinet (cabinets)
    cabinets.sort! { |c1, c2| c2.emptyBoxNum <=> c1.emptyBoxNum} 
    return nil unless cabinets[0].hasEmptyBox
    cabinets[0]
  end
end
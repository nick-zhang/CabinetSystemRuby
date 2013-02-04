require_relative 'CabinetSelector'

class HighestVacancyRateSelector < CabinetSelector
  def selectCabinet (cabinets)
    cabinets.sort! { |c1, c2| c2.vacancyRate? <=> c1.vacancyRate?} 
    return cabinets[0].hasEmptyBox? ? cabinets[0] : nil
  end
  
end
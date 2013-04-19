require_relative 'CabinetSelector'

class HighestVacancyRateSelector < CabinetSelector
  def selectCabinet (cabinets)
    return cabinets.max { |c1, c2| c1.vacancyRate? <=> c2.vacancyRate?}  
  end
  
  def name? 
    "Super"
  end
   
end
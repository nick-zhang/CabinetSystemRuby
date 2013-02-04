require_relative 'CabinetSelector'

class SequentialSelector < CabinetSelector
  def selectCabinet (cabinets)
    cabinets.each do |cabinet|
      return cabinet if cabinet.hasEmptyBox?
    end
    nil
  end
end
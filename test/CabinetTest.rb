require 'minitest/autorun'
require_relative '../src/Cabinet'
require_relative '../src/Bag'
require_relative '../src/CabinetException'
require_relative '../src/Ticket'

class CabinetTest < MiniTest::Unit::TestCase
  def setup
    @cabinet = Cabinet.new(1)
  end
  
  def testShouldHaveEmptyBoxWhenHasCapacity
    assert @cabinet.hasEmptyBox?
  end
  
  def testShouldNotHaveEmptyBoxWhenNoCapacity
    cabinet = Cabinet.new(0)
    assert !cabinet.hasEmptyBox?
  end
  
  def testShouldReturnEmptyBoxNumber
    assert_equal 1, @cabinet.emptyBoxNum?
  end
  
  def testShouldStoreBagWhenThereIsBoxAvailable
    ticket = @cabinet.store(Bag.new())
    refute_nil ticket
  end
  
  def testShouldReturnBoxVacancyRate
    assert_equal 1, @cabinet.vacancyRate?
    
    @cabinet.store(Bag.new())
    assert_equal 0, @cabinet.vacancyRate?
  end
  
  def testShouldThrowExceptionWhenThereIsNoBoxAvailableToStore
    assert_raises(CabinetException){
      cabinet = Cabinet.new(0)
      ticket = cabinet.store(Bag.new())
    }
  end
  
  def testShouldPickBagCorrectlyWhenStoredSuccessfully
    bag = Bag.new()
    ticket = @cabinet.store(bag)
    refute_nil ticket
    pickedBag = @cabinet.pick(ticket)
    assert_equal bag, pickedBag 
  end
  
  def testShouldReturnNilGivenUsedTicket
    bag = Bag.new()
    ticket = @cabinet.store(bag)
    pickedBag = @cabinet.pick(ticket)
    bag = @cabinet.pick(Ticket.new())  
    assert_nil bag 
  end
  
  def testShouldThrowExceptionGivenNotExistedTicket
    bag = @cabinet.pick(Ticket.new())  
    assert_nil bag     
  end
  
  def testShouldReturnFormattedEmptyBoxReportString
    emptyBoxReport = @cabinet.emptyBoxReport?
    assert_equal "Cabinet#{@cabinet.object_id}:1", emptyBoxReport
  end
  
end
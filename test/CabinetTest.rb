require 'minitest/autorun'
require_relative '../src/Cabinet'
require_relative '../src/Bag'
require_relative '../src/CabinetException'
require_relative '../src/Ticket'

class CabinetTest < MiniTest::Unit::TestCase
  def testShouldHaveEmptyBoxWhenHasCapacity
    cabinet = Cabinet.new(1)
    assert cabinet.hasEmptyBox?
  end
  
  def testShouldNotHaveEmptyBoxWhenNoCapacity
    cabinet = Cabinet.new(0)
    assert !cabinet.hasEmptyBox?
  end
  
  def testShouldReturnEmptyBoxNumber
    cabinet = Cabinet.new(1)
    assert_equal 1, cabinet.emptyBoxNum?
  end
  
  def testShouldStoreBagWhenThereIsBoxAvailable
    cabinet = Cabinet.new(1)
    ticket = cabinet.store(Bag.new())
    refute_nil ticket
  end
  
  def testShouldReturnBoxVacancyRate
    cabinet = Cabinet.new(1)
    assert_equal 1, cabinet.vacancyRate?
    
    cabinet.store(Bag.new())
    assert_equal 0, cabinet.vacancyRate?
  end
  
  def testShouldThrowExceptionWhenThereIsNoBoxAvailableToStore
    assert_raises(CabinetException){
      cabinet = Cabinet.new(0)
      ticket = cabinet.store(Bag.new())
    }
  end
  
  def testShouldPickBagCorrectlyWhenStoredSuccessfully
    cabinet = Cabinet.new(1)
    bag = Bag.new()
    ticket = cabinet.store(bag)
    refute_nil ticket
    pickedBag = cabinet.pick(ticket)
    assert_equal bag, pickedBag 
  end
  
  def testShouldReturnNilGivenUsedTicket
    cabinet = Cabinet.new(1)
    bag = Bag.new()
    ticket = cabinet.store(bag)
    pickedBag = cabinet.pick(ticket)
    bag = cabinet.pick(Ticket.new())  
    assert_nil bag 
  end
  
  def testShouldThrowExceptionGivenNotExistedTicket
    cabinet = Cabinet.new(1)
    bag = cabinet.pick(Ticket.new())  
    assert_nil bag     
  end
  
end
require 'minitest/autorun'
require '../src/Cabinet'
require '../src/Bag'

class CabinetTest < MiniTest::Unit::TestCase
  def testShouldHaveEmptyBoxWhenHasCapacity
    cabinet = Cabinet.new(1)
    assert cabinet.hasEmptyBox
  end
  
  def testShouldNotHaveEmptyBoxWhenNoCapacity
    cabinet = Cabinet.new(0)
    assert !cabinet.hasEmptyBox
  end
  
  def testShouldStoreBagWhenThereIsBoxAvailable
    cabinet = Cabinet.new(1)
    ticket = cabinet.store(Bag.new())
    refute_nil ticket
  end
  
  def testShouldNotStoreBagWhenThereIsNoBoxAvailable
    cabinet = Cabinet.new(0)
    ticket = cabinet.store(Bag.new())
    assert_nil ticket
  end
  
  def testShouldPickBagCorrectlyWhenStoredSuccessfully
    cabinet = Cabinet.new(1)
    bag = Bag.new()
    ticket = cabinet.store(bag)
    refute_nil ticket
    pickedBag = cabinet.pick(ticket)
    assert_equal bag, pickedBag 
  end
  
end
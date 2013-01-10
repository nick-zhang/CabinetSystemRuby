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
end
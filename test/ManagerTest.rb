require 'minitest/autorun'
require_relative '../src/Robot'
require_relative '../src/Manager'
require_relative '../src/Cabinet'
require_relative '../src/Bag'
require_relative '../src/SequentialSelector'

class ManagerTest < MiniTest::Unit::TestCase
  def setup
    @cabinetSelector = SequentialSelector.new
    @cabinet = Cabinet.new(1)
    @robot = Robot.new(@cabinet, @cabinetSelector)
  end
  
  def testShouldHaveEmptyBoxWhenHasCapacity
    cabinet1 = Cabinet.new(1)
    cabinet2 = Cabinet.new(0)
    robot = Robot.new(cabinet2, @cabinetSelector)
      
    manager = Manager.new(cabinet1, robot)
    assert manager.hasEmptyBox?
  end
  
  def testShouldNotHaveEmptyBoxWhenNoCapacity
    cabinet = Cabinet.new(0)
    robot = Robot.new(cabinet, @cabinetSelector)

    manager = Manager.new(cabinet, robot)
    assert !manager.hasEmptyBox?
  end
  
  def testShouldStoreBagWhenThereIsBoxAvailable
    manager = Manager.new(@cabinet, @robot)
    
    ticket = manager.store(Bag.new())
    refute_nil ticket
  end
    
  def testShouldNotStoreBagWhenThereIsNoBoxAvailable
    cabinet = Cabinet.new(0)
    robot = Robot.new(cabinet, @cabinetSelector)
    
    manager = Manager.new(cabinet, robot)
    ticket = manager.store(Bag.new())
    assert_nil ticket
  end
    
  def testShouldPickBagCorrectlyWhenStoredSuccessfully
    manager = Manager.new(@cabinet, @robot)

    bag = Bag.new()
    ticket = manager.store(bag)
    pickedBag = manager.pick(ticket)
    assert_equal bag, pickedBag 
  end
      
  def testShouldReturnNilGivenUsedTicket
    manager = Manager.new(@cabinet, @robot)

    bag = Bag.new()
    ticket = manager.store(bag)
    pickedBag = manager.pick(ticket)
    bag = manager.pick(Ticket.new())  
    assert_nil bag
  end
       
end
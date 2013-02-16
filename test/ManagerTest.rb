require 'minitest/autorun'
require_relative '../src/Robot'
require_relative '../src/Manager'
require_relative '../src/Cabinet'
require_relative '../src/Bag'
require_relative '../src/SequentialSelector'
require_relative '../src/MostAvailableBoxSelector'

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
      
  def testShouldReturnNilGivenUsedTicketToPickBag
    manager = Manager.new(@cabinet, @robot)

    bag = Bag.new()
    ticket = manager.store(bag)
    pickedBag = manager.pick(ticket)
    bag = manager.pick(ticket)  
    assert_nil bag
  end
    
  def testShouldReturnNilGivenNotExistedTicketToPickBag
    manager = Manager.new(@cabinet, @robot)
    bag = manager.pick(Ticket.new())
    assert_nil bag     
  end

  def testShouldReturnFormattedEmptyBoxReportStringGivenMultipleCaibnetAndRobots
    cabinet = Cabinet.new(3)
    
    cabinet1 = Cabinet.new(1)
    cabinet2 = Cabinet.new(2)
    cabinetSelector = MostAvailableBoxSelector.new
    robot = Robot.new(cabinet1, cabinet2, cabinetSelector)
     
    manager = Manager.new(cabinet, robot)

    emptyBoxReport = manager.emptyBoxReport? 0
    
    assert_equal "Manager#{manager.object_id}\n"+
                 "  Cabinet#{cabinet.object_id}:3\n"+  
                 "  SmartRobot#{robot.object_id}\n"+
                 "    Cabinet#{cabinet1.object_id}:1\n"+
                 "    Cabinet#{cabinet2.object_id}:2\n", emptyBoxReport
   end
end
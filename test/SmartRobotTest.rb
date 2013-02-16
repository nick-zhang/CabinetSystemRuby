require 'minitest/autorun'
require_relative '../src/Robot'
require_relative '../src/Cabinet'
require_relative '../src/Bag'
require_relative '../src/MostAvailableBoxSelector'

class SmartRobotTest < MiniTest::Unit::TestCase
  def setup
    @cabinetSelector = MostAvailableBoxSelector.new
  end
  
  def testShouldHaveEmptyBoxWhenHasCapacity
    cabinet = Cabinet.new(1)
    robot = Robot.new(cabinet, @cabinetSelector)
    assert robot.hasEmptyBox?
  end

  def testShouldNotHaveEmptyBoxWhenNoCapacity
    cabinet = Cabinet.new(0)
    robot = Robot.new(cabinet, @cabinetSelector)
    assert !robot.hasEmptyBox?
  end
    
  def testShouldStoreBagWhenThereIsBoxAvailable
    cabinet = Cabinet.new(1)
    robot = Robot.new(cabinet, @cabinetSelector)
    ticket = robot.store(Bag.new())
    refute_nil ticket
  end
    
  def testShouldStoreBagInCabinetWithMostAvailableBoxes
    cabinet1 = Cabinet.new(1)
    cabinet2 = Cabinet.new(2)
    robot = Robot.new(cabinet1, cabinet2, @cabinetSelector)
    ticket = robot.store(Bag.new())
    refute_nil ticket
    assert_equal 1, cabinet1.emptyBoxNum?
    assert_equal 1, cabinet2.emptyBoxNum?
  end  
    
  def testShouldNotStoreBagWhenThereIsNoBoxAvailable
     cabinet = Cabinet.new(0)
     robot = Robot.new(cabinet, @cabinetSelector)
     ticket = robot.store(Bag.new())
     assert_nil ticket
  end
   
   def testShouldPickBagCorrectlyWhenStoredSuccessfully
     cabinet = Cabinet.new(1)
     robot = Robot.new(cabinet, @cabinetSelector)
     bag = Bag.new()
     ticket = robot.store(bag)
     pickedBag = robot.pick(ticket)
     assert_equal bag, pickedBag 
   end
       
   def testShouldReturnNilGivenUsedTicketToPickBag
     cabinet = Cabinet.new(1)
     robot = Robot.new(cabinet, @cabinetSelector)
     bag = Bag.new()
     ticket = robot.store(bag)
     pickedBag = robot.pick(ticket)
     bag = robot.pick(Ticket.new())  
     assert_nil bag
   end
     
   def testShouldReturnNilGivenNotExistedTicketToPickBag
     cabinet = Cabinet.new(1)
     robot = Robot.new(cabinet, @cabinetSelector)
     bag = robot.pick(Ticket.new())
     assert_nil bag     
   end
   
   def testShouldReturnFormattedEmptyBoxReportStringGivenMultipleCaibnets
     cabinet1 = Cabinet.new(1)
     cabinet2 = Cabinet.new(2)
     robot = Robot.new(cabinet1, cabinet2, @cabinetSelector)
     emptyBoxReport = robot.emptyBoxReport? 0
     assert_equal "SmartRobot#{robot.object_id}\n"+
                   "  Cabinet#{cabinet1.object_id}:1\n" +
                   "  Cabinet#{cabinet2.object_id}:2\n", emptyBoxReport
   end
 
end
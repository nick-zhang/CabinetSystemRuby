require 'minitest/autorun'
require '../src/Robot'
require '../src/Cabinet'
require '../src/Bag'
require '../src/HighestVacancyRateSelector'

class SuperRobotTest < MiniTest::Unit::TestCase
  def setup
    @cabinetSelector = HighestVacancyRateSelector.new
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
    
  def testShouldStoreBagInCabinetHasHighestVacancyRate
    cabinet1 = Cabinet.new(2)
    cabinet2 = Cabinet.new(1)
    cabinet1.store(Bag.new())
    
    robot = Robot.new(cabinet1, cabinet2, @cabinetSelector)
    ticket = robot.store(Bag.new())
    refute_nil ticket
    assert_equal 1, cabinet1.emptyBoxNum?
    assert_equal 0, cabinet2.emptyBoxNum?
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
       
   def testShouldReturnNilGivenUsedTicket
     cabinet = Cabinet.new(1)
     robot = Robot.new(cabinet, @cabinetSelector)
     bag = Bag.new()
     ticket = robot.store(bag)
     pickedBag = robot.pick(ticket)
     bag = robot.pick(Ticket.new())  
     assert_nil bag
   end
     
   def testShouldThrowExceptionGivenNotExistedTicket
     cabinet = Cabinet.new(1)
     robot = Robot.new(cabinet, @cabinetSelector)
     bag = robot.pick(Ticket.new())
     assert_nil bag     
   end
    
end
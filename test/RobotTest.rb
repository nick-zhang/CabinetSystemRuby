require 'minitest/autorun'
require_relative '../src/Robot'
require_relative '../src/Cabinet'
require_relative '../src/Bag'
require_relative '../src/SequentialSelector'

class RobotTest < MiniTest::Unit::TestCase
  def setup
    @cabinetSelector = SequentialSelector.new
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
  
  def testShouldReturnFormattedEmptyBoxReportStringGivenMultipleCaibnets
    cabinet1 = Cabinet.new(1)
    cabinet2 = Cabinet.new(2)
    robot = Robot.new(cabinet1, cabinet2, @cabinetSelector)
    emptyBoxReport = robot.emptyBoxReport?
    assert_equal "Robot#{robot.object_id}\n"+
                  "  Cabinet#{cabinet1.object_id}:1\n" +
                  "  Cabinet#{cabinet2.object_id}:2\n", emptyBoxReport
  end
  
  def testShouldReturnRobotFormattedEmptyBoxReportGivenNoCaibnet 
    robot = Robot.new(nil, @cabinetSelector)
    emptyBoxReport = robot.emptyBoxReport?
    assert_equal "Robot#{robot.object_id}\n", emptyBoxReport
  end
    
end
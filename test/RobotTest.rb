require 'minitest/autorun'
require '../src/Robot'
require '../src/Cabinet'
require '../src/Bag'

class RobotTest < MiniTest::Unit::TestCase
  def testShouldHaveEmptyBoxWhenHasCapacity
    cabinet = Cabinet.new(1)
    cabinets = [cabinet]
    robot = Robot.new(cabinets)
    assert robot.hasEmptyBox
  end

  def testShouldNotHaveEmptyBoxWhenNoCapacity
    cabinet = Cabinet.new(0)
    cabinets = [cabinet]
    robot = Robot.new(cabinets)
    assert !robot.hasEmptyBox
  end
  
  def testShouldStoreBagWhenThereIsBoxAvailable
    cabinet = Cabinet.new(1)
    cabinets = [cabinet]
    robot = Robot.new(cabinets)
    ticket = robot.store(Bag.new())
    refute_nil ticket
  end
  
  def testShouldNotStoreBagWhenThereIsNoBoxAvailable
    cabinet = Cabinet.new(0)
    cabinets = [cabinet]
    robot = Robot.new(cabinets)
    ticket = robot.store(Bag.new())
    assert_nil ticket
  end
  
  def testShouldPickBagCorrectlyWhenStoredSuccessfully
    cabinet = Cabinet.new(1)
    cabinets = [cabinet]
    robot = Robot.new(cabinets)
    bag = Bag.new()
    ticket = robot.store(bag)
    pickedBag = robot.pick(ticket)
    assert_equal bag, pickedBag 
  end
    
end
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
    
end
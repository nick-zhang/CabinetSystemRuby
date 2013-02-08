require 'minitest/autorun'
require_relative '../src/Robot'
require_relative '../src/Manager'
require_relative '../src/Cabinet'
require_relative '../src/Bag'
require_relative '../src/SequentialSelector'

class ManagerTest < MiniTest::Unit::TestCase
  def setup
    @cabinetSelector = SequentialSelector.new
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
  
     
end
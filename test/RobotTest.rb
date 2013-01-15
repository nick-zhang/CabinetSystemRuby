require 'minitest/autorun'
require '../src/Robot'
require '../src/Cabinet'

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
    
end
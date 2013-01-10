require 'minitest/autorun'
require '../src/Cabinet'

class CabinetTest < MiniTest::Unit::TestCase
  def testShouldHaveEmptyBoxWhenHasCapacity
    cabinet = Cabinet.new(1)
    assert cabinet.hasEmptyBox
  end
  
  def testShouldNotHaveEmptyBoxWhenNoCapacity
    cabinet = Cabinet.new(0)
    assert !cabinet.hasEmptyBox
  end
end
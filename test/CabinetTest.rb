require 'minitest/autorun'
require '../src/Cabinet'

class CabinetTest < MiniTest::Unit::TestCase
  def testShouldTellWetherHasEmptyBox
    cabinet = Cabinet.new(1)
    assert cabinet.hasEmptyBox
  end
end
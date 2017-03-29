require 'test_helper'

class EnumerableObjectSpaceTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::EnumerableObjectSpace::VERSION
  end

  def test_it_does_something_useful
    modules_old_way = []
    ObjectSpace.each_object(Module){|o| modules_old_way << o}
    modules_new_way = ObjectSpace.find_all{|o| o.is_a? Module}
    assert_equal modules_old_way, modules_new_way
  end
end

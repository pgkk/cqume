require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  
  test "find menu" do
    assert_no_difference Type.find_menu.size>0
  end
end

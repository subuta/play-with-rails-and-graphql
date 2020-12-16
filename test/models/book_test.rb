require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "should have author" do
    assert_equal 'Griselda Spencer', Book.find(1).author.username
  end
end

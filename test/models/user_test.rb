require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should have books" do
    assert_equal 1, User.find(1).books.size
  end

  test "should have posts" do
    assert_equal 0, User.find(1).posts.size
  end

  test "should have reviews" do
    assert_equal 2, User.find(1).reviews.size
  end
end

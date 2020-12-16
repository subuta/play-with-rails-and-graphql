require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "should have author" do
    assert_equal 'Mrs. Zella Leuschke', Post.find(1).author.username
  end
end

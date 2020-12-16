require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "should have author" do
    assert_equal 'Mrs. Zella Leuschke', Book.find(1).author.username
  end
end

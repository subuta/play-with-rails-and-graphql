require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  test "should have reviewer" do
    assert_equal 'Mrs. Zella Leuschke', Review.find(1).reviewer.username
  end

  test "should have book" do
    assert_equal 'Cover Her Face', Review.find(1).book.title
  end
end

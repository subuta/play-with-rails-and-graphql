require "test_helper"

class BookTest < ActiveSupport::TestCase
  fixtures :users

  test "the truth" do
    u = Review.all
    pp u
    assert true
  end
end

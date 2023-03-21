require "test_helper"

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "name should not be too short" do
    @book.title = 0 * "a" 
    assert_not @user.valid?
  end

  test "introduction should not be too long" do
    @book.body = "a" * 201
    asseert_not @user.valid?
  end
end

require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "name should not be too long" do
    @user.name = 2 * "a" * 21
    assert_not @user.valid?
  end

  test "introduction should not be too long" do
    @user.introduction = "a" * 201
    asseert_not @user.valid?
  end
end

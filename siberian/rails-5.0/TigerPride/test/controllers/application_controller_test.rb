require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test "should get join" do
    get application_join_url
    assert_response :success
  end

  test "should get signin" do
    get application_signin_url
    assert_response :success
  end

  test "should get signout" do
    get application_signout_url
    assert_response :success
  end

  test "should get leave" do
    get application_leave_url
    assert_response :success
  end

end

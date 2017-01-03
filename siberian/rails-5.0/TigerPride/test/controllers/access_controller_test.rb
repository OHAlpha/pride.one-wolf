require 'test_helper'

class AccessControllerTest < ActionDispatch::IntegrationTest
  test "should get name_exists" do
    get access_name_exists_url
    assert_response :success
  end

  test "should get email_exists" do
    get access_email_exists_url
    assert_response :success
  end

  test "should get generate_salt" do
    get access_generate_salt_url
    assert_response :success
  end

  test "should get register" do
    get access_register_url
    assert_response :success
  end

  test "should get primary_name" do
    get access_primary_name_url
    assert_response :success
  end

  test "should get client_salt" do
    get access_client_salt_url
    assert_response :success
  end

  test "should get login" do
    get access_login_url
    assert_response :success
  end

  test "should get logout" do
    get access_logout_url
    assert_response :success
  end

  test "should get deregister" do
    get access_deregister_url
    assert_response :success
  end

end

require "test_helper"

class UserProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_profiles_index_url
    assert_response :success
  end

  test "should get show" do
    get user_profiles_show_url
    assert_response :success
  end

  test "should get create" do
    get user_profiles_create_url
    assert_response :success
  end

  test "should get update" do
    get user_profiles_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_profiles_destroy_url
    assert_response :success
  end
end

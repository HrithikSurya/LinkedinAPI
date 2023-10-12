require "test_helper"

class JobProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_profiles_index_url
    assert_response :success
  end

  test "should get show" do
    get job_profiles_show_url
    assert_response :success
  end

  test "should get create" do
    get job_profiles_create_url
    assert_response :success
  end

  test "should get update" do
    get job_profiles_update_url
    assert_response :success
  end

  test "should get destroy" do
    get job_profiles_destroy_url
    assert_response :success
  end
end

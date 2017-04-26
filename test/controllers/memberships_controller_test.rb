require 'test_helper'

class MembershipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get memberships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get memberships_destroy_url
    assert_response :success
  end

end

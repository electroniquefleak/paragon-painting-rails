require "test_helper"

class ToolsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tools_new_url
    assert_response :success
  end

  test "should get create" do
    get tools_create_url
    assert_response :success
  end

  test "should get destroy" do
    get tools_destroy_url
    assert_response :success
  end
end

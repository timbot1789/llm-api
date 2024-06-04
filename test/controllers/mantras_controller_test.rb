require "test_helper"

class MantrasControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get mantras_show_url
    assert_response :success
  end
end

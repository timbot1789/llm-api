require "test_helper"

class PrayersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get prayers_show_url
    assert_response :success
  end
end

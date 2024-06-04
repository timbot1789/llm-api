require "test_helper"

class PrayerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get prayer_show_url
    assert_response :success
  end
end

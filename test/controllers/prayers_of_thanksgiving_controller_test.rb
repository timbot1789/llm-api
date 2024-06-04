require "test_helper"

class PrayersOfThanksgivingControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get prayers_of_thanksgiving_show_url
    assert_response :success
  end
end

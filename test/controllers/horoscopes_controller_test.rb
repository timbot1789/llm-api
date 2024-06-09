require "test_helper"

class HoroscopesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get horoscopes_show_url
    assert_response :success
  end
end

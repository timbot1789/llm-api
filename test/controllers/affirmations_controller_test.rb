require "test_helper"

class AffirmationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get affirmations_show_url
    assert_response :success
  end
end

require "test_helper"

class AffirmationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get affirmations_show_url
    assert_response :success
  end
  test "should get json" do
    get "#{affirmations_show_url}.json"
    json_res = JSON.parse response.body
    assert(json_res["pokemon"]["name"])
  end
end
